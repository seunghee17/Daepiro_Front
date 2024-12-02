import 'package:daepiro/domain/usecase/home/home_disaster_history_usecase.dart';
import 'package:daepiro/domain/usecase/home/home_status_usecase.dart';
import 'package:daepiro/presentation/home/main/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeStateNotifierProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel(ref);
});

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this.ref) : super(HomeState()) {
    getHomeStatus();
    getHomeDisasterHistory();
  }

  final StateNotifierProviderRef<HomeViewModel, HomeState> ref;

  int _selectedPopularPostCategory = 0;
  int get selectedPopularPostCategory => _selectedPopularPostCategory;

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
    } catch (error) {
      print('재난 발생상황 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  // 홈 화면 재난문자 내역 조회
  Future<void> getHomeDisasterHistory() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await ref.read(
          getHomeDisasterHistoryUseCaseProvider(GetHomeDisasterHistoryUseCase()).future
      );

      state = state.copyWith(
          isLoading: false,
      );
    } catch (error) {
      print('재난문자 내역 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  void selectPopularPostCategory(int index) {
    _selectedPopularPostCategory = index;
    // notifyListeners();
  }

}
