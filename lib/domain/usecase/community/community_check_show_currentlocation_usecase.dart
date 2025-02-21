import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/request/community_check_current_location_request.dart';
import '../../../data/model/response/basic_response.dart';
import '../../../data/model/response/community/community_check_location_response.dart';
import '../../repository/community_repository.dart';

final communityCheckShowCurrentLocationUseCaseProvider = FutureProvider.family<CheckShowCurrentLocation, CommunityCheckShowCurrentlocationUsecase>((ref, request) async {
  final repository = await ref.watch(communityRepositoryProvider);
  return await repository.checkShowCurrentLocation(
      communityCheckCurrentLocationRequest: request.communityCheckCurrentLocationRequest);
});

class CommunityCheckShowCurrentlocationUsecase {
  final CommunityCheckCurrentLocationRequest communityCheckCurrentLocationRequest;

  CommunityCheckShowCurrentlocationUsecase(
      {required this.communityCheckCurrentLocationRequest});
}