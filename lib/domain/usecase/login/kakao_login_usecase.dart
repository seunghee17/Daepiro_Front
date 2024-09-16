import 'package:daepiro/data/model/response/sociallogin_token_response.dart';
import 'package:daepiro/domain/usecase/login/token_result_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/request/token_request.dart';
import '../../../data/repositoryimpl/login_repository_impl.dart';
part 'kakao_login_usecase.g.dart';

@riverpod
Future<SocialLoginTokenResponse> getKakaoTokenResponse(GetKakaoTokenResponseRef ref,
    {required TokenRequest tokenRequest}) async {
  final repository = ref.watch(loginRepositoryProvider);
  return await repository.getKakaoTokenResponse(tokenRequest: tokenRequest);
}