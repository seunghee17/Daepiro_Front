import 'package:daepiro/data/model/request/social_login_request.dart';
import 'package:daepiro/data/model/response/sociallogin_token_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/repositoryimpl/login_repository_impl.dart';
part 'social_login_usecase.g.dart';

@riverpod
Future<SocialLoginTokenResponse> getSocialTokenResponse(GetSocialTokenResponseRef ref,
    {
      required String platform,
      required SocialLoginRequest tokenRequest
    }) async {
  final repository = ref.watch(loginRepositoryProvider);
  return await repository.getSocialLogin(platform: platform, socialLoginRequest: tokenRequest);
}