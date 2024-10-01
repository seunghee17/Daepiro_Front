import 'package:daepiro/data/model/request/social_login_request.dart';
import 'package:daepiro/data/model/response/sociallogin_token_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repository/login_repository.dart';
import '../http/http_provider.dart';
import '../model/request/refresh_token_request.dart';
import '../model/response/refresh_token_response.dart';
import '../source/login/login_service.dart';
part 'login_repository_impl.g.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required LoginService service}) : _service = service;
  final LoginService _service;
  final storage = FlutterSecureStorage();

  @override
  Future<RefreshTokenResponse> getTokenResponse({required RefreshTokenRequest tokenRequest}) async {
    final tokenResult = await _service.getTokenResponse(tokenRequest: tokenRequest);
    await storage.write(key: 'accessToken', value: tokenResult.data?.accessToken);
    await storage.write(key: 'refreshToken', value: tokenResult.data?.refreshToken);
    return tokenResult;
  }

  @override
  Future<SocialLoginTokenResponse> getSocialLogin({
    required String platform,
    required SocialLoginRequest socialLoginRequest
  }) async {
    final tokenResult = await _service.getSocialLogin(platform:platform, socialLoginRequest: socialLoginRequest);
    await storage.write(key: 'accessToken', value: tokenResult.data?.accessToken);
    await storage.write(key: 'refreshToken', value: tokenResult.data?.refreshToken);
    return tokenResult;
  }

}
@riverpod
LoginRepository loginRepository (LoginRepositoryRef ref) {
  final http = ref.watch(httpProvider);
  return LoginRepositoryImpl(service: LoginService(http));
}
