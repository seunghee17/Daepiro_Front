import 'package:daepiro/data/model/response/disaster_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/model/response/disaster_reply_response.dart';

part 'community_disaster_state.freezed.dart';

@freezed
sealed class CommunityDisasterState with _$CommunityDisasterState {
  factory CommunityDisasterState({
//---------------------------------------------------------
// 재난상황
//---------------------------------------------------------
    //현재 보여지는 상태
    @Default(true) bool isDisasterScreen,
    @Default(null) int? selectSituaionId,

    //대댓글 작성시 필요한 부모 댓글 id
    @Default(0) int parentCommentId,

    //대댓글을 선택한지에 대한 여부
    @Default(false) isChildCommentState, //moreinfo를 누를때부터 true로 활성화됨
    @Default(0) int deleteChildCommentId,
    @Default(0) int editChildCommentId, //2
    @Default(false) bool isEditChildCommentState, //1

    //댓글 삭제를 위해 필요한 데이터
    @Default(0) int deleteCommentId,

    //댓글 수정을 위한 상태 데이터
    @Default(false) bool isEditState,
    @Default(0) int editCommentId,
    @Default(null) String? reportType,

    //커뮤니티 유형별 데이터 상태
    @Default([]) List<Data> allDisasterResponse,
    @Default([]) List<Data> receivedDisasterResponse,
    @Default(0) int listLength,

    //재난상황 로드 상태
    @Default(true) bool isLoading,
    //재난상황 댓글 로드 상태
    @Default(true) bool isReplyLoading,

    //재난상황 커뮤니티 타입
    @Default('all') String disasterCommunityType,

    //재난상황 댓글 상태
    @Default([]) List<Reply> disasterReplyList,

    //신고 유형
    @Default('') String reporyType,
  }) = _CommunityDisasterState;
}
