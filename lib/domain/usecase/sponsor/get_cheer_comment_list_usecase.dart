import 'package:daepiro/data/model/response/sponsor/cheer_comment_response.dart';
import 'package:daepiro/domain/repository/sponsor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCheerCommentListUsecaseProvider = FutureProvider
    .family<CheerCommentResponse, GetCheerCommentListUsecase>((ref, request) async {
  final repository = ref.watch(sponsorRepositoryProvider);
  return await repository.getCheerCommentList();
});

class GetCheerCommentListUsecase {
  GetCheerCommentListUsecase();
}
