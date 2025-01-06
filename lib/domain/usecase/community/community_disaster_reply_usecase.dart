import 'package:daepiro/data/model/response/disaster_reply_response.dart';
import 'package:daepiro/domain/repository/community_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCommunityDisasterReplyUseCaseProvider = FutureProvider.family<List<Reply>, CommunityDisasterReplyUsecase> ((ref, request) async {
  final repository = await ref.watch(communityRepositoryProvider);
  return await repository.getDisasterReply(request.situationId);
});

class CommunityDisasterReplyUsecase {
  final int situationId;
  CommunityDisasterReplyUsecase({required this.situationId});
}