import 'package:daepiro/domain/usecase/community/community_dongnae_content_detail_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_dongnae_content_usecase.dart';
import 'package:daepiro/presentation/community/state/community_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../data/model/request/album_model.dart';
import '../../../data/model/response/community_dongnae_content_response.dart';

final communityTownProvider =
StateNotifierProvider<CommunityTownViewModel, CommunityState>((ref) {
  return CommunityTownViewModel(ref);
});

class CommunityTownViewModel extends StateNotifier<CommunityState> {
  final Ref ref;
  final FlutterSecureStorage storage = FlutterSecureStorage();
  int _currentPage = 0;

  CommunityTownViewModel(this.ref) : super(CommunityState()) {
    _initState();
  }

  Future<void> _initState() async {
    await setUserAddressList();
    await loadContent('ALL');
  }

  Future<void> loadContent(String type) async {
    if (!state.isDongNaeHasMore) return;
    state = state.copyWith(isDongNaeLoading: true);
    final newPage = _currentPage + 1;
    final currentList = state.contentList;
    try {
      final result = await ref.read(getCommunityDongNaeUseCaseProvider(
          CommunityDongnaeContentUseCase(
              category: type == 'ALL' ? null : type,
              status: 'ACTIVE',
              address: state.selectLongTownAddress,
              page: newPage,
              size: 20)).future);
      state = state.copyWith(
          isDongNaeContentEmpty: result.data?.empty ?? true
      );
      if (state.isDongNaeContentEmpty) {
        state = state.copyWith(
          isDongNaeHasMore: false,
          isDongNaeLoading: false,
        );
      } else {
        final newContent = result.data?.content ?? [];
        _currentPage = newPage;
        state = state.copyWith(
          contentList: [...currentList, ...newContent].toSet(),
          isDongNaeHasMore: true,
        );
      }
    } catch (e) {
      print('동네생활 viewmodel 에러발생 ${e}');
    } finally {
      state = state.copyWith(isDongNaeLoading: false);
    }
  }

  Future<void> selectButton(String type) async {
    state = state.copyWith(
        townCommunityType: type,
        isDongNaeHasMore: true,
        contentList: <Content>{}
    );
    _currentPage = 0;
    await loadContent(type);
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


  Future<void> getContentDetail(int id) async {
    final result = await ref.read(getCommunityDongNaeContentDetailUseCaseProvider(
      CommunityDongNaeContentDetailUseCase(id: id)
    ).future);
    state = state.copyWith(
        contentDetail: result.data!,
    );
  }

  String setContentCategory(String value) {
    ContentCategory category = ContentCategory.getByValue(value);
    String result = category.getCategory();
    return result;
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

  Future<void> setUserAddressList() async {
    List<String> addressList = [];
    List<String> longAddressList = [];
    int idx = 0;
    while(true) {
      String address = await storage.read(key: 'shortAddress_$idx') ?? '';
      String longAddress = await storage.read(key: 'fullAddress_$idx') ?? '';
      if(address == '') {
        break;
      } else {
        addressList.add(address);
        longAddressList.add(longAddress);
        idx++;
      }
    }
    state = state.copyWith(
      townList: addressList,
      townLongAddressList: longAddressList,
      selectLongTownAddress: longAddressList[0],
      selectTown: addressList[0],
    );
  }

  void setSelectAddress(int index) {
    state = state.copyWith(
        selectTown: state.townList[index],
        selectLongTownAddress: state.townLongAddressList[index],
    );
  }

}

enum ContentCategory {
  ALL('ALL'),
  LIFE('LIFE'),
  TRAFFIC('TRAFFIC'),
  SAFE('SAFE'),
  OTHER('OTHER');

  final String value;
  const ContentCategory(this.value);

  String getCategory() {
    switch (this) {
      case ContentCategory.LIFE:
        return '일상';
      case ContentCategory.TRAFFIC:
        return '교통';
      case ContentCategory.SAFE:
        return '치안';
      case ContentCategory.OTHER:
        return '기타';
      default:
        return '전체';
    }
  }

  static ContentCategory getByValue(String value) {
    return ContentCategory.values.firstWhere(
        (el) => el.value == value
    );
  }
}