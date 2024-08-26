
import '../../data/model/request/token_request.dart';
import '../../data/model/response/token_response.dart';

abstract class LoginRepository {
  Future<TokenResponse> getTokenResponse({required TokenRequest tokenRequest});
  Future<bool> checkTokenValid();
}