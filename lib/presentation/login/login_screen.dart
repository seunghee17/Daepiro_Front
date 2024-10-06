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
//질문하고 답변 듣고 만들기 시작..이해안되는 부분...
class LoginScreen extends ConsumerStatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isAllChecked = false;
  late List<bool> isChecked;
  late List<bool> isHighlighted;
  bool isAllAgreePressed = false;
  List<String> permissionDescription = ['위치권한', '알림', '카메라', '사진'];
  List<String> permissionSubDescription = ['사용자 위치 확인', '재난 알림 수신', '커뮤니티', '커뮤니티'];

  @override
  void initState() {
    super.initState();
    isChecked = List<bool>.filled(4, false);
    isHighlighted = List<bool>.filled(4, false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      permissionBottomSheet(context, MediaQuery.of(context).size.height);
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(loginControllerProvider);
    var screenHeight = MediaQuery.of(context).size.height;

    ref.listen<AsyncValue<LoginState>>(loginControllerProvider, (previous, next) {
      next.whenData((state) {
        if(state.refreshToken != '' && state.refreshToken != '') {
          if(state.isCompletedOnboarding) {
            GoRouter.of(context).go('/home');
          } else {
            GoRouter.of(context).go('/onboarding');
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
                        LoginButton(
                            Color(0xFFFAE300),
                            () async {
                              String token = await ref.read(loginControllerProvider.notifier).kakaoLogin();
                              await ref.read(loginControllerProvider.notifier).getSocialToken('kakao',token);
                            },
                          KakaoWidget(),
                        ),
                        SizedBox(height: 8),
                        LoginButton(
                          Color(0xFF03C75A),
                              () async {
                            String token = await ref.read(loginControllerProvider.notifier).naverLogin();
                            await ref.read(loginControllerProvider.notifier).getSocialToken('naver',token);
                          },
                          NaverWidget(),
                        ),
                        SizedBox(height: 8),
                        if(Platform.isIOS)
                          LoginButton(
                            DaepiroColorStyle.black,
                                () async {
                            },
                            AppleWidget(),
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
  
  void permissionBottomSheet(BuildContext context, double height) {
    showModalBottomSheet(
      enableDrag: false,
        context: context,
        builder: (context) {
          return Container(
            color: DaepiroColorStyle.white,
            width: double.infinity,
            height: height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
            ),
            child: Column(
              children: [
                SizedBox(height: 24,),
                Text(
                  '대피로는 사용자의 위치를 받아서\n재난 알림을 전송해요.',
                  style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          allAgreeWidget(),
                          ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTapDown: (details) {
                                  setState(() {
                                    isHighlighted[index] = !isHighlighted[index];
                                    isChecked[index] = !isChecked[index];
                                  });
                                },
                                onTapUp: (details) {
                                  setState(() {
                                    isHighlighted[index] = !isHighlighted[index];
                                  });
                                },
                                child: permissionWidget(index),
                              );
                            }
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 44),
                Text(
                  '권한을 허용하지 않아도 서비스를 사용할 수 있으나\n일부 서비스 이용이 제한될 수 있어요.',
                  style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_300),
                ),
                PrimaryFilledButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                    backgroundColor: DaepiroColorStyle.g_700,
                    pressedColor: DaepiroColorStyle.g_600,
                    borderRadius: 8,
                    child: Text('다음', style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.white)),
                    verticalPadding: 12
                ),
              ],
            ),
          );
        }
    );
  }

  Widget allAgreeWidget() {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isAllAgreePressed = true;
          _isAllChecked = !_isAllChecked;
        });
      },
      onTapUp: (details) {
        setState(() {
          isAllAgreePressed = false;
        });
      },
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: isAllAgreePressed ? DaepiroColorStyle.g_75 : DaepiroColorStyle.g_50,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              children: [
                Checkbox(
                    side: BorderSide(color: Colors.transparent),
                    activeColor: DaepiroColorStyle.g_500,
                    checkColor: DaepiroColorStyle.white,
                    fillColor: MaterialStateProperty.resolveWith((state) {
                      if(!state.contains(MaterialState.selected)) {
                        return DaepiroColorStyle.g_100;
                      }
                      return null;
                    }),
                    value: _isAllChecked,
                    onChanged: (value) {
                      setState(() {
                        _isAllChecked = value!;
                        isChecked.fillRange(0, 5, value);
                      });
                    }),
                SizedBox(width: 8),
                Text(
                  '권한 모두 동의',
                  style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_800),
                )
              ],
            ),
          )
      ),
    );
  }

  Widget permissionWidget(int index) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: isHighlighted[index] ? DaepiroColorStyle.g_50 : DaepiroColorStyle.white,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            children: [
              Checkbox(
                  side: BorderSide(color: Colors.transparent),
                  activeColor: DaepiroColorStyle.g_500,
                  checkColor: DaepiroColorStyle.white,
                  fillColor: MaterialStateProperty.resolveWith((state) {
                    if(!state.contains(MaterialState.selected)) {
                      return DaepiroColorStyle.g_100;
                    }
                    return null;
                  }),
                  value:isChecked[index],
                  onChanged: (value) {
                    setState(() {
                      isChecked[index] = value!;
                    });
                  }),
              SizedBox(width: 8,),
              Text(
                permissionDescription[index],
                style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_800),
              ),
              Spacer(),
              Text(
                permissionSubDescription[index],
                style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_300),
              ),
            ],
          ),
        )
    );
  }
}