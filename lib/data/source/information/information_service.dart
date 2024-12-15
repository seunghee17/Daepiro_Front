import 'package:daepiro/data/model/response/information/disaster_contents_list_response.dart';
import 'package:daepiro/data/model/response/information/disaster_contents_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'information_service.g.dart';

@RestApi()
abstract class InformationService {
  factory InformationService(Dio dio, {String baseUrl}) = _InformationService;

  // 정보 메인화면 재난콘텐츠 조회
  @GET('/v1/disastercontents/home')
  Future<DisasterContentsResponse> getDisasterContents();

  // 재난콘텐츠 목록 조회
  @GET('/v1/disastercontents/list/{sortType}')
  Future<DisasterContentsListResponse> getDisasterContentsList({
    @Path("sortType") required String sortType,
    // @Query("cursor") String cursor = "",
    @Query("size") required String size
  });

}
