import 'package:daepiro/presentation/community/community_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../data/model/request/album_model.dart';

final communityDisasterProvider =
    StateNotifierProvider<CommunityDisasterViewModel, CommunityState>((ref) {
  return CommunityDisasterViewModel(CommunityState());
});

class CommunityDisasterViewModel extends StateNotifier<CommunityState> {
  CommunityDisasterViewModel(super.state);


  void clickReceiveButton() {
    bool current = state.receiveButton;
    state = state.copyWith(receiveButton: current);
  }

  void clickAllButton() {
    bool current = state.AllButton;
    state = state.copyWith(AllButton: !current, receiveButton: current);
  }

  void changeScreenState(bool isdisasterScreen) {
    state = state.copyWith(isDisasterScreen: isdisasterScreen);
  }

  //이미지 접근권한 확인
  Future<void> checkPermission() async {
    await PhotoManager.requestPermissionExtend().then((ps) {
      if (ps.isAuth) {
        getAlbums();
      } else {
        PhotoManager.openSetting();
      }
    });
  }

  Future<void> getAlbums() async {
    try {
      List<AlbumModel> newAlbums = [];
      var paths = await PhotoManager.getAssetPathList(type: RequestType.image);
      for(var asset in paths) {
        var images = await asset.getAssetListRange(start: 0, end: 10000);
        if(images.isNotEmpty) {
          var album = AlbumModel(
              id: asset.id,
              name: asset.name,
              images: images);
          newAlbums.add(album);
        }
      }
      state = state.copyWith(albums: newAlbums);
    } catch(e) {
      print('에러 발생 $e');
    }
  }

  void addSelectedAlbum(AlbumModel photo) {
    if(!state.selectAlbums.contains(photo)) {
      state = state.copyWith(selectAlbums: [...state.selectAlbums, photo]);
    }
  }

  void deselectPhoto(AlbumModel photo) {
    state = state.copyWith(selectAlbums: state.selectAlbums.where((p) => p.id != photo.id).toList());
  }



  void setCurrentAlbumIndex(int index) {
    state = state.copyWith(currentAlbumIndex: index);
  }

}
