import 'package:daepiro/data/model/request/register_user_location_request.dart';
import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/data/model/response/information/around_shelter_list_response.dart';
import 'package:daepiro/data/model/response/information/behavior_list_response.dart';
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

  // 재난콘텐츠 검색
  @GET('/v1/disastercontents/search/{keyword}')
  Future<DisasterContentsListResponse> searchDisasterContents({
    @Path("keyword") required String keyword,
    // @Query("cursor") String cursor = "",
    @Query("size") required String size
  });

  // 사용자 위치 등록
  @POST('/v1/users/gps')
  Future<BasicResponse> registerUserLocation({
    @Body() required RegisterUserLocationRequest body
  });

  // 주변대피소 조회
  @GET('/v1/shelters/{type}')
  Future<AroundShelterListResponse> getAroundShelterList({
    @Path("type") required String type
  });

  // 행동요령 목록 조회
  @GET('/v1/behaviourtips/list/{type}')
  Future<BehaviorListResponse> getBehaviorList({
    @Path("type") required String type
  });

  // 재난유형 검색
  @GET('/v1/behaviourtips/search/{keyword}')
  Future<BehaviorListResponse> searchDisasterType({
    @Path("keyword") required String keyword
  });


}
