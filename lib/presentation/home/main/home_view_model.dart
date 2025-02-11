import 'package:daepiro/domain/usecase/home/get_popular_post_usecase.dart';
import 'package:daepiro/domain/usecase/home/get_disasters_history_usecase.dart';
import 'package:daepiro/domain/usecase/home/home_disaster_feed_usecase.dart';
import 'package:daepiro/domain/usecase/home/home_disaster_history_usecase.dart';
import 'package:daepiro/domain/usecase/home/home_status_usecase.dart';
import 'package:daepiro/presentation/home/main/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/information/get_disaster_contents_list_usecase.dart';
import '../../../domain/usecase/sponsor/get_sponsor_list_usecase.dart';

final homeStateNotifierProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel(ref);
});

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this.ref) : super(HomeState()) {
    getHomeStatus();
    getHomeDisasterHistory();
    getPopularPostList(category: "LIFE");
    getDisasterContentsList();
    getSponsorList();
  }

  final StateNotifierProviderRef<HomeViewModel, HomeState> ref;

  void selectPopularPostCategory(int index) {
    state = state.copyWith(
      selectedPopularPostCategory: index
    );
  }

  void selectContentsCategory(int index) {
    state = state.copyWith(
        selectedContentsCategory: index
    );
  }

  // 홈 화면에서 재난이 발생했는지 조회
  Future<void> getHomeStatus() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await ref.read(
          getHomeStatusUseCaseProvider(GetHomeStatusUseCase()).future
      );

      state = state.copyWith(
          isLoading: false,
          isOccurred: response.data?.isOccurred ?? false
      );

      if (response.data?.isOccurred == true) {
        getHomeDisasterFeed();
      } else {

      }
    } catch (error) {
      print('재난 발생상황 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  // 홈 화면 재난문자 내역 조회
  Future<void> getHomeDisasterHistory() async {
    try {
      final response = await ref.read(
          getHomeDisasterHistoryUseCaseProvider(GetHomeDisasterHistoryUseCase()).future
      );

      if (response.code == 1000) {
        state = state.copyWith(
            disasterHistoryList: response.data ?? []
        );
      }

    } catch (error) {
      print('재난문자 내역 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  // 홈 화면 동네생활 인기글 조회
  Future<void> getPopularPostList({
    required String category
  }) async {
    try {
      final response = await ref.read(
          getPopularPostUsecaseProvider((GetPopularPostUsecase(category: category))).future
      );

      if (response.code == 1000) {
        state = state.copyWith(
            popularPostList: response.data ?? []
        );
      }
    } catch (error) {
      print('동네생활 인기글 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  // 재난콘텐츠 목록 조회
  Future<void> getDisasterContentsList() async {
    try {
      final response = await ref.read(
          getDisasterContentsListUseCaseProvider(GetDisasterContentsListUseCase(
              sortType: "latest",
              size: "10"
          )).future
      );

      state = state.copyWith(
          contentsList: response.data?.contents ?? []
      );
    } catch (error) {
      print('재난콘텐츠 목록 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  // 후원목록 조회
  Future<void> getSponsorList() async {
    try {
      final response = await ref.read(
          getSponsorListUsecaseProvider(GetSponsorListUsecase()).future
      );

      state = state.copyWith(
          sponsorList: response.data ?? []
      );
    } catch (error) {
      print('후원목록 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  // 최근 재난문자 내역 조회
  Future<void> getDisastersHistory() async {
    try {
      final response = await ref.read(
          getRecentDisastersUsecaseProvider(GetDisastersHistoryUsecase()).future
      );

      if (response.code == 1000) {
        state = state.copyWith(
          disastersList: response.data ?? [],
        );
      }
    } catch (error) {
      print('최근 재난문자 내역 조회 에러: $error');
    }
  }

  void selectDisasterHistoryType(int index) async {
    state = state.copyWith(
      selectedDisasterHistoryType: index,
    );
  }

  // 재난 발생했을 때 재난 상세내용 조회
  Future<void> getHomeDisasterFeed() async {
    try {
      final response = await ref.read(
          getHomeDisasterFeedUseCaseProvider(GetHomeDisasterFeedUseCase()).future
      );



    } catch (error) {
      print('재난문자 내역 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }


}
