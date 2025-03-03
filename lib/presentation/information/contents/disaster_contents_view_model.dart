import 'package:daepiro/domain/usecase/information/get_disaster_contents_list_usecase.dart';
import 'package:daepiro/presentation/information/contents/disaster_contents_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final disasterContentsStateNotifierProvider = StateNotifierProvider<DisasterContentsViewModel, DisasterContentsState>((ref) {
  return DisasterContentsViewModel(ref);
});

class DisasterContentsViewModel extends StateNotifier<DisasterContentsState> {
  final StateNotifierProviderRef<DisasterContentsViewModel, DisasterContentsState> ref;
  DisasterContentsViewModel(this.ref) : super(DisasterContentsState());

  // 재난콘텐츠 목록 조회
  Future<void> getDisasterContentsList({
    String sortType = "latest",
    String size = "20",
    String cursor = "",
  }) async {
    // state = state.copyWith(
    //   isLoading: true
    // );

    try {
      final response = await ref.read(
          getDisasterContentsListUseCaseProvider(GetDisasterContentsListUseCase(
            sortType: sortType,
            size: size,
            cursor: cursor,
          )).future
      );

      state = state.copyWith(
          contentsList: state.copyWith().contentsList + (response.data?.contents ?? []),
          isLoading: false,
          nextCursor: response.data?.nextCursor.toString() ?? ""
      );

    } catch (error) {
      print('재난콘텐츠 목록 조회 에러: $error');
    }
  }

}
