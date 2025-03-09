import 'package:daepiro/data/model/response/home/behavior_tips_response.dart';
import 'package:daepiro/data/model/response/home/home_disaster_history_response.dart';
import 'package:daepiro/data/model/response/home/notification_response.dart';
import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:daepiro/data/model/response/home/disasters_history_response.dart';
import 'package:daepiro/data/model/response/information/disaster_contents_list_response.dart';
import 'package:daepiro/data/model/response/sponsor/sponsor_list_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/response/home/home_disaster_feed_response.dart';
import '../../../data/model/response/information/around_shelter_list_response.dart';
part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  factory HomeState({
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default("") String location,        // 현재 위치는 ㅇㅇ
    @Default("") String nickname,

    @Default(true) bool isLoading,
    @Default(false) bool isOccurred,

    // --재난 발생시
    @Default(null) HomeDisaster? disasterInfo,
    @Default(null) BehaviorData? disasterBehaviorTip,
    // --재난 발생시

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

    @Default(true) bool historyIsLoading,
    @Default(0) int selectedDisasterHistoryType,
    @Default([]) List<DisastersData> disastersList,

    @Default(null) BehaviorData? behaviorTip,

    @Default([]) List<Notification> notificationList,

    @Default(true) bool isLoadingShelters,
    @Default("") String shelterLocation,
    @Default([]) List<Shelters> shelterList,    // 주변 대피소 리스트
    @Default([]) List<Shelters> civilShelterList,    // 주변 대피소 리스트(민방위)
    @Default([]) List<Shelters> earthquakeShelterList,    // 주변 대피소 리스트(지진)
    @Default([]) List<Shelters> tsunamiShelterList,    // 주변 대피소 리스트(지진해일)
    @Default([]) List<Shelters> temperatureShelterList,    // 주변 대피소 리스트(쉼터)
  }) = _HomeState;
}

