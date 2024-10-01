import 'package:daepiro/presentation/onboarding/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widgets/DaepiroTheme.dart';

class OnboardingFourthScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    return Scaffold(
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
                            percent: 1.0,
                            lineHeight: 10,
                            backgroundColor: DaepiroColorStyle.g_50,
                            progressColor: DaepiroColorStyle.o_300,
                            barRadius: Radius.circular(10.0),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          '3/3',
                          style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_100),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    RichText(
                        text: TextSpan(
                            text: '수신 받을 ',
                            style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.black),
                            children: [
                              TextSpan(
                                text: '재난 유형',
                                style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.o_400),
                              ),
                              TextSpan(
                                text: '을\n',
                                style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.black),
                              ),
                              TextSpan(
                                text: '선택해주세요.',
                                style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.black),
                              ),
                            ]
                        )
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
}