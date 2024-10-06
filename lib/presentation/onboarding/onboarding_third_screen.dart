import 'package:daepiro/presentation/onboarding/onboarding_controller.dart';
import 'package:daepiro/presentation/widgets/button/secondary_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widgets/DaepiroTheme.dart';
import '../widgets/button/primary_filled_button.dart';
import 'onboarding_second_screen.dart';

class OnboardingThirdScreen extends ConsumerStatefulWidget {
  const OnboardingThirdScreen({super.key});

  @override
  OnboardingThirdState createState() => OnboardingThirdState();
}

class OnboardingThirdState extends ConsumerState<OnboardingThirdScreen> with WidgetsBindingObserver {
  List<TextEditingController> jusoControllers = [TextEditingController()];
  List<TextEditingController> locationControllers = [TextEditingController()];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed) {
     updateControllers();
   }
  }

  void updateControllers() {
    final inputJusoList = ref.read(onboardingControllerProvider).value?.inputJusoList ?? [];
    if(inputJusoList.isNotEmpty) {
      for(int i=0; i<inputJusoList.length; i++) {
        if(i<jusoControllers.length) {
          jusoControllers[i].text = inputJusoList[i];
        } else {
          jusoControllers.add(TextEditingController(text: inputJusoList[i]));
        }
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void addAddressInput() {
    if(jusoControllers.length < 3) {
      setState(() {
        jusoControllers.insert(0, TextEditingController());
        locationControllers.insert(0,TextEditingController());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingControllerProvider);

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
                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(
                                  jusoControllers.length,
                                      (index) {
                                    if (index == jusoControllers.length - 1) {
                                      // 마지막 항목에 대해 HomeAddress를 생성
                                      return InputHomeAddress(
                                          jusoControllers.last,
                                          () async {
                                            await ref.read(onboardingControllerProvider.notifier).initJusoList();
                                            GoRouter.of(context).push('/onboarding/juso/집');
                                          }
                                      );
                                    } else {
                                      // 나머지 항목에 대해 LocationAddress를 생성
                                      return InputLocationAddress(
                                          jusoControllers[index],
                                          () async {
                                            await ref.read(onboardingControllerProvider.notifier).initJusoList();
                                            GoRouter.of(context).push('/onboarding/juso/${locationControllers[index].text}');
                                          },
                                          index
                                      );
                                    }
                                  }
                              ),
                            ],
                          ),
                        )
                    ),
                    //Spacer(),
                    bottomWidget(context)
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

  Widget homeChipWidget() {
    return SecondaryFilledButton(
        onPressed: (){},
        radius: 99,
        backgroundColor: DaepiroColorStyle.g_600,
        overlayColor: DaepiroColorStyle.g_600,
      verticalPadding: 8,
      horizontalPadding: 16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                'assets/icons/home.svg',
                colorFilter: ColorFilter.mode(DaepiroColorStyle.white, BlendMode.srcIn)
            ),
            SizedBox(width: 2,),
            Text(
              '집',
              style: DaepiroTextStyle.body_2_b.copyWith(color: DaepiroColorStyle.white),
            ),
          ],
        ),
    );
  }

  Widget locationChip(TextEditingController controller) {
    return IntrinsicWidth(
      child: TextField(
        cursorWidth: 4,
        cursorColor: DaepiroColorStyle.white,
        controller: controller,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: DaepiroTextStyle.body_2_b.copyWith(color: DaepiroColorStyle.white),
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(0, 0, 16, 0),
          fillColor: DaepiroColorStyle.g_600,
          prefixIcon:  Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
            child: SvgPicture.asset(
                'assets/icons/location.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(DaepiroColorStyle.white, BlendMode.srcIn)
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(99))
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(99))
          ),
        ),
      ),
    );
  }

  Widget plusChipWidget() {
    bool isButtonDisabled = jusoControllers.length == 1 && jusoControllers[0].text.isEmpty ||
        jusoControllers.length > 1 && jusoControllers.first.text.isEmpty;
    return SecondaryFilledButton(
      onPressed: isButtonDisabled ? null : addAddressInput,
      radius: 99,
      horizontalPadding: 16,
      verticalPadding: 8,
      backgroundColor: DaepiroColorStyle.g_50,
      disableColor: DaepiroColorStyle.g_50,
      overlayColor: DaepiroColorStyle.g_50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
              'assets/icons/plus.svg',
              colorFilter: ColorFilter.mode(isButtonDisabled ? DaepiroColorStyle.g_100 : DaepiroColorStyle.g_600, BlendMode.srcIn)
          ),
          Text(
            '지역추가',
            style: DaepiroTextStyle.body_2_b.copyWith(color: isButtonDisabled ? DaepiroColorStyle.g_100 : DaepiroColorStyle.g_600),
          ),
        ],
      ),
    );
  }

  //칩 + 텍스트필드
  Widget InputHomeAddress(TextEditingController _controller, VoidCallback onTap ) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeChipWidget(),
          SizedBox(height: 10),
          GestureDetector(
            onTap: onTap,
            child: TextField(
              enabled: false,
              focusNode: FocusNode(canRequestFocus: false),
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: DaepiroColorStyle.g_50,
                hintText: '동/읍/면/리',
                hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _controller.text.isEmpty
                      ? SvgPicture.asset(
                      'assets/icons/search.svg',
                      colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn)
                  ) : SvgPicture.asset(
                      'assets/icons/delete.svg',
                      colorFilter: ColorFilter.mode(DaepiroColorStyle.g_400, BlendMode.srcIn)
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: DaepiroColorStyle.g_50)
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: DaepiroColorStyle.g_50)
                ),
            ),
            ),
          ),
          SizedBox(height: 24),
          if(jusoControllers.length <3)
          plusChipWidget(),
        ],
      ),
    );
  }

  //칩 + 텍스트필드 지역버전
  Widget InputLocationAddress(TextEditingController _controller, VoidCallback onTap, int index ) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          locationChip(locationControllers[index]),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: onTap,
            child: TextField(
              enabled: false,
              focusNode: FocusNode(canRequestFocus: false),
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: DaepiroColorStyle.g_50,
                hintText: '동/읍/면/리',
                hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _controller.text.isEmpty
                      ? SvgPicture.asset(
                      'assets/icons/search.svg',
                      colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn)
                  ) : SvgPicture.asset(
                      'assets/icons/delete.svg',
                      colorFilter: ColorFilter.mode(DaepiroColorStyle.g_400, BlendMode.srcIn)
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: DaepiroColorStyle.g_50)
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: DaepiroColorStyle.g_50)
                ),
              ),
            ),
          ),
          SizedBox(height: 24)
        ],
      ),
    );
  }

  Widget bottomWidget(BuildContext context) {
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
                    onPressed: () =>   GoRouter.of(context).push('/onboarding/third'),
                    backgroundColor: DaepiroColorStyle.o_500,
                    pressedColor: DaepiroColorStyle.o_600,
                    borderRadius: 8.0,
                    disabledColor: DaepiroColorStyle.o_500,
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
  
}