import 'package:daepiro/data/source/mypage/delete_account_service.dart';
import 'package:daepiro/domain/repository/delete_account_repository.dart';

class DeleteAccountRepositoryImpl extends DeleteAccountRepository {
  DeleteAccountRepositoryImpl({required DeleteAccountService service}) : _service = service;
  final DeleteAccountService _service;

  @override
  Future<void> deleteNaverAccount({required String clientId, required String client_secret, required String access_token}) async {
    try {
      await _service.deleteNaverAccount(clientId: clientId, client_secret: client_secret, access_token: access_token);
    } catch(e) {
      print('네이버 회원 탈퇴 실패');
    }
  }
}