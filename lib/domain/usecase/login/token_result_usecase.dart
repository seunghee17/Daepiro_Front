import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/model/request/refresh_token_request.dart';
import '../../../data/model/response/refresh_token_response.dart';
import '../../../data/repositoryimpl/login_repository_impl.dart';
part 'token_result_usecase.g.dart';

@riverpod
Future<RefreshTokenResponse> getTokenResponse(GetTokenResponseRef ref,
  {required RefreshTokenRequest tokenRequest}) async {
  final repository = ref.watch(loginRepositoryProvider);
  return await repository.getTokenResponse(tokenRequest: tokenRequest);
}