import 'package:daepiro/data/model/response/sociallogin_token_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repository/login_repository.dart';
import '../model/request/token_request.dart';
import '../model/response/token_response.dart';
import '../source/login/login_data_source.dart';
import '../source/login/login_data_source_impl.dart';
part 'login_repository_impl.g.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required LoginDataSource source}) : _source = source;
  final LoginDataSource _source;
  final storage = FlutterSecureStorage();

  @override
  Future<TokenResponse> getTokenResponse({required TokenRequest tokenRequest}) async {
    final tokenResult = await _source.getTokenResponse(tokenRequest);
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
   final tokenResult = await _source.getKakaoTokenResponse(tokenRequest);
   await storage.write(key: 'accessToken', value: tokenResult.accessToken);
   await storage.write(key: 'refreshToken', value: tokenResult.refreshToken);
   return tokenResult;
  }

  @override
  Future<SocialLoginTokenResponse> getNaverTokenResponse({required TokenRequest tokenRequest}) {
    // TODO: implement getNaverTokenResponse
    throw UnimplementedError();
  }





}

@riverpod
LoginRepository loginRepository(LoginRepositoryRef ref) {
  final source = ref.watch(loginDataSourceProvider);
  return LoginRepositoryImpl(source: source);
}
