
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../http/http_provider.dart';
import '../../model/request/token_request.dart';
import '../../model/response/sociallogin_token_response.dart';
import '../../model/response/token_response.dart';
import 'login_data_source.dart';
import 'login_service.dart';
part 'login_data_source_impl.g.dart';

class LoginDataSoruceImpl implements LoginDataSource {
  LoginDataSoruceImpl({required LoginService service}) : _service = service;
  final LoginService _service;

  @override
  Future<TokenResponse> getTokenResponse(
      TokenRequest tokenRequest) async =>
      _service.getTokenResponse( tokenRequest: tokenRequest);

  @riverpod
  Future<SocialLoginTokenResponse> getKakaoTokenResponse(
      TokenRequest tokenRequest) async =>
      _service.getKakaoTokenResponse(tokenRequest: tokenRequest);

  @riverpod
  Future<SocialLoginTokenResponse> getNaverTokenResponse(
      TokenRequest tokenRequest) async =>
      _service.getNaverTokenResponse(tokenRequest: tokenRequest);
}

@riverpod
LoginDataSource loginDataSource(LoginDataSourceRef ref) {
  final http = ref.watch(httpProvider);
  return LoginDataSoruceImpl(service: LoginService(http));
}
