import 'package:daepiro/domain/usecase/community/community_article_writing_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_dongnae_content_detail_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_dongnae_content_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../data/model/request/album_model.dart';
import '../../../data/model/request/community_comment_post_request.dart';
import '../../../data/model/request/community_disaster_edit_request.dart';
import '../../../data/model/response/community_dongnae_content_response.dart';
import '../../../domain/usecase/community/community_comment_write_usecase.dart';
import '../../../domain/usecase/community/community_disaster_delete_usecase.dart';
import '../../../domain/usecase/community/community_disaster_edit_usecase.dart';
import '../../../domain/usecase/community/community_reply_like_usecase.dart';
import '../state/community_town_state.dart';

final communityTownProvider =
    StateNotifierProvider<CommunityTownViewModel, CommunityTownState>((ref) {
  return CommunityTownViewModel(ref);
});

class CommunityTownViewModel extends StateNotifier<CommunityTownState> {
  final Ref ref;
  final FlutterSecureStorage storage = FlutterSecureStorage();
  int _currentPage = 0;

  CommunityTownViewModel(this.ref) : super(CommunityTownState()) {
    _initState();
  }

  Future<void> _initState() async {
    await setUserAddressList();
    await loadContent();
  }

  Future<void> loadContent() async {
    if (!state.isDongNaeHasMore) return;
    state = state.copyWith(isDongNaeLoading: true);
    final newPage = _currentPage + 1;
    final currentList = state.contentList;
    try {
      final result = await ref.read(getCommunityDongNaeUseCaseProvider(
              CommunityDongnaeContentUseCase(
                  category: state.townCategory == '전체'
                      ? null
                      : ContentCategory.getNamedByCategory(state.townCategory),
                  status: 'ACTIVE',
                  //address: state.selectLongTownAddress,
                  address: '서울특별시 강남구',
                  page: newPage,
                  size: 20))
          .future);
      state = state.copyWith(isDongNaeContentEmpty: result.data?.empty ?? true);
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
        townCategory: type, isDongNaeHasMore: true, contentList: <Content>{});
    _currentPage = 0;
    await loadContent();
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
    final result = await ref.read(
        getCommunityDongNaeContentDetailUseCaseProvider(
                CommunityDongNaeContentDetailUseCase(id: id))
            .future);
    state = state.copyWith(
      contentDetail: result.data!,
      townReplyList: result.data!.comments,
      selectContentId: result.data?.id,
    );
  }

  void setSelectContentId(int id) {
    state = state.copyWith(selectContentId: id);
  }

  void setLoadingState(bool value) {
    state = state.copyWith(isDongNaeLoading: value);
  }

