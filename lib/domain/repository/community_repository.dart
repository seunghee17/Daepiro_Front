import 'package:daepiro/data/model/response/disaster_reply_response.dart';
import 'package:daepiro/data/source/community/community_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/http/http_provider.dart';
import '../../data/model/request/community_disaster_edit_request.dart';
import '../../data/model/response/community_disaster_edit_response.dart';
import '../../data/model/response/disaster_reply_delete_response.dart';
import '../../data/model/response/disaster_response.dart';
import '../../data/repositoryimpl/community_repository_impl.dart';

final communityRepositoryProvider = Provider<CommunityRepository>((ref) {
  final http = ref.watch(dioProvider);
  return CommunityRepositoryImpl(service: CommunityService(http));
});

abstract class CommunityRepository {
  Future<List<Data>> getAllDisasterResult();

  Future<List<Data>> getReceivedDisasterResult();

  Future<List<Reply>> getDisasterReply();

  Future<DeleteReplyResponse> deleteReply(int commentId);

  Future<CommunityDisasterEditResponse> editReply(
      {required int commentId,
      required CommunityDisasterEditRequest communityDisasterEditRequest});
}
