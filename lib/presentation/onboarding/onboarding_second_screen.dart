import 'dart:io';

import 'package:daepiro/presentation/onboarding/onboarding_controller.dart';
import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:daepiro/presentation/widgets/button/primary_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OnboardingSecondScreen extends ConsumerStatefulWidget {
  const OnboardingSecondScreen({super.key});

  @override
  OnboardingState createState() => OnboardingState();
}

class OnboardingState extends ConsumerState<OnboardingSecondScreen> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController nicknameController = new TextEditingController();
  int _nameLength = 0;
  int _nicknameLength = 0;
  bool cautionName = false;
  bool cautionNick = false;

  @override
  void initState() {
    super.initState();
    ref.read(onboardingControllerProvider);

    nameController.addListener(updateNameState);
    nicknameController.addListener(updateNickState);

  }

  void updateNameState() {
    var newNameLength = nameController.text.length;
    var newState = 'NONE';
    var newCaution = false;

    if(_checkForEnglish(nameController.text)) {
      newState = 'ENG_INPUT';
      cautionName = true;
    } else if(newNameLength > 6) {
      newState = 'OVER_LENGTH_NAME';
      newCaution = true;
    } else if(newNameLength > 1) {
      newState = 'NORMAL';
      newCaution = false;
    }
    if(newCaution != cautionName || _nameLength != newNameLength) {
      setState(() {
        _nameLength = newNameLength;
        cautionName = newCaution;
        ref.read(onboardingControllerProvider.notifier).setNameState(newState);
      });
    }
  }

  void updateNickState() {
    var newNickLength = nicknameController.text.length;
    var newState = 'NORMAL';
    var newCaution = false;

    if(newNickLength > 10) {
      newState = 'OVER_LENGTH_NICK';
      newCaution = true;
    } else if(newNickLength > 1) {
      newState = 'NORMAL';
    }
    if (newCaution != cautionNick || _nicknameLength != newNickLength) {
      setState(() {
        _nicknameLength = newNickLength;
        cautionNick = newCaution;
        ref.read(onboardingControllerProvider.notifier).setNickState(newState);
      });
    }
  }

  bool _checkForEnglish(String text) {
    final englishPattern = RegExp(r'[a-zA-Z]');
    return englishPattern.hasMatch(text);
  }

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
              bool canProceed = state.nameState == 'NORMAL' && state.nicknameState == 'NORMAL';
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.053),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.024,),
                    Row(
                      children: [
                        Expanded(
                          child: LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            percent: 0.3,
                            lineHeight: 10,
                            backgroundColor: DaepiroColorStyle.g_50,
                            progressColor: DaepiroColorStyle.o_300,
                            barRadius: Radius.circular(10.0),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.042),
                        Text(
                          '1/3',
                          style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_100),
                        ),
                      ],
                    ),
                     SizedBox(height: screenHeight * 0.029,),
                     RichText(
                         text: TextSpan(
                           text: '기본 정보',
                           style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.o_400),
                           children: [
                             TextSpan(
                               text: ' 를 입력해주세요.' ,
                               style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.black),
                             )
                           ]
                         ),

                     ),
                      SizedBox(height: screenHeight * 0.004,),
                      Text(
                        '이름은 기본 서비스 이용을 위해,\n닉네임은 커뮤니티에서 사용돼요.',
                        style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_300),
                      ),
                      SizedBox(height: screenHeight * 0.029),
                    Text(
                      '이름',
                      style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
                    ),
                    SizedBox(height: screenHeight * 0.009),
                      OnboardingTextField(nameController, _nameLength, cautionName, '6자 이내의 한글', 6),
                      if(state.nameState == 'ENG_INPUT')
                        StateText('ENG_INPUT','*한글만 입력 가능합니다.'),
                      if(state.nameState == 'OVER_LENGTH_NAME')
                        StateText('OVER_LENGTH','*최대 10글자만 입력 가능합니다.'),
                    SizedBox(height: screenHeight * 0.019),
                    Text(
                      '닉네임',
                      style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
                    ),
                    SizedBox(height: screenHeight * 0.009),
                    OnboardingTextField(nicknameController, _nicknameLength, cautionNick, '10자 이내의 한글/영문/숫자', 10),
                    if(state.nicknameState == 'OVER_LENGTH_NICK')
                      StateText('OVER_LENGTH','*최대 10글자만 입력 가능합니다.'),
                    if(state.nicknameState == 'NORMAL' && state.nicknameState != 'NONE')
                      StateText('NORMAL','*사용 가능한 닉네임 입니다.'),
                    Spacer(),
                    BottomWidget(context, canProceed, screenHeight, screenWidth),
                    SizedBox(height: screenHeight * 0.019,)
                  ],
                ),
              );

            },
            error: (error, stack) => Text('에러: ${error}'),
            loading: () => const CircularProgressIndicator()
        )
      ),
    );
  }

  Widget BottomWidget(BuildContext context, bool isAvailable, double height, double width) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              child: PrimaryFilledButton(
                  onPressed: GoRouter.of(context).pop,
                  backgroundColor: DaepiroColorStyle.g_50,
                  pressedColor: DaepiroColorStyle.g_75,
                  disabledColor: DaepiroColorStyle.g_50,
                  child: Text(
                    '이전',
                    style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_700),
                  ),
                  verticalPadding: height * 0.014
              )
          ),
          SizedBox(width: width * 0.021,),
          Expanded(
              child: PrimaryFilledButton(
                  onPressed: isAvailable ? () =>   GoRouter.of(context).replace('/onboarding/second') : null,
                  backgroundColor: DaepiroColorStyle.o_500,
                  pressedColor: DaepiroColorStyle.o_600,
                  disabledColor: DaepiroColorStyle.o_100,
                  child: Text(
                    '다음',
                    style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.white),
                  ),
                  verticalPadding: height * 0.014
              )
          ),
        ],
      )
    );
  }


  Widget OnboardingTextField(TextEditingController _controller, int length, bool isCaution, String hint, int max) {
    return TextField(
      controller: _controller,
      style: DaepiroTextStyle.body_1_m.copyWith(
          color: DaepiroColorStyle.g_900,
        decorationThickness: 0
      ),
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.all(16),
        fillColor: DaepiroColorStyle.g_50,
        hintText: hint,
        hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
        suffixText: '${length}/${max}',
        suffixStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
                width: 1.5,
                color: isCaution ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_100
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: DaepiroColorStyle.g_50)
        ),
      ),
    );
  }

  Widget StateText(String state, String textData) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          Text(
            textData,
            style: DaepiroTextStyle.body_2_m.copyWith(color: state == 'NORMAL' ? DaepiroColorStyle.gre_400 : DaepiroColorStyle.r_300)
          ),
        ]
      ),
    );
  }

}

