import 'package:daepiro/data/model/response/sociallogin_token_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repository/login_repository.dart';
import '../http/http_provider.dart';
import '../model/request/token_request.dart';
import '../model/response/token_response.dart';
import '../source/login/login_service.dart';
part 'login_repository_impl.g.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required LoginService service}) : _service = service;
  final LoginService _service;
  final storage = FlutterSecureStorage();

  @override
  Future<TokenResponse> getTokenResponse({required TokenRequest tokenRequest}) async {
    final tokenResult = await _service.getTokenResponse(tokenRequest: tokenRequest);
    await storage.write(key: 'accessToken', value: tokenResult.accessToken);
    await storage.write(key: 'refreshToken', value: tokenResult.refreshToken);
    return tokenResult;
  }

  @override
  Future<bool> checkTokenValid() async{
    String? accessToken = await storage.read(key: 'accessToken');
    String? refreshToken = await storage.read(key: 'refreshToken');
    if((accessToken == null && refreshToken == null) || accessToken == "" && refreshToken == "") {
      return false;
    }
    return true;
  }

  @override
  Future<SocialLoginTokenResponse> getKakaoTokenResponse({required TokenRequest tokenRequest}) async {
   final tokenResult = await _service.getKakaoTokenResponse(tokenRequest: tokenRequest);
   await storage.write(key: 'accessToken', value: tokenResult.accessToken);
   await storage.write(key: 'refreshToken', value: tokenResult.refreshToken);
   return tokenResult;
  }

  @override
  Future<SocialLoginTokenResponse> getNaverTokenResponse({required TokenRequest tokenRequest}) async{
    final tokenResult = await _service.getNaverTokenResponse(tokenRequest: tokenRequest);
    await storage.write(key: 'accessToken', value: tokenResult.accessToken);
    await storage.write(key: 'refreshToken', value: tokenResult.refreshToken);
    return tokenResult;
  }

}
@riverpod
LoginRepository loginRepository (LoginRepositoryRef ref) {
  final http = ref.watch(httpProvider);
  return LoginRepositoryImpl(service: LoginService(http));
}
