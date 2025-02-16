import 'package:daepiro/data/model/request/community_comment_post_request.dart';
import 'package:daepiro/data/model/response/community/community_comment_post_response.dart';
import 'package:daepiro/domain/repository/community_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communityCommentWriteUseCaseProvider = FutureProvider.family<CommunityCommentPostResponse, CommunityCommentWriteUsecase> ((ref, request) async {
  final repository = ref.watch(communityRepositoryProvider);
  return await repository.setComment(request.communityCommentPostRequest);
});

class CommunityCommentWriteUsecase {
  final CommunityCommentPostRequest communityCommentPostRequest;
  CommunityCommentWriteUsecase({required this.communityCommentPostRequest});
}