import 'package:daepiro/data/model/response/disaster_reply_response.dart';
import 'package:daepiro/domain/repository/community_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCommunityDisasterReplyUseCaseProvider = FutureProvider<List<Reply>> ((ref) async {
  final repository = await ref.watch(communityRepositoryProvider);
  return await repository.getDisasterReply();
});

class CommunityDisasterReplyUsecase {
  CommunityDisasterReplyUsecase();
}