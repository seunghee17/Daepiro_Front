import 'package:daepiro/data/model/request/social_login_request.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../domain/usecase/login/social_login_usecase.dart';
import 'login_state.dart';

final loginStateNotifierProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  return LoginViewModel(ref);
});

class LoginViewModel extends StateNotifier<LoginState> {
  final Ref ref;
  final FlutterSecureStorage storage = FlutterSecureStorage();

  List<Permission> permission = [
    Permission.location,
    Permission.notification,
    Permission.camera,
    Permission.storage
  ];

  LoginViewModel(this.ref) : super(LoginState());

  // 상태를 관리하는 ViewModel 또는 Notifier에서
  Future<void> fetchSocialToken(String platform, String token) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await ref.read(getSocialTokenUsecaseProvider(
              GetSocialTokenUseCase(
                  platform: platform,
                  tokenRequest: SocialLoginRequest(socialToken: token)))
          .future);
      state = state.copyWith(
          isLoading: false,
          accessToken: response.data?.accessToken ?? '',
          refreshToken: response.data?.refreshToken ?? '',
          isCompletedOnboarding: response.data?.isCompletedOnboarding ?? false,
          isLoginSuccess: true);
      await storage.write(key: 'accessToken', value: state.accessToken);
      await storage.write(key: 'refreshToken', value: state.refreshToken);
    } catch (error) {
      print('토큰 저장 오류: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        print('카카오!!${token.accessToken}');
        await fetchSocialToken('kakao', token.accessToken);
      } catch (error) {
        print('카카오톡으로 로그인 실패: $error');
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('카카오!!${token.accessToken}');
          await fetchSocialToken('kakao', token.accessToken);
        } catch (error) {
          print('카카오계정으로 로그인 실패: $error');
        }
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('카카오!!${token.accessToken}');
        await fetchSocialToken('kakao', token.accessToken);
      } catch (error) {
        print('카카오계정으로 로그인 실패: $error');
      }
    }
    return;
  }

  Future<void> naverLogin() async {
    try {
      await FlutterNaverLogin.logIn();
      NaverAccessToken accessToken = await FlutterNaverLogin.currentAccessToken;
      await fetchSocialToken('naver', accessToken.accessToken);
    } catch (error) {
      print('네이버 로그인 에러: ${error}');
    }
    return;
  }

  Future<void> appleLogin() async {
    try {
      final result = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);
      await fetchSocialToken('apple', result.identityToken ?? '');
    } catch (e) {
      print('애플로그인 시도중 error 발생 $e');
      return;
    }
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
