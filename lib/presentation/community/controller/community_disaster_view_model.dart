import 'package:daepiro/domain/usecase/community/community_disaster_edit_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_disaster_reply_usecase.dart';
import 'package:daepiro/presentation/community/state/community_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../data/model/request/album_model.dart';
import '../../../data/model/request/community_disaster_edit_request.dart';
import '../../../domain/usecase/community/community_disaster_delete_usecase.dart';
import '../../../domain/usecase/community/community_disaster_received_usecase.dart';
import '../../../domain/usecase/community/community_disaster_usecase.dart';

final communityDisasterProvider =
    StateNotifierProvider<CommunityDisasterViewModel, CommunityState>((ref) {
      return CommunityDisasterViewModel(ref);
});

class CommunityDisasterViewModel extends StateNotifier<CommunityState> {
  final Ref ref;

  CommunityDisasterViewModel(this.ref) : super(CommunityState()) {
    _initState();
  }

  Future<void> _initState() async {
    try {
      await getReceivedDisasterResponse();
      await getAllDisasterResponse();
    } catch(e) {
      print('error initialization: $e');
    } finally {
      state = state.copyWith(isLoading: false);
    }
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
      for (var asset in paths) {
        var images = await asset.getAssetListRange(start: 0, end: 10000);
        if (images.isNotEmpty) {
          var album =
              AlbumModel(id: asset.id, name: asset.name, images: images);
          newAlbums.add(album);
        }
      }
      state = state.copyWith(albums: newAlbums);
    } catch (e) {
      print('에러 발생 $e');
    }
  }

  void addSelectedAlbum(AlbumModel photo) {
    if (!state.selectAlbums.contains(photo)) {
      state = state.copyWith(selectAlbums: [...state.selectAlbums, photo]);
    }
  }

  void deselectPhoto(AlbumModel photo) {
    state = state.copyWith(
        selectAlbums:
            state.selectAlbums.where((p) => p.id != photo.id).toList());
  }

  void setCurrentAlbumIndex(int index) {
    state = state.copyWith(currentAlbumIndex: index);
  }

  Future<void> getAllDisasterResponse() async {
    final result = await ref.read(
      getCommunityAllDisasterUseCaseProvider.future,
    );
    state =
        state.copyWith(allDisasterResponse: result, listLength: result.length);
    if(result.length >0) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getReceivedDisasterResponse() async {
    final result = await ref.read(
      getCommunityReceivedDisasterUseCaseProvider.future,
    );
    state = state.copyWith(
        receivedDisasterResponse: result, listLength: result.length);
    if(result.length>0) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> selectButton(String type) async {
    state = state.copyWith(disasterCommunityType: type);
    if (type == 'all') {
      await getAllDisasterResponse();
    } else {
      await getReceivedDisasterResponse();
    }
  }

  String parseDateTime(String timeText) {
    if (timeText == '') {
      return '';
    }
    DateTime dateTime = DateTime.parse(timeText).toLocal();
    String period = dateTime.hour >= 12 ? '오후' : '오전';
    int hour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    hour = hour == 0 ? 12 : hour;
    String minute = dateTime.minute.toString().padLeft(2, '0');
    return '${period} ${hour}시 ${minute}분';
  }

  String parseCommentTime(String timeText) {
    if (timeText == '') {
      return '';
    }
    DateTime dateTime = DateTime.parse(timeText).toLocal();
    DateTime currentTime = DateTime.now();
    Duration differ = currentTime.difference(dateTime);

    if (differ.inMinutes < 1) {
      return '방금 전';
    } else if (differ.inMinutes < 60) {
      return '${differ.inMinutes}분전';
    } else if (differ.inHours < 24) {
      return '${differ.inHours} 시간전';
    } else {
      return '';
    }
  }

  String parseTitle(String title, String type) {
    if(!title.contains(type)) {
      return title;
    }
    int typeIndex = title.indexOf(type);
    return title.substring(0, typeIndex);
  }

  void setLoadingState(bool value) {
    state = state.copyWith(isLoading: value);
  }

  Future<void> getReplyData() async {
    state = state.copyWith(isReplyLoading: true);
    final result = await ref.read(getCommunityDisasterReplyUseCaseProvider.future);
    state = state.copyWith(disasterReplyList: result, isReplyLoading: false);
  }

  Future<void> deleteReply(int commentId) async {
    await ref.read(
        getDisasterDeleteUseCaseProvider(CommunityDisasterDeleteUsecase(commentId: commentId)).future);
    await getReplyData();
  }

  Future<void> editReply(int commentId, CommunityDisasterEditRequest communityDisasterEditRequest) async {
    await ref.read(
        getCommunityDisasterEditUseCaseProvider(CommunityDisasterEditUsecase(commentId: commentId, communityDisasterEditRequest: communityDisasterEditRequest)).future);
  }

  void setDeleteState(bool value) {
    state = state.copyWith(isDeleteComplete: value);
  }
}
