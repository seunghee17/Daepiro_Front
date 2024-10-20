import 'dart:io';
import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../onboarding/screens/permission_screen.dart';
import '../widgets/button/secondary_filled_button.dart';
import 'login_view_model.dart';
import 'login_state.dart';

class LoginScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(loginViewModelProvider);
    final screenHeight = MediaQuery.of(context).size.height;

    ref.listen<AsyncValue<LoginState>>(loginViewModelProvider, (previous, next) {
      next.whenData((state) {
        if(state.refreshToken != '' && state.refreshToken != '') {
          if(state.isCompletedOnboarding) {
            GoRouter.of(context).go('/home');
          } else {
              showModalBottomSheet(
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return PermissionScreen(
                      onPermissionCheck: () async {
                        GoRouter.of(context).pop();
                        var locationGrant = await ref.read(loginViewModelProvider.notifier).checkLocationPermission();
                        if(!locationGrant) {
                          locationDialog(context, ref);
                        } else {
                          GoRouter.of(context).go('/onboarding');
                        }
                      },
                    );
                  }
              );
          }
        }
      });
    });

    return controller.when(
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
                        LoginButton(
                            Color(0xFFFAE300),
                            () async {
                              String token = await ref.read(loginViewModelProvider.notifier).kakaoLogin();
                              await ref.read(loginViewModelProvider.notifier).getSocialToken('kakao',token);
                            },
                          KakaoWidget(),
                        ),
                        SizedBox(height: 8),
                        LoginButton(
                          Color(0xFF03C75A),
                              () async {
                            String token = await ref.read(loginViewModelProvider.notifier).naverLogin();
                            await ref.read(loginViewModelProvider.notifier).getSocialToken('naver',token);
                          },
                          NaverWidget(),
                        ),
                        SizedBox(height: 8),
                        if(Platform.isIOS)
                          Column(
                            children: [
                              LoginButton(
                                DaepiroColorStyle.black,
                                    () async {
                                },
                                AppleWidget()),
                              SizedBox(height: 41)
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(height:16)
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

  Widget LoginButton(
      Color backgroundColor,
      VoidCallback onPressed,
      Widget child ) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            overlayColor: DaepiroColorStyle.black.withOpacity(0.1),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            shadowColor: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onPressed,
        child: child
    );
  }

  void locationDialog(BuildContext context, WidgetRef ref) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            titlePadding: EdgeInsets.fromLTRB(20, 24, 20, 4),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '대피로는 사용자의 위치를 받아서\n재난 알림을 전송해요.',
                  style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_900),
                ),
              ],
            ),
            contentPadding:EdgeInsets.fromLTRB(20, 0, 20, 24) ,
            content: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      '만약 위치 권한을 허용하지 않는다면\n거주지를 기준으로 재난문자가 발송돼요.',
                      style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_500),
                    ),
                  ]
              ),
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: SecondaryFilledButton(
                        verticalPadding: 12,
                        onPressed: () {
                          GoRouter.of(context).pop();
                          GoRouter.of(context).go('/onboarding');
                        },
                        radius: 8,
                        backgroundColor: DaepiroColorStyle.g_50,
                        pressedColor:  DaepiroColorStyle.g_75,
                        child: Text(
                          textAlign: TextAlign.center,
                          '위치 미허용',
                          style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_700),
                        )
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: SecondaryFilledButton(
                        verticalPadding: 12,
                        onPressed: () async {
                          await ref.read(loginViewModelProvider.notifier).requestLocationPermission();
                          GoRouter.of(context).pop();
                          GoRouter.of(context).go('/onboarding');
                        },
                        radius: 8,
                        backgroundColor: DaepiroColorStyle.g_700,
                        pressedColor:  DaepiroColorStyle.g_400,
                        child: Text(
                          textAlign: TextAlign.center,
                          '위치 허용',
                          style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.white),
                        )
                    ),
                  )
                ],
              ),
            ],
          );
        }
    );
  }

}