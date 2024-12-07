import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/response/disaster_response.dart';

part 'community_service.g.dart';

@RestApi()
abstract class CommunityService {
  factory CommunityService(Dio dio, {String baseUrl}) = _CommunityService;

  @GET('/v1/disastersituations')
  Future<DisasterResponse> getDisasterResult();
}