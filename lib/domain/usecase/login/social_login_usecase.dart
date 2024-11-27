import 'package:daepiro/data/model/request/social_login_request.dart';
import 'package:daepiro/data/model/response/sociallogin_token_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../repository/login_repository.dart';

final getSocialTokenUsecaseProvider = FutureProvider.family<SocialLoginTokenResponse, SocialTokenRequestUseCase>((ref, request) async {
  final repository = ref.watch(loginRepositoryProvider);
  return await repository.getSocialLogin(platform: request.platform, socialLoginRequest: request.tokenRequest);
});

class SocialTokenRequestUseCase {
  final String platform;
  final SocialLoginRequest tokenRequest;

  SocialTokenRequestUseCase({required this.platform, required this.tokenRequest});
}