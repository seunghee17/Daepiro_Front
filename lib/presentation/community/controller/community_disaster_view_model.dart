import 'package:daepiro/data/model/request/community_comment_post_request.dart';
import 'package:daepiro/domain/usecase/community/community_disaster_edit_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_disaster_reply_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_reply_like_usecase.dart';
import 'package:daepiro/presentation/community/state/community_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../data/model/request/album_model.dart';
import '../../../data/model/request/community_disaster_edit_request.dart';
import '../../../domain/usecase/community/community_comment_write_usecase.dart';
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
    } catch (e) {
      print('error initialization: $e');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void changeScreenState(bool isdisasterScreen) {
    state = state.copyWith(isDisasterScreen: isdisasterScreen);
    if(state.isDisasterScreen) {
      reloadData();
    }
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
    state = state.copyWith(isLoading: true);
    final result = await ref.read(
      getCommunityAllDisasterUseCaseProvider.future,
    );
    state = state.copyWith(
        allDisasterResponse: result,
        listLength: result.length,
        isLoading: false);
  }

  Future<void> getReceivedDisasterResponse() async {
    state = state.copyWith(isLoading: true);
    final result = await ref.read(
      getCommunityReceivedDisasterUseCaseProvider.future,
    );
    state = state.copyWith(
        receivedDisasterResponse: result,
        listLength: result.length,
        isLoading: false);
  }

  Future<void> selectButton(String type) async {
    state = state.copyWith(disasterCommunityType: type);
    if (type == 'all') {
      await getAllDisasterResponse();
    } else {
      await getReceivedDisasterResponse();
    }
  }

  Future<void> getReloadDisasterData() async {
    try {
      final type = state.disasterCommunityType;
      if (type == 'all') {
        await getAllDisasterResponse();
      } else {
        await getReceivedDisasterResponse();
      }
    } catch (e) {
      print('재난상황 재로드 오류발생 CommunityDisasterViewModel: $e');
    }
  }

  Future<void> reloadData() async {
    try {
      if (state.selectSituaionId != null)
        await getReplyData(state.selectSituaionId!);
      await getReloadDisasterData();
    } catch (e) {
      print('Error reloading data: $e');
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
    if (!title.contains(type)) {
      return title;
    }
    int typeIndex = title.indexOf(type);
    return title.substring(0, typeIndex);
  }

  void setLoadingState(bool value) {
    state = state.copyWith(isLoading: value);
  }

  Future<void> getReplyData(int situationId) async {
    state = state.copyWith(isReplyLoading: true);
    final result = await ref.read(getCommunityDisasterReplyUseCaseProvider(
            CommunityDisasterReplyUsecase(situationId: situationId))
        .future);
    state = state.copyWith(
      disasterReplyList: result,
      isReplyLoading: false,
      selectSituaionId: situationId,
    );
  }

  Future<void> setComment(String message) async {
    await ref
        .read(communityCommentWriteUseCaseProvider(CommunityCommentWriteUsecase(
            communityCommentPostRequest: CommunityCommentPostRequest(
      body: message,
      articleId: state.selectSituaionId,
    ))).future);
    await reloadData();
  }

  //대댓글 작성
  Future<void> setReplyComment(String message, int parentCommentId) async {
    await ref
        .read(communityCommentWriteUseCaseProvider(CommunityCommentWriteUsecase(
        communityCommentPostRequest: CommunityCommentPostRequest(
          body: message,
          parentCommentId: parentCommentId,
          articleId: state.selectSituaionId,
        ))).future);
    await reloadData();
  }

  Future<void> deleteReply() async {
    if(state.isChildCommentState && state.deleteChildCommentId!=0) {
      //대댓글을 삭제하려고함
      await ref.read(getDisasterDeleteUseCaseProvider(
          CommunityDisasterDeleteUsecase(id: state.deleteChildCommentId))
          .future);
    } else if(state.deleteCommentId !=0) {
      await ref.read(getDisasterDeleteUseCaseProvider(
          CommunityDisasterDeleteUsecase(id: state.deleteCommentId))
          .future);
    }
    setDeleteState(0);
    await reloadData();
  }

  Future<void> editReply(String body) async {
    if(state.isChildCommentState) {
      await ref.read(getCommunityDisasterEditUseCaseProvider(
          CommunityDisasterEditUsecase(
              id: state.editChildCommentId,
              communityDisasterEditRequest: CommunityDisasterEditRequest(body: body)))
          .future);
    } else {
      await ref.read(getCommunityDisasterEditUseCaseProvider(
          CommunityDisasterEditUsecase(
              id: state.editCommentId,
              communityDisasterEditRequest:
              CommunityDisasterEditRequest(body: body)))
          .future);
    }
    await reloadData();
  }

  void setDeleteState(int commentId) {
    if(state.isChildCommentState) {
      state = state.copyWith(
        deleteChildCommentId: commentId,
      );
      if(commentId ==0) {
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

  void setEditState(bool value) {
    if(state.isChildCommentState) {
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
    if(state.isChildCommentState) {
      state = state.copyWith(editChildCommentId: commentId);
    } else {
      state = state.copyWith(editCommentId: commentId);
    }
  }

  void setParentCommentId(int parentCommentId) {
    //답글작성할때 필요
    state = state.copyWith(parentCommentId: parentCommentId);
  }

  void clearDisasterReplyData() {
    state = state.copyWith(selectSituaionId: null, disasterReplyList: []);
  }

  Future<void> replyLike(int id) async {
    await ref.read(
        communityReplyLikeUseCaseProvider(CommunityReplyLikeUseCase(id: id))
            .future);
    await reloadData();
  }

  void setSelectSituationId(int situationId) {
    state = state.copyWith(selectSituaionId: situationId);
  }

  void setChildCommentState(bool value) {
    state = state.copyWith(isChildCommentState: value);
  }
}
