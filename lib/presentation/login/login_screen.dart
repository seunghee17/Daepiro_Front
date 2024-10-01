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
          if(state.isCompletedOnboarding) {
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
                              String token = await ref.read(loginControllerProvider.notifier).kakaoLogin();
                              await ref.read(loginControllerProvider.notifier).getSocialToken('kakao',token);
                            },
                            backgroundColor: Color(0xFFFAE300),
                            pressedColor: DaepiroColorStyle.black.withOpacity(0.1),
                            child: KakaoWidget(),
                          verticalPadding: 16,
                        ),
                        SizedBox(height: screenHeight * 0.009,),
                        PrimaryFilledButton(
                            onPressed: () async {
                              String token = await ref.read(loginControllerProvider.notifier).naverLogin();
                              await ref.read(loginControllerProvider.notifier).getSocialToken('naver',token);
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
}