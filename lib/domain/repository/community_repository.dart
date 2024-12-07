import 'package:daepiro/data/source/community/community_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/http/http_provider.dart';
import '../../data/model/response/disaster_response.dart';
import '../../data/repositoryimpl/community_repository_impl.dart';

final communityRepositoryProvider = Provider<CommunityRepository>((ref) {
  final http = ref.watch(dioProvider);
  return CommunityRepositoryImpl(service: CommunityService(http));
});

abstract class CommunityRepository {
  Future<List<Data>> getAllDisasterResult();
  Future<List<Data>> getReceivedDisasterResult();
}