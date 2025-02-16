
import 'package:daepiro/data/model/response/community/disaster_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/community_repository.dart';

final getCommunityDisasterSituationUseCaseProvider = FutureProvider.autoDispose<List<Disaster>>((ref) async {
  final repository = ref.watch(communityRepositoryProvider);
  return await repository.getDisasterSituation();
});

class CommunityDisasterUsecase {
  CommunityDisasterUsecase();
}