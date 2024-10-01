import 'package:daepiro/presentation/onboarding/onboarding_controller.dart';
import 'package:daepiro/presentation/widgets/button/secondary_filled_button.dart';
import 'package:daepiro/presentation/widgets/button/secondary_light_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widgets/DaepiroTheme.dart';

class OnboardingThirdScreen extends ConsumerStatefulWidget {
  const OnboardingThirdScreen({super.key});

  @override
  OnboardingThirdState createState() => OnboardingThirdState();
}

class OnboardingThirdState extends ConsumerState<OnboardingThirdScreen> {


  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingControllerProvider);
    var screenHeight = MediaQuery.of(context).size.height; //812
    var screenWidth = MediaQuery.of(context).size.width; //375

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: state.when(
            data: (state) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            percent: 0.6,
                            lineHeight: 10,
                            backgroundColor: DaepiroColorStyle.g_50,
                            progressColor: DaepiroColorStyle.o_300,
                            barRadius: Radius.circular(10.0),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          '2/3',
                          style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_100),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    RichText(
                        text: TextSpan(
                          text: '재난문자를 수신 받을 ',
                          style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.black),
                          children: [
                            TextSpan(
                              text: '지역',
                              style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.o_400),
                            ),
                            TextSpan(
                              text: '을\n',
                              style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.black),
                            ),
                            TextSpan(
                              text: '설정해 주세요.',
                              style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.black),
                            ),
                          ]
                        )
                    ),
                    SizedBox(height: 4),
                    Text(
                      '지역은 지번주소로 설정해주세요.\n지역은 최대 3개까지 추가할 수 있어요.',
                      style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_300),
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: 69,
                      child: SecondaryFilledButton(
                          onPressed: (){},
                          radius: 99,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Center(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/home.svg',
                                          colorFilter: ColorFilter.mode(DaepiroColorStyle.white, BlendMode.srcIn)
                                      ),
                                      Text(
                                        '집',
                                        style: DaepiroTextStyle.body_2_b.copyWith(color: DaepiroColorStyle.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (error, stack) => Text('에러: ${error}'),
            loading: () => const CircularProgressIndicator()
        ),
      ),
    );
  }

  // Widget SelectSection(double height, double width) {
  //   return Container(
  //     width: double.infinity,
  //     child: Row(
  //       children: [
  //         SecondaryFilledButton(
  //             onPressed: (){},
  //             radius: 99,
  //             child: Container(
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: height * 0.043),
  //                 child: Row(
  //                   children: [
  //                     SvgPicture.asset(
  //                       'assets/icons/home.svg',
  //                       colorFilter: ColorFilter.mode(DaepiroColorStyle.white, BlendMode.srcIn)
  //                     ),
  //                     SizedBox(width: width * 0.0053),
  //                     Text(
  //                       '집',
  //                       style: DaepiroTextStyle.body_2_b.copyWith(color: DaepiroColorStyle.white),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             )
  //         ),
  //         SizedBox(width: width * 0.021),
  //         SecondaryLightButton(
  //             onPressed: (){},
  //             radius: 99,
  //             child: Container(
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: height * 0.043),
  //                 child: Row(
  //                   children: [
  //                     SvgPicture.asset(
  //                         'assets/icons/plus.svg',
  //                         colorFilter: ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn)
  //                     ),
  //                     SizedBox(width: width * 0.0053),
  //                     Text(
  //                       '지역 추가',
  //                       style: DaepiroTextStyle.body_2_b.copyWith(color: DaepiroColorStyle.g_600),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             )
  //         )
  //       ],
  //     ),
  //   );
  // }
  
}