import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/request/community_writing_edit_request.dart';
import '../../../data/model/response/community/community_writing_edit_response.dart';
import '../../repository/community_repository.dart';

final setCommunityArticleEditUseCaseProvider =
FutureProvider.family<CommunityWritingEditResponse, CommunityArticleEditUseCase>(
        (ref, request) async {
      final repository = await ref.watch(communityWritingRepositoryProvider);
      return await repository.editArticle(
        id: request.id,
          communityWritingEditRequest: request.communityWritingEditRequest,
          attachFileList: request.attachFileList
      );
    }
);

class CommunityArticleEditUseCase {
  final int id;
  final CommunityWritingEditRequest communityWritingEditRequest;
  final List<MultipartFile> attachFileList;

  CommunityArticleEditUseCase({
    required this.id,
    required this.communityWritingEditRequest,
    required this.attachFileList,
  });
}