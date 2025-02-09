import 'package:daepiro/data/model/response/home/home_disaster_history_response.dart';
import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:daepiro/data/model/response/information/disaster_contents_list_response.dart';
import 'package:daepiro/data/model/response/sponsor/sponsor_list_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool isOccurred,

    @Default(0) int selectedPopularPostCategory,
    @Default(0) int selectedContentsCategory,

    @Default([]) List<DisasterHistory> disasterHistoryList,
    @Default([]) List<PopularPost> popularPostList,
    @Default([]) List<Contents> contentsList,
    @Default([]) List<Sponsor> sponsorList,
    // @Default([[],[],[],[],[]]) List<List<PopularPost>> popularPostList,
  }) = _HomeState;
}

