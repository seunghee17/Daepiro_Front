import 'package:daepiro/presentation/onboarding/widget/location_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../widgets/DaepiroTheme.dart';
import '../../widgets/button/primary_filled_button.dart';
import '../../widgets/button/secondary_filled_button.dart';
import '../controller/onboarding_view_model.dart';
import '../state/onboarding_state.dart';

class OnboardingThirdScreen extends ConsumerStatefulWidget {
  const OnboardingThirdScreen({super.key});

  @override
  OnboardingThirdState createState() => OnboardingThirdState();
}

class OnboardingThirdState extends ConsumerState<OnboardingThirdScreen> {
  TextEditingController homeController = TextEditingController();
  TextEditingController jusoController1 = TextEditingController();
  TextEditingController jusoController2 = TextEditingController();
  TextEditingController jusoNickController1 = TextEditingController();
  TextEditingController jusoNickController2 = TextEditingController();

  late bool juso1Visible;
  late bool juso2Visible;
  String errorStateNick1 = 'AVAILABLE';
  String errorStateNick2 = 'AVAILABLE';

  @override
  void initState() {
    super.initState();

    juso1Visible = false;
    juso2Visible = false;

    // 초기 상태 설정
    final state = ref.read(onboardingViewModelProvider);
    if (state.value != null && state.value!.inputJusoList.isNotEmpty) {
      if (state.value!.inputJusoList.length > 0) {
        homeController.text = state.value!.inputJusoList[0];
      }
      if (state.value!.inputJusoList.length > 1 && juso1Visible) {
        jusoController1.text = state.value!.inputJusoList[1];
      }
      if (state.value!.inputJusoList.length > 2 && juso2Visible) {
        jusoController2.text = state.value!.inputJusoList[2];
      }
    }

    // 검색 기록 초기화
    Future(() {
      ref.read(onboardingViewModelProvider.notifier).initSearchHistory();
    });

    // 별명 입력 시 오류 상태 자동 업데이트 리스너 추가
    jusoNickController1.addListener(() {
      String newState = ref.read(onboardingViewModelProvider.notifier).checklocationControllerState(jusoNickController1);
      setState(() {
        errorStateNick1 = newState;
      });
    });

    jusoNickController2.addListener(() {
      String newState = ref.read(onboardingViewModelProvider.notifier).checklocationControllerState(jusoNickController2);
      setState(() {
        errorStateNick2 = newState;
      });
    });
  }

  @override
  void dispose() {
    homeController.dispose();
    jusoController1.dispose();
    jusoController2.dispose();
    jusoNickController1.dispose();
    jusoNickController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingViewModelProvider);

    // 상태 변화 리스너 추가: build() 내에서 setState 호출을 피하기 위함
    ref.listen<AsyncValue<OnboardingState>>(onboardingViewModelProvider, (previous, next) {
      next.whenData((data) {
        if(data.inputJusoList.isNotEmpty) {
          if(data.inputJusoList.length > 0 && homeController.text != data.inputJusoList[0]) {
            homeController.text = data.inputJusoList[0];
          }
          if(data.inputJusoList.length > 1 && juso1Visible && jusoController1.text != data.inputJusoList[1]) {
            jusoController1.text = data.inputJusoList[1];
          }
          if(data.inputJusoList.length > 2 && juso2Visible && jusoController2.text != data.inputJusoList[2]) {
            jusoController2.text = data.inputJusoList[2];
          }
        } else {
          homeController.clear();
          jusoController1.clear();
          jusoController2.clear();
        }
      });
    });

