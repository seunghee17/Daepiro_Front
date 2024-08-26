import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../repository/login_repository.dart';

class AuthCheckUsecase {
  final LoginRepository loginRepository;
  AuthCheckUsecase(this.loginRepository);

  Future<bool> isTokenRequest() async {
    return await loginRepository.checkTokenValid();
  }
}