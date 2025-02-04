import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/response/community/disaster_reply_delete_response.dart';
import '../../repository/community_repository.dart';

final getDisasterDeleteUseCaseProvider =
    FutureProvider.family<DeleteReplyResponse, CommunityDisasterDeleteUsecase>(
        (ref, request) async {
  final repository = await ref.watch(communityRepositoryProvider);
  return await repository.deleteReply(request.id);
});

class CommunityDisasterDeleteUsecase {
  final int id;

  CommunityDisasterDeleteUsecase({required this.id});
}
