import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/request/set_mypage_address_notification_request.dart';
import '../../model/request/set_mypage_disaster_types_request.dart';
import '../../model/request/set_mypage_inquires_request.dart';
import '../../model/request/set_mypage_profiles_request.dart';
import '../../model/response/mypage/get_mypage_address_response.dart';
import '../../model/response/mypage/get_mypage_articles_response.dart';
import '../../model/response/mypage/get_mypage_disaster_types_response.dart';
import '../../model/response/mypage/get_mypage_notification_setting_response.dart';
import '../../model/response/mypage/get_mypage_profiles_response.dart';

part 'mypage_service.g.dart';

@RestApi()
abstract class MyPageService {
  factory MyPageService(Dio dio, {String baseUrl}) = _MyPageService;

  @PUT('/v1/users/logout')
  Future<BasicResponse> getLogOut();

  @GET('/v1/my-page/profiles')
  Future<GetMyPageProfilesResponse> getMyProfiles();

  @GET('/v1/my-page/disaster-types')
  Future<GetMyPageDisasterTypesResponse> getMyDisasterTypes();

  @GET('/v1/my-page/addresses')
  Future<GetMyPageAddressResponse> getMyAddress();

  @GET('/v1/my-page/notifications')
  Future<GetMyPageNotificationSettingResponse> getMyNotificationSetting();

  @GET('/v1/my-page/articles')
  Future<GetMyPageArticlesResponse> getMyArticles({
    @Query('page') required int page,
    @Query('size') required int size,
  });

  @POST('/v1/my-page/inquires')
  Future<BasicResponse> setInquires({
    @Body() required SetMyPageInquiresRequest setMypageInquiresRequest
});

  @PUT('/v1/my-page/profiles')
  Future<BasicResponse> setMyProfiles({
    @Body() required SetMyPageProfilesRequest setMypageProfilesRequest
});

  @PUT('/v1/my-page/notifications/{type}')
  Future<BasicResponse> setNotificationSetting({
    @Path('type') required String type,
  });

  @PUT('/v1/my-page/disaster-types')
  Future<BasicResponse> setDisasterTypes({
    @Body() required SetMypageDisasterTypesRequest setMypageDisasterTypesRequest
  });

  @PUT('/v1/my-page/addresses')
  Future<BasicResponse> setAddressNotification({
    @Body() required SetMypageAddressNotificationRequest setMypageAddressNotificationRequest
  });

}
