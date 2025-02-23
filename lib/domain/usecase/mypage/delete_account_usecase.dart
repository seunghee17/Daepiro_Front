import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/delete_account_repository.dart';

final deleteNaverAccountUseCaseProvider = FutureProvider.family<void, DeleteNaverAccountUseCase>((ref, request) async {
  final repository = ref.watch(deleteAccountProvider);
  return await repository.deleteNaverAccount(clientId: request.clientId, client_secret: request.client_secret, access_token: request.access_token);
});

class DeleteNaverAccountUseCase {
  final String clientId;
  final String client_secret;
  final String access_token;
  DeleteNaverAccountUseCase({required this.clientId, required this.client_secret, required this.access_token});
}