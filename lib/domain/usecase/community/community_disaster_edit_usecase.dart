
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/request/community_disaster_edit_request.dart';
import '../../../data/model/response/community/community_disaster_edit_response.dart';
import '../../repository/community_repository.dart';

final getCommunityDisasterEditUseCaseProvider = FutureProvider.family<CommunityDisasterEditResponse, CommunityDisasterEditUsecase>((ref, request) async {
  final repository = ref.watch(communityRepositoryProvider);
  return await repository.editReply(id: request.id, communityDisasterEditRequest: request.communityDisasterEditRequest);
});

class CommunityDisasterEditUsecase {
  final int id;
  final CommunityDisasterEditRequest communityDisasterEditRequest;

  CommunityDisasterEditUsecase({required this.id, required this.communityDisasterEditRequest});
}