import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/domain/repository/community_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final setCommunityArticleDeleteUseCaseProvider =
FutureProvider.family<BasicResponse, CommunityArticleDeleteUseCase>(
        (ref, request) async {
      final repository = ref.watch(communityRepositoryProvider);
      return await repository.deleteArticle(id: request.id);
    }
);

class CommunityArticleDeleteUseCase {
  final int id;
  CommunityArticleDeleteUseCase({required this.id});
}