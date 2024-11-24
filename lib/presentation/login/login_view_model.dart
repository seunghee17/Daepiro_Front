import 'package:daepiro/data/model/request/social_login_request.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecase/login/social_login_usecase.dart';
import 'login_state.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  final storage = FlutterSecureStorage();
  List<Permission> permission = [
    Permission.location,
    Permission.notification,
    Permission.camera,
    Permission.storage
  ];

  @override
  //로그인 할려는 화면에 들어왔기에 이미 토큰은 유효하지 않음
  FutureOr<LoginState> build() async {
    return _initState();
  }

  Future<LoginState> _initState() async {
    storage.deleteAll();
    return LoginState(
        isLoading: false,
        accessToken: '',
        refreshToken: '',
        isCompletedOnboarding: false);
  }

  Future<void> getSocialToken(String platform, String token) async {
    final value = state.valueOrNull;
    if (value != null) {
      if (!value.isLoading) {
        state = AsyncValue.data(value.copyWith(isLoading: true));
        final result = await ref.read(GetSocialTokenResponseProvider(
                platform: platform,
                tokenRequest: SocialLoginRequest(socialToken: token))
            .future);
        storage.write(key: 'accessToken', value: result.data?.accessToken);
        storage.write(key: 'refreshToken', value: result.data?.refreshToken);
        state = AsyncValue.data(value.copyWith(
            isLoading: false,
            accessToken: result.data?.accessToken ?? '',
            refreshToken: result.data?.refreshToken ?? '',
            isCompletedOnboarding: result.data?.isCompletedOnboarding ?? false,
            isLoginSuccess: true));
      }
    }
  }

  Future<String> kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        print('카카오!!${token.accessToken}');
        return token.accessToken;
      } catch (error) {
        print('카카오톡으로 로그인 실패: $error');
        if (error is PlatformException && error.code == 'CANCELED') {
          return '';
        }
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('카카오!!${token.accessToken}');
          return token.accessToken;
        } catch (error) {
          print('카카오계정으로 로그인 실패: $error');
        }
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('카카오!!${token.accessToken}');
        return token.accessToken;
      } catch (error) {
        print('카카오계정으로 로그인 실패: $error');
      }
    }
    return '';
  }

  Future<String> naverLogin() async {
    try {
      final NaverLoginResult res = await FlutterNaverLogin.logIn();
      return res.accessToken.toString();
    } catch (error) {
      print('네이버 로그인 에러: ${error}');
    }
    return '';
  }

  Future<bool> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> requestLocationPermission() async {
    await Permission.location.request();
  }
}
