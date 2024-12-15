import 'package:daepiro/domain/usecase/home/home_status_usecase.dart';
import 'package:daepiro/domain/usecase/information/get_disaster_contents_usecase.dart';
import 'package:daepiro/presentation/information/main/information_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final informationStateNotifierProvider = StateNotifierProvider<InformationViewModel, InformationState>((ref) {
  return InformationViewModel(ref);
});

class InformationViewModel extends StateNotifier<InformationState> {
  InformationViewModel(this.ref) : super(InformationState()) {
    getDisasterContents();
  }

  final StateNotifierProviderRef<InformationViewModel, InformationState> ref;

  void selectAroundShelterType(int index) {
    state = state.copyWith(selectedAroundShelterType: index);
  }

  // 재난콘텐츠 조회
  Future<void> getDisasterContents() async {
    try {
      final response = await ref.read(
          getDisasterContentsUseCaseProvider(GetDisasterContentsUseCase()).future
      );

      state = state.copyWith(
        contentsList: response.data?.contents ?? []
      );

    } catch (error) {
      print('재난콘텐츠 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }


}
