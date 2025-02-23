import 'package:daepiro/data/model/response/home/behavior_tips_response.dart';
import 'package:daepiro/data/model/response/home/home_disaster_history_response.dart';
import 'package:daepiro/data/model/response/home/notification_response.dart';
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
    @Default("") String nickname,

    @Default(true) bool isLoading,
    @Default(false) bool isOccurred,

    @Default(0) int selectedPopularPostCategory,
    @Default(0) int selectedContentsCategory,

    @Default(true) bool isLoadingDisasterHistory,
    @Default([]) List<DisasterHistory> disasterHistoryList,

    @Default(0) int isLoadingPopularPost,
    @Default([]) List<PopularPost> popularPostList,   // selected 인기게시글 카테고리
    @Default([]) List<List<PopularPost>> allPopularPostList,   // 인기게시글 - 전체

    @Default(true) bool isLoadingContents,
    @Default([]) List<Contents> contentsList,

    @Default(true) bool isLoadingSponsor,
    @Default([]) List<Sponsor> sponsorList,

    @Default(0) int selectedDisasterHistoryType,
    @Default([]) List<DisastersData> disastersList,

    @Default(null) BehaviorData? behaviorTip,

    @Default([]) List<Notification> notificationList,

  }) = _HomeState;
}

