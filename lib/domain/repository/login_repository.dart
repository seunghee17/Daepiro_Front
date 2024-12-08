import 'package:daepiro/data/model/request/social_login_request.dart';
import 'package:daepiro/data/model/response/sociallogin_token_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/http/http_provider.dart';
import '../../data/model/request/refresh_token_request.dart';
import '../../data/model/response/refresh_token_response.dart';
import '../../data/repositoryimpl/login_repository_impl.dart';
import '../../data/source/login/login_service.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final http = ref.watch(dioProvider);
  return LoginRepositoryImpl(service: LoginService(http));
});

abstract class LoginRepository {
  //Future<RefreshTokenResponse> getTokenResponse({required RefreshTokenRequest tokenRequest});
  Future<SocialLoginTokenResponse> getSocialLogin(
      {required String platform,
      required SocialLoginRequest socialLoginRequest});
}
