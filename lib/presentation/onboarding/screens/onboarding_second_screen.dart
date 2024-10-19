import 'package:daepiro/presentation/onboarding/controller/onboarding_view_model.dart';
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
    ref.read(onboardingViewModelProvider);
    nameController.addListener(updateNameState);
    nicknameController.addListener(updateNickState);
  }

  void updateNameState() {
    var newNameLength = nameController.text.length;
    var newState = 'NONE';
    var newCaution = false;

    if(_checkForEnglish(nameController.text)) {
      newState = 'ENG_INPUT';
      newCaution = true;
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
        ref.read(onboardingViewModelProvider.notifier).setNameState(newState);
      });
    }
  }

  void updateNickState() async {
    var newNickLength = nicknameController.text.length;
    var newState = 'NORMAL';
    var newCaution = false;
    var isAvailable = await ref.read(onboardingViewModelProvider.notifier).checkNickName(nicknameController.text);

    if(newNickLength > 10) {
      newState = 'OVER_LENGTH_NICK';
      newCaution = true;
    } else if(newNickLength > 1) {
      newState = 'NORMAL';
      newCaution = false;
    } else if( !isAvailable!) {
      newState = 'SAME';
      newCaution = true;
    } else if(!_checkForSpecialCharacter(nicknameController.text)) {
      newState = 'ERRORCHARACTER';
      newCaution = true;
    }
    if (newCaution != cautionNick || _nicknameLength != newNickLength) {
      setState(() {
        _nicknameLength = newNickLength;
        cautionNick = newCaution;
        ref.read(onboardingViewModelProvider.notifier).setNickState(newState);
      });
    }
  }

  bool _checkForEnglish(String text) {
    final pattern = RegExp(r'[a-zA-Z0-9\p{P}]');
    return pattern.hasMatch(text);
  }

  bool _checkForSpecialCharacter(String text) {
    final regex = RegExp(r'[^가-힣a-zA-Z0-9]');
    return !regex.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingViewModelProvider);
    var keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: state.when(
            data: (state) {
              bool canProceed = state.nameState == 'NORMAL' && state.nicknameState == 'NORMAL';
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20),
                            headerWidget(),
                            SizedBox(height: 24),
                            Text('이름', style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900)),
                            SizedBox(height: 8),
                            NameTextField(nameController, _nameLength, cautionName, state.nameState),
                              if(state.nameState == 'ENG_INPUT')
                                StateText('ENG_INPUT','*이름은 한글만 입력 가능해요.'),
                              if(state.nameState == 'OVER_LENGTH_NAME')
                                StateText('OVER_LENGTH','*최대 6자까지 작성 가능해요.'),
                            SizedBox(height: 16),
                            Text(
                              '닉네임',
                              style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
                            ),
                            SizedBox(height: 8),
                            NickNameTextField(nicknameController, _nicknameLength, cautionNick, ''),
                            if(state.nicknameState == 'OVER_LENGTH_NICK')
                              StateText('OVER_LENGTH','*최대 10글자만 입력 가능합니다.'),
                            if(state.nicknameState == 'NORMAL' && state.nicknameState != 'NONE' && state.nicknameState != 'SAME' && state.nicknameState != 'ERRORCHARACTER')
                              StateText('NORMAL','*사용 가능한 닉네임 입니다.'),
                            if(state.nicknameState == 'SAME')
                              StateText('NORMAL','*이미 사용 중인 닉네임이에요.'),
                            if(state.nicknameState == 'ERRORCHARACTER')
                              StateText('ERRORCHARACTER','*닉네임은 한글/영문/숫자만 입력 가능해요.'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: keyboardHeight), // 키보드 높이만큼 하단 패딩 추가
                      child: BottomWidget(context, canProceed),
                    ),
                    SizedBox(height: 16)
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

  Widget BottomWidget(BuildContext context, bool isAvailable) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              child: PrimaryFilledButton(
                  onPressed: GoRouter.of(context).pop,
                  backgroundColor: DaepiroColorStyle.g_50,
                  pressedColor: DaepiroColorStyle.g_75,
                  borderRadius: 8.0,
                  disabledColor: DaepiroColorStyle.g_50,
                  child: Text(
                    '이전',
                    style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_700),
                  ),
                  verticalPadding: 12
              )
          ),
          SizedBox(width: 8),
          Expanded(
              child: PrimaryFilledButton(
                  onPressed: isAvailable ? () async =>   {
                    await ref.read(onboardingViewModelProvider.notifier).updateUserName(nameController.text),
                    GoRouter.of(context).push('/onboarding/second')
                  }: null,
                  backgroundColor: isAvailable? DaepiroColorStyle.o_500 : DaepiroColorStyle.o_100,
                  pressedColor: DaepiroColorStyle.o_600,
                  borderRadius: 8.0,
                  child: Text(
                    '다음',
                    style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.white),
                  ),
                  verticalPadding: 12
              )
          ),
        ],
      )
    );
  }

  Widget headerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            SizedBox(width: 16),
            Text(
              '1/3',
              style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_100),
            ),
          ],
        ),
        SizedBox(height: 24),
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
        SizedBox(height: 4),
        Text(
          '이름은 기본 서비스 이용을 위해,\n닉네임은 커뮤니티에서 사용돼요.',
          style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_300),
        ),
      ],
    );
  }

  //이름 입력란
  Widget NameTextField(TextEditingController controller, int length, bool isCaution, String nameState) {
    return Stack(
      children: [
      TextField(
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      style: DaepiroTextStyle.body_1_m.copyWith(
          color: DaepiroColorStyle.g_900,
          decorationThickness: 0
      ),
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.all(16),
        fillColor: DaepiroColorStyle.g_50,
        hintText: '6자 이내의 한글',
        hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
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
    ),
        Positioned(
            right:16,
            top:16,
            bottom: 16,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${length}/6', style: DaepiroTextStyle.body_1_m.copyWith(color: nameState == 'OVER_LENGTH_NAME' ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_200)),
              ],
            )
        ),
      ],
    );
  }

  //닉네임 입력란
  Widget NickNameTextField(TextEditingController _controller, int length, bool isCaution, String state) {
    return Stack(
      children: [
        TextField(
          controller: _controller,
          onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
          style: DaepiroTextStyle.body_1_m.copyWith(
              color: DaepiroColorStyle.g_900,
              decorationThickness: 0
          ),
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.all(16),
            fillColor: DaepiroColorStyle.g_50,
            hintText: '10자 이내의 한글/영문/숫자',
            hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
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
        ),
        Positioned(
            right:16,
            top:16,
            bottom: 16,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${length}/10', style: DaepiroTextStyle.body_1_m.copyWith(color: state == 'OVER_LENGTH_NICK' ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_200)),
              ],
            )
        ),
      ],
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

