import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/request/token_request.dart';
import '../../domain/usecase/login/social_login_usecase.dart';
import '../../domain/usecase/login/token_result_usecase.dart';
import 'login_state.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  final storage = FlutterSecureStorage();
  @override
  //초기 데이터 로드를 수행할 목적으로 사용
  //로그인 할려는 화면에 들어왔기에 이미 토큰은 유효하지 않음
  //주로 초기 정보를 로드하는 목적으로 사용됨
  FutureOr<LoginState> build() async {
    return _initState();
  }

  Future<LoginState> _initState() async {
    storage.deleteAll();
    return LoginState(isLoading: false, accessToken: '', refreshToken: '');
  }

  Future<void> tokenData(String token) async {
    final value = state.valueOrNull;
    if(value != null) {
      if(!value.isLoading) {
        state = AsyncValue.data(value.copyWith(isLoading: true));
        state = await AsyncValue.guard(() async {
          final result = await ref.read(getTokenResponseProvider(tokenRequest: TokenRequest(token: token)).future);
          print('we are in login_controller: ${result.accessToken} &&&& ${result.refreshToken}');
          storage.write(key: 'accessToken', value: result.accessToken);
          storage.write(key: 'refreshToken', value: result.refreshToken);
          return value.copyWith(
              isLoading: false,
              accessToken: result.accessToken ?? '',
              refreshToken: result.refreshToken ?? ''
          );
        });
      }
    }
  }//getSocialTokenResponseProvider

  Future<void> getKakaoToken(String token) async {
    final value = state.valueOrNull;
    if(value != null) {
      if(!value.isLoading) {
        state = AsyncValue.data(value.copyWith(isLoading: true));
        final result = await ref.read(GetKakaoTokenResponseProvider(tokenRequest: TokenRequest(token: token)).future);
        storage.write(key: 'accessToken', value: result.accessToken);
        storage.write(key: 'refreshToken', value: result.refreshToken);
        state = AsyncValue.data(value.copyWith(isLoading: true, accessToken: result.accessToken ?? '', refreshToken: result.refreshToken ?? ''));
      }
    }
  }

}

