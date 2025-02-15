import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:daepiro/domain/repository/home_repository.dart';
import 'package:daepiro/domain/repository/sponsor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPopularPostUsecaseProvider = FutureProvider
    .family<PopularPostResponse, GetPopularPostUsecase>((ref, request) async {
  final repository = ref.watch(homeRepositoryProvider);
  return await repository.getPopularPostList(
    request.category
  );
});

class GetPopularPostUsecase {
  final String category;

  GetPopularPostUsecase({
    required this.category,
  });
}
