import 'dart:io';
import 'package:daepiro/presentation/login/login_state.dart';
import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:daepiro/presentation/widgets/button/primary_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'login_controller.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(loginControllerProvider);
    var screenHeight = MediaQuery.of(context).size.height;

    ref.listen<AsyncValue<LoginState>>(loginControllerProvider, (previous, next) {
      next.whenData((state) {
        if(state.refreshToken != '' && state.refreshToken != '') {
          if(state.isOnboarding) {
            GoRouter.of(context).go('/home');
          } else {
            GoRouter.of(context).push('/onboarding');
          }
        }
      });
    });

    return asyncValue.when(
        data: (state) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: screenHeight * 0.63,
                    color: DaepiroColorStyle.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 75),
                      child:Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '안전으로 연결하는 통로',
                              style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.o_500),
                            ),
                            Flexible(
                                child: SvgPicture.asset(
                                  'assets/icons/logo.svg',
                                  height: 48,
                                )
                            )
                          ],
                        ),
                      ),
                    )
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PrimaryFilledButton(
                            onPressed: () async {
                              String token = await _kakaoLogin();
                              await ref.read(loginControllerProvider.notifier).getKakaoToken(token);
                            },
                            backgroundColor: Color(0xFFFAE300),
                            pressedColor: DaepiroColorStyle.black.withOpacity(0.1),
                            child: KakaoWidget(),
                          verticalPadding: 16,
                        ),
                        SizedBox(height: screenHeight * 0.009,),
                        PrimaryFilledButton(
                            onPressed: () async {
                              String token = await _naverLogin();
                              await ref.read(loginControllerProvider.notifier).getNaverToken(token);
                            },
                            backgroundColor: Color(0xFF03C75A),
                            pressedColor: DaepiroColorStyle.black.withOpacity(0.1),
                            child: NaverWidget(),
                          verticalPadding: 16,
                        ),
                        SizedBox(height: screenHeight * 0.009,),
                        if(Platform.isIOS)
                          PrimaryFilledButton(
                              onPressed: (){},
                              backgroundColor: DaepiroColorStyle.black,
                              pressedColor: DaepiroColorStyle.black.withOpacity(0.1),
                              child: AppleWidget(),
                            verticalPadding: 16,
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.07)
              ],
            ),
          );
        },
        error: (error, state) => Center(child: Text('error: ${error}')),
        loading: () => const Center(child: CircularProgressIndicator())
    );
  }


  Widget KakaoWidget() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/kakao_icon.svg', color: DaepiroColorStyle.black,),
          SizedBox(width: 8),
          Text(
            'Kakao로 로그인',
            style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.black),
          )
        ],
      ),
    );
  }

  Widget NaverWidget() {
    return SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/naver_icon.svg'),
            SizedBox(width: 8),
            Text(
              'Naver로 로그인',
              style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.white),
            )
          ],
        ),
    );
  }

  Widget AppleWidget() {
    return SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/apple_logo.svg', color: DaepiroColorStyle.white,),
            SizedBox(width: 8),
            Text(
              'Apple로 로그인',
              style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.white),
            )
          ],
        ),
    );
  }

  Future<String> _kakaoLogin() async {
    if(await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        return token.accessToken;
      } catch(error) {
        print('카카오톡으로 로그인 실패: $error');
        if(error is PlatformException && error.code == 'CANCELED') {
          return '';
        }
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('카카오 계정으로 로그인 성공');
          return token.accessToken;
        } catch(error) {
          print('카카오계정으로 로그인 실패: $error');
        }
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('카카오 계정으로 로그인 성공');
        return token.accessToken;
      } catch(error) {
        print('카카오계정으로 로그인 실패: $error');
      }
    }
    return '';
  }

  Future<String> _naverLogin() async {
    try {
      final NaverLoginResult res = await FlutterNaverLogin.logIn();
      return res.accessToken.toString();
    } catch(error) {
      print('네이버 로그인 에러: ${error}');
    }
    return '';
  }
}