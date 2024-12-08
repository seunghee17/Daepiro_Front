import 'package:daepiro/data/model/response/disaster_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/request/album_model.dart';
import '../../../data/model/response/disaster_reply_response.dart';

part 'community_state.freezed.dart';

@freezed
sealed class CommunityState with _$CommunityState {
  factory CommunityState({
    //현재 보여지는 상태
    @Default(true) bool isDisasterScreen,

    @Default(false) bool isDeleteComplete,
    @Default(null) String? reportType,
    //갤러리 관련 상태 변수
    @Default([]) List<AlbumModel> albums,
    @Default(0) int currentAlbumIndex,
    @Default([]) List<AlbumModel> selectAlbums,
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
    @Default([]) List<Reply> disasterReplyList
  }) = _CommunityState;
}