    return Scaffold(
      body: SafeArea(
        child: state.when(
            data: (state) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    SizedBox(height: 24),
                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              if(juso2Visible)
                                InputLocationAddress2(jusoController2, jusoNickController2, () => GoRouter.of(context).push('/onboarding/juso/${jusoNickController2.text}/2'), ref),
                              if(juso1Visible)
                                InputLocationAddress1(jusoController1, jusoNickController1, () => GoRouter.of(context).push('/onboarding/juso/${jusoNickController1.text}/1'), ref),
                              InputHomeAddress(homeController, () => GoRouter.of(context).push('/onboarding/juso/집/0'), context, ref, juso1Visible, juso2Visible)
                            ],
                          ),
                        ),
                    ),
                    bottomWidget(context, state.inputJusoList.length),
                    SizedBox(height: 16),
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

  //화면의 최상단 영역
  Widget header() {
    return Column(
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
      ],
    );
  }

  //홈칩 + 주소입력창
  Widget InputHomeAddress(
      TextEditingController homecontroller,
      VoidCallback onTap,
      BuildContext context,
      WidgetRef ref,
      bool juso1visible,
      bool juso2visible
      ) {
    String errorState = ref.watch(onboardingViewModelProvider.notifier).checkHomeControllerState(homeController, juso1visible, juso2visible);
    bool isError = errorState == 'LENGTH_ERROR' ? true : false;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeChipWidget(),
          SizedBox(height: 10),
          TextField(
            onTap: onTap,
            enabled: true,
            readOnly: true,
            style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
            focusNode: FocusNode(canRequestFocus: false),
            controller: homecontroller,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: DaepiroColorStyle.g_50,
              hintText: '동/읍/면/리',
              hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: homecontroller.text.isEmpty
                    ? SvgPicture.asset(
                    'assets/icons/search.svg',
                    colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn)
                ) : GestureDetector(
                  onTap: () => deleteDialog(context, ref, '집', homecontroller, 0, MediaQuery.of(context).size.width * 0.8),
                  child: SvgPicture.asset(
                      'assets/icons/delete.svg',
                      colorFilter: ColorFilter.mode(DaepiroColorStyle.g_400, BlendMode.srcIn)
                  ),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: isError ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_50)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: isError ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_50)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: isError ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_50)
              ),
            ),
          ),
          SizedBox(height: 6),
          if(isError)
            Row(
              children: [
                Spacer(),
                Text(
                    '*집 주소를 필수로 입력해주세요',
                  style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.r_300),
                ),
              ],
            ),
          SizedBox(height: 24),
          if(!juso1Visible || !juso2Visible)
            plusChipWidget(ref, homecontroller, jusoController1, jusoController2, juso1visible, juso2visible)
        ],
      ),
    );
  }

  //특정 지역 칩 + 텍스트필드 지역 1
  Widget InputLocationAddress1(TextEditingController juso1controller,TextEditingController jusoNickController1, VoidCallback onTap, WidgetRef ref) {
    bool isError = errorStateNick1 != 'AVAILABLE';
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationChip(
            controller: jusoNickController1,
            onValidInput: () {
              setState(() {
                errorStateNick1 = 'AVAILABLE';
              });
            },
            ref: ref,
          ),
          SizedBox(height: 10,),
          TextField(
            onTap: () {
              if(jusoNickController1.text.isEmpty) {
                setState(() {
                  errorStateNick1 = 'LENGTH_ERROR';
                });
              } else {
                onTap;
              }
            },
            enabled: true,
            readOnly: true,
            focusNode: FocusNode(canRequestFocus: false),
            controller: juso1controller,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: DaepiroColorStyle.g_50,
              hintText: '동/읍/면/리',
              hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: juso1controller.text.isEmpty
                    ? SvgPicture.asset(
                    'assets/icons/search.svg',
                    colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn)
                ) : GestureDetector(
                  onTap: () => deleteDialog(context, ref, jusoNickController1.text, juso1controller, 1, MediaQuery.of(context).size.width * 0.8),
                  child: SvgPicture.asset(
                      'assets/icons/delete.svg',
                      colorFilter: ColorFilter.mode(DaepiroColorStyle.g_400, BlendMode.srcIn)
                  ),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: isError ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_50)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: isError ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_50)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: isError ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_50)
              ),
            ),
          ),
          SizedBox(height: 6),
          if(errorStateNick1 == 'LENGTH_ERROR')
            Row(
              children: [
                Spacer(),
                Text(
                  '*별명 설정은 필수입니다.',
                  style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.r_300),
                ),
              ],
            ),
          if(errorStateNick1 == 'OVERFLOW_ERROR')
            Row(
              children: [
                Spacer(),
                Text(
                  '*최대 8자까지 작성 가능해요.',
                  style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.r_300),
                ),
              ],
            ),
          if(errorStateNick1 == 'NOT_TYPE')
            Row(
              children: [
                Spacer(),
                Text(
                  '*별명은 한글/영문/숫자만 가능합니다.',
                  style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.r_300),
                ),
              ],
            ),
          SizedBox(height: 24)
        ],
      ),
    );
  }

  //특정 지역 칩 + 텍스트필드 지역 2
  Widget InputLocationAddress2(TextEditingController juso2controller,TextEditingController jusoNickController2, VoidCallback onTap, WidgetRef ref) {
    bool isError = errorStateNick2 != 'AVAILABLE';
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        LocationChip(
        controller: jusoNickController2,
        onValidInput: () {
          setState(() {
            errorStateNick2 = 'AVAILABLE';
          });
        },
        ref: ref,
      ),
          SizedBox(height: 10,),
          TextField(
            onTap: () {
              if(jusoNickController2.text.isEmpty) {
                setState(() {
                  errorStateNick2 = 'LENGTH_ERROR';
                });
              } else {
                onTap;
              }
            },
            enabled: true,
            readOnly: true,
            focusNode: FocusNode(canRequestFocus: false),
            controller: juso2controller,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: DaepiroColorStyle.g_50,
              hintText: '동/읍/면/리',
              hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: juso2controller.text.isEmpty
                    ? SvgPicture.asset(
                    'assets/icons/search.svg',
                    colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn)
                ) : GestureDetector(
                  onTap: () => deleteDialog(context, ref, jusoNickController2.text, juso2controller, 2, MediaQuery.of(context).size.width * 0.8),
                  child: SvgPicture.asset(
                      'assets/icons/delete.svg',
                      colorFilter: ColorFilter.mode(DaepiroColorStyle.g_400, BlendMode.srcIn)
                  ),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: isError ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_50)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: isError ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_50)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: isError ? DaepiroColorStyle.r_300 : DaepiroColorStyle.g_50)
              ),
            ),
          ),
          SizedBox(height: 6),
          if(errorStateNick2 == 'LENGTH_ERROR')
            Row(
              children: [
                Spacer(),
                Text(
                  '*별명 설정은 필수입니다.',
                  style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.r_300),
                ),
              ],
            ),
          if(errorStateNick2 == 'OVERFLOW_ERROR')
            Row(
              children: [
                Spacer(),
                Text(
                  '*최대 8자까지 작성 가능해요.',
                  style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.r_300),
                ),
              ],
            ),
          if(errorStateNick2 == 'NOT_TYPE')
            Row(
              children: [
                Spacer(),
                Text(
                  '*별명은 한글/영문/숫자만 가능합니다.',
                  style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.r_300),
                ),
              ],
            ),
          SizedBox(height: 24)
        ],
      ),
    );
  }

  //화면에 사용되는 칩들 정의
  //홈칩
  Widget homeChipWidget() {
    return SecondaryFilledButton(
      onPressed: (){},
      radius: 99,
      backgroundColor: DaepiroColorStyle.g_600,
      pressedColor: DaepiroColorStyle.g_600,
      verticalPadding: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
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
      ),
    );
  }

  //지역 추가 칩
  Widget plusChipWidget(
      WidgetRef ref,
      TextEditingController homecontroller,
      TextEditingController jusoController1,
      TextEditingController jusoController2,
      bool juso1visible,
      bool juso2visible
  ) {
    bool isButtonDisabled =  ref.watch(onboardingViewModelProvider.notifier).checkPlusChipState(homecontroller, jusoController1, jusoController2, juso1visible, juso2visible);
    return SecondaryFilledButton(
      onPressed: () {
        if(!isButtonDisabled) {
          null;
        } else {
          if(!juso1visible && !juso2Visible) {
            setState(() {
              juso1Visible = true;
            });
          } else if(juso1visible && !juso2Visible){
            setState(() {
              juso2Visible = true;
            });
          }
        }
      },
      radius: 99,
      horizontalPadding: 16,
      verticalPadding: 8,
      backgroundColor: DaepiroColorStyle.g_50,
      disableColor: DaepiroColorStyle.g_50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
              'assets/icons/location.svg',
              colorFilter: ColorFilter.mode(isButtonDisabled ? DaepiroColorStyle.g_600 : DaepiroColorStyle.g_100, BlendMode.srcIn)
          ),
          Text(
            '지역추가',
            style: DaepiroTextStyle.body_2_b.copyWith(color: isButtonDisabled ? DaepiroColorStyle.g_600 : DaepiroColorStyle.g_100),
          ),
        ],
      ),
    );
  }

  //삭제시 안내 다이얼로그
  void deleteDialog(
      BuildContext context,
      WidgetRef ref,
      String locationNickName,
      TextEditingController controller,
      int index,
      double width
  ) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            titlePadding: EdgeInsets.only(top: 24),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SecondaryFilledButton(
                  radius: 99,
                  horizontalPadding: 16,
                  verticalPadding: 8,
                  backgroundColor: DaepiroColorStyle.g_600,
                  disableColor: DaepiroColorStyle.g_600,
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          'assets/icons/location.svg',
                          colorFilter: ColorFilter.mode(DaepiroColorStyle.white, BlendMode.srcIn)
                      ),
                      Text(
                        locationNickName,
                        style: DaepiroTextStyle.body_2_b.copyWith(color: DaepiroColorStyle.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 8, 20, 24),
            content: Container(
              width: width,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      '지역을 삭제하시겠습니까?',
                      style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
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
                        },
                        radius: 8,
                        backgroundColor: DaepiroColorStyle.g_50,
                        pressedColor:  DaepiroColorStyle.g_75,
                        child: Text(
                          textAlign: TextAlign.center,
                          '취소',
                          style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_700),
                        )
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: SecondaryFilledButton(
                        verticalPadding: 12,
                        onPressed: () async {
                          await ref.read(onboardingViewModelProvider.notifier).deleteJuso(controller, index);
                          controller.clear();
                          GoRouter.of(context).pop();
                        },
                        radius: 8,
                        backgroundColor: DaepiroColorStyle.g_700,
                        pressedColor:  DaepiroColorStyle.g_400,
                        child: Text(
                          textAlign: TextAlign.center,
                          '삭제',
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

  Widget bottomWidget(BuildContext context, int isLength) {
    return Container(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                child: PrimaryFilledButton(
                    onPressed: GoRouter.of(context).pop,
                    backgroundColor: isLength >=1 ? DaepiroColorStyle.g_50 : DaepiroColorStyle.g_50,
                    pressedColor: DaepiroColorStyle.g_75,
                    borderRadius: 8.0,
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