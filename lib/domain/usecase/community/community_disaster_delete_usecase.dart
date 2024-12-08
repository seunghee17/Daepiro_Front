import 'package:daepiro/data/model/response/disaster_reply_delete_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repository/community_repository.dart';

final getDisasterDeleteUseCaseProvider =
    FutureProvider.family<DeleteReplyResponse, CommunityDisasterDeleteUsecase>(
        (ref, request) async {
  final repository = await ref.watch(communityRepositoryProvider);
  return await repository.deleteReply(request.commentId);
});

class CommunityDisasterDeleteUsecase {
  final int commentId;

  CommunityDisasterDeleteUsecase({required this.commentId});
}
