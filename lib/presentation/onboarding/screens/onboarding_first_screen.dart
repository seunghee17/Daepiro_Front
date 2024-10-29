import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:daepiro/presentation/widgets/button/primary_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height; //812
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO: 여기 수정해야함
             SizedBox(height: screenHeight * 0.059,),
              headerWidget(),
              Spacer(),
              footerWidget(context),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '반복되는 수신과 불명확한 재난문자로\n불편함을 겪으셨나요?',
          style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_500),
        ),
        SizedBox(height: 8),
        Text(
          '대피로가 해결해드릴게요.',
          style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.g_900),
        ),
      ],
    );
  }

  Widget footerWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      child: PrimaryFilledButton(
          onPressed: () {
            GoRouter.of(context).push('/onboarding/first');
          },
          backgroundColor: Color(0xFFFF6929),
          pressedColor:  Color(0xFFFF6929),
          child: Text(
            '다음',
            style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.white),
          ),
          verticalPadding: 12, borderRadius: 8),
    );
  }

  //TODO 일러스트 추가해야함

}