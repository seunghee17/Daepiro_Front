import 'dart:io';

import 'package:daepiro/presentation/home/home_screen.dart';
import 'package:daepiro/presentation/onboarding/onboarding_screen.dart';
import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:daepiro/presentation/widgets/button/CustomElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'login_controller.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(loginControllerProvider);
    var screenHeight = MediaQuery.of(context).size.height;

    return asyncValue.when(
        data: (state) {
          if(!state.isOnboarding) {
            GoRouter.of(context).replace('/onboarding');
          } else {
            GoRouter.of(context).replace('/home');
          }
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedButton(
                            onPressed: () async {
                              String token = await kakaoLogin();
                              await ref.read(loginControllerProvider.notifier).getKakaoToken(token);
                            },
                            backgroundColor: Color(0xFFFAE300),
                            pressedColor: DaepiroColorStyle.black.withOpacity(0.1),
                            radius: 8.0,
                            child: KakaoWidget()
                        ),
                        CustomElevatedButton(
                            onPressed: (){},
                            backgroundColor: Color(0xFF03C75A),
                            pressedColor: DaepiroColorStyle.black.withOpacity(0.1),
                            radius: 8.0,
                            child: NaverWidget()
                        ),
                        if(Platform.isIOS)
                          CustomElevatedButton(
                              onPressed: (){},
                              backgroundColor: DaepiroColorStyle.black,
                              pressedColor: DaepiroColorStyle.black.withOpacity(0.1),
                              radius: 8.0,
                              child: AppleWidget()
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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
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
      )
    );
  }

  Widget NaverWidget() {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
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
        )
    );
  }

  Widget AppleWidget() {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
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
        )
    );
  }

  Future<String> kakaoLogin() async {
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
}