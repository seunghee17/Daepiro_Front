import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/community/community_reply_like_response.dart';
import '../../repository/community_repository.dart';

final communityReplyLikeUseCaseProvider = FutureProvider.family<
    CommunityReplyLikeResponse,
    CommunityReplyLikeUseCase>((ref, request) async {
  final repository = ref.watch(communityRepositoryProvider);
  return await repository.communityReplyLike(id: request.id);
});

class CommunityReplyLikeUseCase {
  final int id;

  CommunityReplyLikeUseCase({required this.id});
}
