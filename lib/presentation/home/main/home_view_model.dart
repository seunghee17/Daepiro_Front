import 'package:daepiro/domain/usecase/home/home_status_usecase.dart';
import 'package:daepiro/presentation/home/main/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeStateNotifierProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel(ref);
});

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this.ref) : super(HomeState()) {
    getHomeStatus();
  }

  final StateNotifierProviderRef<HomeViewModel, HomeState> ref;

  int _selectedPopularPostCategory = 0;
  int get selectedPopularPostCategory => _selectedPopularPostCategory;

  Future<void> getHomeStatus() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await ref.read(
          getHomeStatusUseCaseProvider(GetHomeStatusUseCase()).future
      );
      print(response.data?.isOccurred.toString());

      state = state.copyWith(
          isLoading: false,
          isOccurred: response.data?.isOccurred ?? false
      );
    } catch (error) {
      print('재난 발생상황 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  void selectPopularPostCategory(int index) {
    _selectedPopularPostCategory = index;
    // notifyListeners();
  }

}
