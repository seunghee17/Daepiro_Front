import 'package:daepiro/data/model/request/social_login_request.dart';
import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/http/http_provider.dart';
import '../../data/model/request/set_fcm_request.dart';
import '../../data/model/response/login/sociallogin_token_response.dart';
import '../../data/repositoryimpl/login_repository_impl.dart';
import '../../data/source/login/login_service.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final http = ref.watch(dioProvider);
  return LoginRepositoryImpl(service: LoginService(http));
});

abstract class LoginRepository {
  Future<SocialLoginTokenResponse> getSocialLogin(
      {required String platform,
      required SocialLoginRequest socialLoginRequest});

  Future<BasicResponse> setFCMToken(
  {required SetFcmRequest setFcmRequest});
}
