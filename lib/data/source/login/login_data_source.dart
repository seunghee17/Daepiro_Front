
import '../../model/request/token_request.dart';
import '../../model/response/sociallogin_token_response.dart';
import '../../model/response/token_response.dart';

abstract class LoginDataSource {
  //토큰 재발급과 소셜로그인 회원가입 로직
  Future<TokenResponse> getTokenResponse(TokenRequest tokenRequest);
  Future<SocialLoginTokenResponse> getNaverTokenResponse(TokenRequest tokenRequest);
  Future<SocialLoginTokenResponse> getKakaoTokenResponse(TokenRequest tokenRequest);

}