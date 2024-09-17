import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/request/token_request.dart';
import '../../../data/model/response/sociallogin_token_response.dart';
import '../../../data/repositoryimpl/login_repository_impl.dart';
part 'naver_login_usecase.g.dart';

@riverpod
Future<SocialLoginTokenResponse> getNaverTokenResponse(GetNaverTokenResponseRef ref,
{required TokenRequest tokenRequest}) async {
  final repository = ref.watch(loginRepositoryProvider);
  return await repository.getNaverTokenResponse(tokenRequest: tokenRequest);
}