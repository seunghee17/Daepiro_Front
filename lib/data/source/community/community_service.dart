import 'package:daepiro/data/model/request/community_comment_post_request.dart';
import 'package:daepiro/data/model/response/disaster_reply_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/request/community_disaster_edit_request.dart';
import '../../model/request/community_reply_report_request.dart';
import '../../model/response/community_comment_post_response.dart';
import '../../model/response/community_disaster_edit_response.dart';
import '../../model/response/community_dongnae_content_detail_response.dart';
import '../../model/response/community_dongnae_content_response.dart';
import '../../model/response/community_reply_like_response.dart';
import '../../model/response/community_reply_report_response.dart';
import '../../model/response/community_town_like_response.dart';
import '../../model/response/disaster_reply_delete_response.dart';
import '../../model/response/disaster_response.dart';

part 'community_service.g.dart';

@RestApi()
abstract class CommunityService {
  factory CommunityService(Dio dio, {String baseUrl}) = _CommunityService;

  @GET('/v1/disastersituations')
  Future<DisasterResponse> getDisasterResult();

  @GET('/v1/disastersituations/comments/{situationId}')
  Future<DisasterReplyResponse> getDisasterReply(
      {@Path('situationId') required String situationId});

  //댓글 작성
  @POST('/v1/comments')
  Future<CommunityCommentPostResponse> setComment(
      {@Body()
      required CommunityCommentPostRequest communityCommentPostRequest});

  @DELETE('/v1/comments/{id}')
  Future<DeleteReplyResponse> deleteReply({
    @Path('id') required int id,
  });

  @PUT('/v1/comments/{id}')
  Future<CommunityDisasterEditResponse> editReply(
      {@Path('id') required int id,
      @Body()
      required CommunityDisasterEditRequest communityDisasterEditRequest});

  @GET('/v1/articles')
  Future<CommunityDongnaeContentResponse> dongNaeContent({
    @Query('type') required String type,
    @Query('category') required String? category,
    @Query('status') required String status,
    @Query('address') required String address,
    @Query('page') required int page,
    @Query('size') required int size,
  });

  @GET('/v1/articles/{id}')
  Future<CommunityDongNaeDetailContentResponse> dongNaeDetailContent(
      {@Path('id') required int id});

  @PUT('/v1/comments/{id}/like')
  Future<CommunityReplyLikeResponse> communityReplyLike(
      {@Path('id') required int id});

  @PUT('/v1/comments/{id}/report')
  Future<CommunityReplyReportResponse> communityReplyReport(
      {@Path('id') required int id,
      @Body()
      required CommunityReplyReportRequest communityReplyReportRequest});

  //게시글 좋아요
  @PUT('/v1/articles/{id}/like')
  Future<CommunityTownLikeResponse> communityTown({ @Path('id') required int id});
}
