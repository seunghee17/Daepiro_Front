import 'package:daepiro/domain/usecase/information/get_disaster_contents_list_usecase.dart';
import 'package:daepiro/presentation/information/contents/disaster_contents_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final disasterContentsStateNotifierProvider = StateNotifierProvider<DisasterContentsViewModel, DisasterContentsState>((ref) {
  return DisasterContentsViewModel(ref);
});

class DisasterContentsViewModel extends StateNotifier<DisasterContentsState> {
  DisasterContentsViewModel(this.ref) : super(DisasterContentsState()) {
    getDisasterContentsList();
  }

  final StateNotifierProviderRef<DisasterContentsViewModel, DisasterContentsState> ref;

  // 재난콘텐츠 목록 조회
  Future<void> getDisasterContentsList({
    String sortType = "latest",
    String size = "20"
  }) async {
    try {
      final response = await ref.read(
          getDisasterContentsListUseCaseProvider(GetDisasterContentsListUseCase(
            sortType: sortType,
            size: size
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

}
