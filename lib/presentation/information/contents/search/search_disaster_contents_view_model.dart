import 'package:daepiro/presentation/information/contents/search/search_disaster_contents_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/usecase/information/search_disaster_contents_usecase.dart';

final searchDisasterContentsStateNotifierProvider = StateNotifierProvider.autoDispose<SearchDisasterContentsViewModel, SearchDisasterContentsState>((ref) {
  return SearchDisasterContentsViewModel(ref);
});

class SearchDisasterContentsViewModel extends StateNotifier<SearchDisasterContentsState> {
  final StateNotifierProviderRef<SearchDisasterContentsViewModel, SearchDisasterContentsState> ref;

  SearchDisasterContentsViewModel(this.ref) : super(SearchDisasterContentsState());

  // 재난콘텐츠 조회
  Future<void> searchDisasterContents({
    required String keyword
  }) async {
    try {
      final response = await ref.read(
          searchDisasterContentsUseCaseProvider(SearchDisasterContentsUsecase(
              keyword: keyword,
              size: "20"
          )).future
      );

      state = state.copyWith(
        searchedContentsList: response.data?.contents ?? []
      );

    } catch (error) {
      print('재난콘텐츠 검색 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }


}