  //글쓰기 타입 지정
  void setCategoryState(String category) {
    state = state.copyWith(townCategory: category);
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

  Future<void> setUserAddressList() async {
    List<String> addressList = [];
    List<String> longAddressList = [];
    int idx = 0;
    while (true) {
      String address = await storage.read(key: 'shortAddress_$idx') ?? '';
      String longAddress = await storage.read(key: 'fullAddress_$idx') ?? '';
      if (address == '') {
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

  //대댓글 선택 상태 지정
  void setChildCommentState(bool value) {
    state = state.copyWith(isChildCommentState: value);
  }

  //삭제하려는 상태 지정
  void setDeleteState(int commentId) {
    if (state.isChildCommentState) {
      state = state.copyWith(
        deleteChildCommentId: commentId,
      );
      if (commentId == 0) {
        //삭제를 취소하려는 동작임
        state = state.copyWith(
          isChildCommentState: false,
        );
      }
    } else {
      state = state.copyWith(
        deleteCommentId: commentId,
      );
    }
  }

  void setParentCommentId(int parentCommentId) {
    //답글작성할때 필요
    state = state.copyWith(parentCommentId: parentCommentId);
  }

  //댓글 좋아요
  Future<void> replyLike(int id) async {
    await ref.read(
        communityReplyLikeUseCaseProvider(CommunityReplyLikeUseCase(id: id))
            .future);
    await getContentDetail(state.selectContentId!);
  }

  Future<void> deleteReply() async {
    if (state.isChildCommentState && state.deleteChildCommentId != 0) {
      //대댓글을 삭제하려고함
      await ref.read(getDisasterDeleteUseCaseProvider(
              CommunityDisasterDeleteUsecase(id: state.deleteChildCommentId))
          .future);
    } else if (state.deleteCommentId != 0) {
      await ref.read(getDisasterDeleteUseCaseProvider(
              CommunityDisasterDeleteUsecase(id: state.deleteCommentId))
          .future);
    }
    setDeleteState(0);
    await getContentDetail(state.selectContentId!);
  }

  void setEditState(bool value) {
    if (state.isChildCommentState) {
      state = state.copyWith(
        isEditChildCommentState: value,
      );
    } else {
      state = state.copyWith(
        isEditState: value,
      );
    }
  }

  void setReplyId(int commentId) {
    if (state.isChildCommentState) {
      state = state.copyWith(editChildCommentId: commentId);
    } else {
      state = state.copyWith(editCommentId: commentId);
    }
  }

  Future<void> editReply(String body) async {
    if (state.isChildCommentState) {
      await ref.read(getCommunityDisasterEditUseCaseProvider(
              CommunityDisasterEditUsecase(
                  id: state.editChildCommentId,
                  communityDisasterEditRequest:
                      CommunityDisasterEditRequest(body: body)))
          .future);
    } else {
      await ref.read(getCommunityDisasterEditUseCaseProvider(
              CommunityDisasterEditUsecase(
                  id: state.editCommentId,
                  communityDisasterEditRequest:
                      CommunityDisasterEditRequest(body: body)))
          .future);
    }
    await getContentDetail(state.selectContentId!);
  }

  //대댓글 작성
  Future<void> setReplyComment(String message, int parentCommentId) async {
    await ref
        .read(communityCommentWriteUseCaseProvider(CommunityCommentWriteUsecase(
            communityCommentPostRequest: CommunityCommentPostRequest(
      body: message,
      parentCommentId: parentCommentId,
      articleId: state.selectContentId,
    ))).future);
    await getContentDetail(state.selectContentId!);
  }

  Future<void> setComment(String message) async {
    await ref
        .read(communityCommentWriteUseCaseProvider(CommunityCommentWriteUsecase(
            communityCommentPostRequest: CommunityCommentPostRequest(
      body: message,
      articleId: state.selectContentId,
    ))).future);
    await getContentDetail(state.selectContentId!);
  }

  Future<void> setArticle(
    String title,
    String body,
    List<MultipartFile> attachFileList,
  ) async {
    await ref.read(setCommunityArticleWritingUseCaseProvider(
            CommunityArticleWritingUseCase(
                articleCategory:
                    ContentCategory.getNamedByCategory(state.townCategory),
                title: title,
                body: body,
                visibility: state.isVisible,
                longitude: state.longitude,
                latitude: state.latitude,
                attachFileList: attachFileList))
        .future);
  }

  Future<void> setVisibleState() async {
    bool value = state.isVisible;
    state = state.copyWith(isVisible: !value);
    if (state.isVisible) {
      await getUserLocation();
    }
  }

  void clearWritingState() {
    state = state.copyWith(
      isVisible: false,
      townCategory: '전체',
    );
  }

  Future<void> getUserLocation() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      state = state.copyWith(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } else {
      await Permission.location.request();
    }
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

  static String getByValue(String value) {
    return ContentCategory.values
        .firstWhere((el) => el.value == value)
        .getCategory();
  }

  static String getNamedByCategory(String category) {
    return ContentCategory.values
        .firstWhere((el) => el.getCategory() == category)
        .name;
  }
}
