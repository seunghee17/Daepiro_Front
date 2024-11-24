import 'package:daepiro/data/model/request/refresh_token_request.dart';
import 'package:daepiro/data/model/response/refresh_token_response.dart';
import 'package:daepiro/data/model/response/sociallogin_token_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../model/request/social_login_request.dart';
part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/v1/auth/refresh')
  Future<RefreshTokenResponse> getTokenResponse({
    @Body() required RefreshTokenRequest tokenRequest
  });

  @POST('/v1/auth/login/{platform}')
  Future<SocialLoginTokenResponse> getSocialLogin({
    @Path('platform') required String platform,
    @Body() required SocialLoginRequest socialLoginRequest
  });

}