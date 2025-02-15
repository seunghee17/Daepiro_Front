import 'package:daepiro/data/model/response/home/behavior_tips_response.dart';
import 'package:daepiro/data/model/response/home/home_disaster_history_response.dart';
import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:daepiro/data/model/response/home/disasters_history_response.dart';
import 'package:daepiro/data/model/response/information/disaster_contents_list_response.dart';
import 'package:daepiro/data/model/response/sponsor/sponsor_list_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  factory HomeState({
    @Default("") String location,

    @Default(false) bool isLoading,
    @Default(false) bool isOccurred,

    @Default(0) int selectedPopularPostCategory,
    @Default(0) int selectedContentsCategory,

    @Default(true) bool isLoadingDisasterHistory,
    @Default([]) List<DisasterHistory> disasterHistoryList,

    @Default(0) int isLoadingPopularPost,
    @Default([]) List<PopularPost> popularPostList,   // selected 인기게시글 카테고리
    @Default([]) List<List<PopularPost>> allPopularPostList,   // 인기게시글 - 전체
    // @Default([]) List<PopularPost> popularPostList0,   // 인기게시글 - 전체
    // @Default([]) List<PopularPost> popularPostList1,   // 인기게시글 - 일상
    // @Default([]) List<PopularPost> popularPostList2,   // 인기게시글 - 교통
    // @Default([]) List<PopularPost> popularPostList3,   // 인기게시글 - 치안
    // @Default([]) List<PopularPost> popularPostList4,   // 인기게시글 - 기타

    @Default(true) bool isLoadingContents,
    @Default([]) List<Contents> contentsList,

    @Default(true) bool isLoadingSponsor,
    @Default([]) List<Sponsor> sponsorList,

    @Default(0) int selectedDisasterHistoryType,
    @Default([]) List<DisastersData> disastersList,

    @Default(null) BehaviorData? behaviorTip,
  }) = _HomeState;
}

