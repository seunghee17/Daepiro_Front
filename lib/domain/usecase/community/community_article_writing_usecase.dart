import 'package:daepiro/domain/repository/community_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/community/community_article_write_response.dart';

final setCommunityArticleWritingUseCaseProvider =
FutureProvider.family<CommunityArticleWritingResponse, CommunityArticleWritingUseCase>(
    (ref, request) async {
      final repository = ref.watch(communityWritingRepositoryProvider);
      return await repository.setArticleData(
          articleCategory: request.articleCategory,
          title: request.title,
          body: request.body,
          visibility: request.visibility,
          longitude: request.longitude,
          latitude: request.latitude,
          dongne: request.dongne,
          attachFileList: request.attachFileList
      );
    }
);

class CommunityArticleWritingUseCase {
  final String articleCategory;
  final String title;
  final String body;
  final bool visibility;
  final double longitude;
  final double latitude;
  final String dongne;
  final List<MultipartFile> attachFileList;

  CommunityArticleWritingUseCase({
    required this.articleCategory,
    required this.title,
    required this.body,
    required this.visibility,
    required this.longitude,
    required this.latitude,
    required this.dongne,
    required this.attachFileList,
  });
}