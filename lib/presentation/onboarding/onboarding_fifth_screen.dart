import 'package:daepiro/presentation/onboarding/onboarding_controller.dart';
import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:daepiro/presentation/widgets/button/primary_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingFifthScreen extends ConsumerStatefulWidget {
  @override
  OnboardingFifthState createState() => OnboardingFifthState();
}

class OnboardingFifthState extends ConsumerState<OnboardingFifthScreen> {
  bool _isAllChecked = false;
  late List<bool> isChecked;
  late List<bool> isHighlighted;

  @override
  void initState() {
    super.initState();
    isChecked = List<bool>.filled(5, false);
    isHighlighted = List<bool>.filled(5, false);
  }


  @override
  Widget build(BuildContext context) {
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
                    SizedBox(height: 48,),
                    Text(
                      '이제 거의 다 왔어요!',
                      style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.o_400),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      '대피로 서비스 이용을 위해\n이용약관에 동의해 주세요.',
                      style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.g_900),
                    ),
                    SizedBox(height: 36),
                    allAgreeWidget(),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                isHighlighted[index] = !isHighlighted[index];
                              });
                            },
                            child: privateInfoWidget(index),
                          );
                        }
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: double.infinity,
                      child: PrimaryFilledButton(
                          onPressed: () {
                            _isAllChecked ? GoRouter.of(context).push('/onboarding/final') : null;
                          },
                          backgroundColor: _isAllChecked ? DaepiroColorStyle.o_500 : DaepiroColorStyle.o_100,
                          pressedColor: DaepiroColorStyle.o_600,
                          borderRadius: 8,
                          child: Text('다음', style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.white)),
                          verticalPadding: 12
                      ),
                    ),
                    SizedBox(height: 28)
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
  
  Widget allAgreeWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DaepiroColorStyle.g_50,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [
            Checkbox(
              side: BorderSide(color: Colors.transparent),
              activeColor: DaepiroColorStyle.g_500,
              checkColor: DaepiroColorStyle.white,
                fillColor: MaterialStateProperty.resolveWith((state) {
                  if(!state.contains(MaterialState.selected)) {
                    return DaepiroColorStyle.g_100;
                  }
                  return null;
                }),
                value: _isAllChecked,
                onChanged: (value) {
                 setState(() {
                   _isAllChecked = value!;
                   isChecked.fillRange(0, 5, value);
                 });
                }),
            SizedBox(width: 8,),
            Text(
              '(필수) 약관 모두 동의',
              style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_800),
            )
          ],
        ),
      )
    );
  }

  Widget privateInfoWidget(int index) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: isHighlighted[index] ? DaepiroColorStyle.g_50 : DaepiroColorStyle.white,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            children: [
              Checkbox(
                  side: BorderSide(color: Colors.transparent),
                  activeColor: DaepiroColorStyle.g_500,
                  checkColor: DaepiroColorStyle.white,
                  fillColor: MaterialStateProperty.resolveWith((state) {
                    if(!state.contains(MaterialState.selected)) {
                      return DaepiroColorStyle.g_100;
                    }
                    return null;
                  }),
                  value:isChecked[index],
                  onChanged: (value) {
                    setState(() {
                      isChecked[index] = value!;
                    });
                  }),
              SizedBox(width: 8,),
              Text(
                '(필수) 약관 모두 동의',
                style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_800),
              ),
              Spacer(),
              SvgPicture.asset(
                'assets/icons/arrow_right.svg'
              )
            ],
          ),
        )
    );
  }
}