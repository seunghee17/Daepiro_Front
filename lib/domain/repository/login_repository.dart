
import 'package:daepiro/data/model/response/sociallogin_token_response.dart';

import '../../data/model/request/token_request.dart';
import '../../data/model/response/token_response.dart';

abstract class LoginRepository {
  Future<TokenResponse> getTokenResponse({required TokenRequest tokenRequest});
  Future<bool> checkTokenValid();
  Future<SocialLoginTokenResponse> getNaverTokenResponse({required TokenRequest tokenRequest});
  Future<SocialLoginTokenResponse> getKakaoTokenResponse({required TokenRequest tokenRequest});
}