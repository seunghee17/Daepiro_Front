import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/mypage/get_mypage_articles_response.dart';
import '../../repository/mypage_repository.dart';

final getMyArticlesUseCaseProvider = FutureProvider.family<GetMyPageArticlesResponse, GetMyArticlesUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.getMyArticles(request.page, request.size);
});

class GetMyArticlesUseCase {
  final int page;
  final int size;
  GetMyArticlesUseCase({required this.page, required this.size});
}