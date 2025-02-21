import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/response/community/community_writing_edit_response.dart';
import '../../repository/community_repository.dart';

final setCommunityArticleEditUseCaseProvider = FutureProvider.family<
    CommunityWritingEditResponse,
    CommunityArticleEditUseCase>((ref, request) async {
  final repository = await ref.watch(communityWritingRepositoryProvider);
  return await repository.editArticle(
      id: request.id,
      articleType: request.articleType,
      articleCategory: request.articleCategory,
      visibility: request.visibility,
      title: request.title,
      body: request.body,
      attachFileList: request.attachFileList);
});

class CommunityArticleEditUseCase {
  final int id;
  final String articleType;
  final String articleCategory;
  final bool visibility;
  final String title;
  final String body;
  final List<MultipartFile> attachFileList;

  CommunityArticleEditUseCase({
    required this.id,
    required this.articleType,
    required this.articleCategory,
    required this.visibility,
    required this.title,
    required this.body,
    required this.attachFileList,
  });
}
