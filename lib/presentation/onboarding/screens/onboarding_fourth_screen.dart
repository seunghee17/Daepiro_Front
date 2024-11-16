import 'package:daepiro/presentation/onboarding/controller/onboarding_view_model.dart';
import 'package:daepiro/presentation/widgets/button/primary_filled_button.dart';
import 'package:daepiro/presentation/widgets/button/secondary_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../widgets/DaepiroTheme.dart';

class OnboardingFourthScreen extends ConsumerStatefulWidget {

  @override
  OnboardingFourthState createState() => OnboardingFourthState();
}

class OnboardingFourthState extends ConsumerState<OnboardingFourthScreen> {
  Set<int> selected = Set();
  Set<int> selectedSub = Set();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: state.when(
            data: (state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerWidget(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Text(
                                  '위급/긴급 재난',
                                  style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_900),),
                                Spacer(),
                                PrimaryFilledButton(
                                    onPressed: null,
                                    backgroundColor: DaepiroColorStyle.o_50,
                                    pressedColor: DaepiroColorStyle.o_50,
                                    borderRadius: 4.0,
                                    child: primaryFilledButtonWidget(),
                                    verticalPadding: 0.0)
                              ],
                            ),
                            Text(
                              '국가적 위기상황이나 당장 대피가 필요할만큼\n생명에 위협이 되는 재난입니다.',
                              style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_300),
                            ),
                            SizedBox(height: 12),
                            Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                    6, (index) {
                                      bool isTapped = selected.contains(index);
                                      return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isTapped) {
                                                selected.remove(index); // 이미 선택된 아이템을 다시 탭하면 제거
                                              } else {
                                                selected.add(index); // 아직 선택되지 않은 아이템을 탭하면 추가
                                              }});
                                          },
                                          child: disasterItem(isTapped));
                                    })),
                            SizedBox(height: 24),
                            Text(
                              '일반 재난',
                              style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_900),),
                            SizedBox(height: 4),
                            Text(
                              '기상 특보와 같이 안전 주의를 요하는 재난입니다.',
                              style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_300),),
                            SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(
                                  15, (index) {
                                    bool isTapped = selectedSub.contains(index);
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(isTapped) {
                                            selectedSub.remove(index);
                                          } else {
                                            selectedSub.add(index);
                                          }});
                                        },
                                      child: disasterItem(isTapped),
                                    );
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    bottomWidget(context),
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

  Widget primaryFilledButtonWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: SvgPicture.asset(
                'assets/icons/icon_alarm.svg',
                colorFilter: ColorFilter.mode(DaepiroColorStyle.o_500, BlendMode.srcIn),
                width: 16,
                height: 16,
              ),
            ),
            Text(
              '수신권장',
              style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.o_500),
            )
          ],
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Column(
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
    );
  }

  Widget disasterItem(bool isTapped) {
    return Container(
      width: (MediaQuery.of(context).size.width / 3) - 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          SvgPicture.asset(
            'assets/icons/icon_alarm.svg',
            colorFilter: ColorFilter.mode(DaepiroColorStyle.o_500, BlendMode.srcIn),
            width: 50,
            height: 50,
          ),
          Text(
            '재난 유형',
            style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_500),
          ),
          SizedBox(height: 8),
        ],
      ),
      decoration: BoxDecoration(
          color: isTapped ? DaepiroColorStyle.g_75 : DaepiroColorStyle.white,
          border: Border.all(color: isTapped ? DaepiroColorStyle.g_100 : DaepiroColorStyle.g_50, width: 1),
          borderRadius: BorderRadius.circular(8)
      ),
    );
  }

  Widget bottomWidget(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
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
                        onPressed: () =>   GoRouter.of(context).push('/onboarding/fourth'),
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
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TextButton(
                  onPressed: (){
                    remindDialog(context);
                  },
                  child: Text(
                    '다음에 설정하기',
                    style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_300),
                  )
              ),
            ),
          ],
        )
    );
  }

  void remindDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            titlePadding: EdgeInsets.fromLTRB(20, 24, 20, 4),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '다음에 설정하시겠어요?',
                  style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_900),
                ),
              ],
            ),
            contentPadding:EdgeInsets.fromLTRB(20, 4, 20, 24) ,
            content: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      '전체 유형의 재난 문자가 수신되며\n해당 설정은 마이페이지에서 변경 가능합니다.',
                      style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_500),
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
                        onPressed: GoRouter.of(context).pop,
                        radius: 8,
                        backgroundColor: DaepiroColorStyle.g_50,
                        pressedColor:  DaepiroColorStyle.g_75,
                        child: Text(
                          textAlign: TextAlign.center,
                          '다시 선택',
                          style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_700),
                        )
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: SecondaryFilledButton(
                        verticalPadding: 12,
                        onPressed: () {
                          GoRouter.of(context).pop();
                          GoRouter.of(context).push('/onboarding/fourth');
                        },
                        radius: 8,
                        backgroundColor: DaepiroColorStyle.g_700,
                        pressedColor:  DaepiroColorStyle.g_400,
                        child: Text(
                          textAlign: TextAlign.center,
                          '확인',
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
}
