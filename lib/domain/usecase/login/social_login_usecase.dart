import 'package:daepiro/data/model/request/social_login_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/response/login/sociallogin_token_response.dart';
import '../../repository/login_repository.dart';

final getSocialTokenUsecaseProvider = FutureProvider.family<SocialLoginTokenResponse, GetSocialTokenUseCase>((ref, request) async {
  final repository = ref.watch(loginRepositoryProvider);
  return await repository.getSocialLogin(platform: request.platform, socialLoginRequest: request.tokenRequest);
});

class GetSocialTokenUseCase {
  final String platform;
  final SocialLoginRequest tokenRequest;

  GetSocialTokenUseCase({required this.platform, required this.tokenRequest});
}