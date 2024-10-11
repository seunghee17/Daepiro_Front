import 'package:daepiro/presentation/widgets/button/primary_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/DaepiroTheme.dart';

class OnboardingFinalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 48),
              Text(
                '이젠 대피로와 함께\n안전한 생활을 시작해보세요!',
                style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.g_900),
              ),
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: PrimaryFilledButton(
                    onPressed: () => GoRouter.of(context).go('/home'),
                    backgroundColor: DaepiroColorStyle.o_500,
                    pressedColor: DaepiroColorStyle.o_500,
                    borderRadius: 8,
                    child: Text(
                      '대피로 시작하기',
                      style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.white),
                    ),
                    verticalPadding: 12
                ),
              ),
              SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}