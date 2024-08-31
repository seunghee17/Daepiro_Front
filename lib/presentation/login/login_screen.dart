import 'dart:io';

import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:daepiro/presentation/widgets/button/CustomElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/model/request/token_request.dart';
import 'login_controller.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenHeight = MediaQuery.of(context).size.height;
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
                      onPressed: (){},
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
 

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   //provider 상태 구독
  //   //위젯이 자동으로 렌더링된다
  //   final state = ref.watch(loginControllerProvider);
  //   final tokken = 'kakao'; //예시로 넣어둠
  //   final TokenRequest request = TokenRequest(token: tokken);
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('login screen'),),
  //     body: Column(
  //       children: [
  //         if(state.isLoading)
  //           const CircularProgressIndicator(),
  //         ElevatedButton(
  //             onPressed: () async {
  //               //provider의 상태 읽는다
  //               //상태 변경에 대한 위젯 빌드는 하지 않는다
  //               await ref.read(loginControllerProvider.notifier).tokenData();
  //             },
  //             child: Text('login')
  //         )
  //       ],
  //     ),
  //   );
  // }



}