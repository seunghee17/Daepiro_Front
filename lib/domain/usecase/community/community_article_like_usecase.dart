import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/community_repository.dart';

final getArticleLikeUseCaseProvider =
    FutureProvider.family<BasicResponse, CommunityArticleLikeUseCase>(
        (ref, request) async {
  final repository = ref.watch(communityRepositoryProvider);
  return await repository.getArticleLike(id: request.id);
});

class CommunityArticleLikeUseCase {
  final int id;

  CommunityArticleLikeUseCase({required this.id});
}
