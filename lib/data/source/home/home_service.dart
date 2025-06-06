import 'package:daepiro/data/model/response/home/behavior_tips_response.dart';
import 'package:daepiro/data/model/response/home/home_disaster_feed_response.dart';
import 'package:daepiro/data/model/response/home/home_disaster_history_response.dart';
import 'package:daepiro/data/model/response/home/home_status_response.dart';
import 'package:daepiro/data/model/response/home/notification_response.dart';
import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:daepiro/data/model/response/home/disasters_history_response.dart';
import 'package:daepiro/data/model/response/home/user_address_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/request/register_user_location_request.dart';
import '../../model/response/basic_response.dart';
import '../../model/response/information/around_shelter_list_response.dart';
import '../../model/response/information/disaster_contents_list_response.dart';
part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  // 사용자 위치 등록
  @POST('/v1/users/gps')
  Future<BasicResponse> registerUserLocation({
    @Body() required RegisterUserLocationRequest body
  });

  // 사용자 주소 조회
  @GET('/v1/home/weather')
  Future<UserAddressResponse> getUserAddress();

  // 알림 내역 조회
  @GET('/v1/users/notifications')
  Future<NotificationResponse> getNotifications();

  // 현재 재난 발생 유무 조회
  @GET('/v1/home/status')
  Future<HomeStatusResponse> getHomeStatus();

  // 재난 발생 시 - 발생 재난 피드 조회
  @GET('/v1/home/warnings')
  Future<HomeDisasterFeedResponse> getHomeDisasterFeed();

  // 재난문자 내역 조회
  @GET('/v1/home/disasters')
  Future<HomeDisasterHistoryResponse> getHomeDisasterHistory();

  // 인기 게시글 조회
  @GET('/v1/home/articles')
  Future<PopularPostResponse> getPopularPostList({
    @Query('category') required String category
  });

  // 최근 재난문자 내역 조회
  @GET('/v1/users/disasters')
  Future<DisastersHistoryResponse> getDisastersHistory();

  // 최근 정보콘텐츠 조회
  @GET('/v1/home/news')
  Future<DisasterContentsListResponse> getRecentContents();

  // 재난에 대한 행동요령 조회
  @GET('/v1/behaviourtips/tip/{disasterId}')
  Future<BehaviorTipsResponse> getBehaviorTips({
    @Path("disasterId") required String disasterId
  });

  // 주변대피소 조회
  @GET('/v1/shelters/{type}')
  Future<AroundShelterListResponse> getAroundShelterList({
    @Path("type") required String type
  });
}
