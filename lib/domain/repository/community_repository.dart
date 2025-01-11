import 'package:daepiro/data/model/response/disaster_reply_response.dart';
import 'package:daepiro/data/source/community/community_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/http/http_provider.dart';
import '../../data/model/request/community_comment_post_request.dart';
import '../../data/model/request/community_disaster_edit_request.dart';
import '../../data/model/request/community_reply_report_request.dart';
import '../../data/model/response/community_article_write_response.dart';
import '../../data/model/response/community_comment_post_response.dart';
import '../../data/model/response/community_disaster_edit_response.dart';
import '../../data/model/response/community_dongnae_content_detail_response.dart';
import '../../data/model/response/community_dongnae_content_response.dart';
import '../../data/model/response/community_reply_like_response.dart';
import '../../data/model/response/community_reply_report_response.dart';
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

  Future<CommunityCommentPostResponse> setComment(
      CommunityCommentPostRequest communityCommentPostRequest);

  Future<List<Reply>> getDisasterReply(int situationId);

  Future<DeleteReplyResponse> deleteReply(int id);

  Future<CommunityDisasterEditResponse> editReply(
      {required int id,
      required CommunityDisasterEditRequest communityDisasterEditRequest});

  Future<CommunityDongnaeContentResponse> getDongNaeContent({
    required String type,
    required String? category,
    required String status,
    required String address,
    required int page,
    required int size,
  });

  Future<CommunityDongNaeDetailContentResponse> getDongNaeDetailContent(
      {required int id});

  Future<CommunityReplyLikeResponse> communityReplyLike({required int id});

  Future<CommunityReplyReportResponse> communityReplyReport(
      {required int id,
      required CommunityReplyReportRequest communityReplyReportRequest});

  Future<CommunityArticleWritingResponse> setArticleData({
    required String articleCategory,
    required String title,
    required String body,
    required bool visibility,
    required double longitude,
    required double latitude,
    required List<MultipartFile> attachFileList,
  });
}
