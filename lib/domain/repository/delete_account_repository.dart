
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositoryimpl/delete_account_repository_impl.dart';
import '../../data/source/mypage/delete_account_service.dart';

final deleteAccountProvider = Provider<DeleteAccountRepository>((ref) {
  final dio = Dio();
  return DeleteAccountRepositoryImpl(service: DeleteAccountService(dio));
});

abstract class DeleteAccountRepository {
  Future<void> deleteNaverAccount({required String clientId, required String client_secret, required String access_token});
}