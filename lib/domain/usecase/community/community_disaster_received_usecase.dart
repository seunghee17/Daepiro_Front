import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/disaster_response.dart';
import '../../repository/community_repository.dart';

final getCommunityReceivedDisasterUseCaseProvider = FutureProvider.autoDispose<List<Data>>((ref) async {
  final repository = await ref.watch(communityRepositoryProvider);
  return await repository.getReceivedDisasterResult();
});

class CommunityDisasterReceivedUsecase {
  CommunityDisasterReceivedUsecase();
}