
import 'package:daepiro/data/model/response/disaster_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/community_repository.dart';

final getCommunityAllDisasterUseCaseProvider = FutureProvider<List<Data>>((ref) async {
  final repository = await ref.watch(communityRepositoryProvider);
  return await repository.getAllDisasterResult();
});

class CommunityDisasterUsecase {
  CommunityDisasterUsecase();
}