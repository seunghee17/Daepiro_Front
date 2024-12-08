import 'package:daepiro/data/model/response/disaster_reply_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/response/disaster_reply_delete_response.dart';
import '../../model/response/disaster_response.dart';

part 'community_service.g.dart';

@RestApi()
abstract class CommunityService {
  factory CommunityService(Dio dio, {String baseUrl}) = _CommunityService;

  @GET('/v1/disastersituations')
  Future<DisasterResponse> getDisasterResult();

  @GET('/v1/disastersituations/comments/1032')
  Future<DisasterReplyResponse> getDisasterReply();

  @DELETE('/v1/disastersituations/comments/{commentId}')
  Future<DeleteReplyResponse> deleteReply({
    @Path('commentId') required int commentId,
  });
}
