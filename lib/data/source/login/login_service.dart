import 'package:daepiro/data/model/request/set_fcm_request.dart';
import 'package:daepiro/data/model/response/login/sociallogin_token_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../model/request/social_login_request.dart';
import '../../model/response/basic_response.dart';

part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio) = _LoginService;

  @POST('/v1/auth/login/{platform}')
  Future<SocialLoginTokenResponse> getSocialLogin(
      {@Path('platform') required String platform,
      @Body() required SocialLoginRequest socialLoginRequest});

  @PUT('/v1/users/fcm')
  Future<BasicResponse> setFCMToken(
      {@Body() required SetFcmRequest setFcmRequest});
}
