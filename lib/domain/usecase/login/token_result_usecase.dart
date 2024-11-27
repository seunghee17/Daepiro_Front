import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/model/request/refresh_token_request.dart';
import '../../../data/model/response/refresh_token_response.dart';
import '../../repository/login_repository.dart';

// final getTokenRefreshProvider = FutureProvider.family<RefreshTokenResponse, GetRefreshTokenUseCase>((ref, request) async {
//   final repository = ref.watch(loginRepositoryProvider);
//   return await repository.getTokenResponse(tokenRequest: request.tokenRequest);
// });
//
// class GetRefreshTokenUseCase {
//   final RefreshTokenRequest tokenRequest;
//
//   GetRefreshTokenUseCase({required this.tokenRequest});
// }
