import 'package:daepiro/presentation/onboarding/controller/onboarding_controller.dart';
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
                    allAgreeWidget(state.isAllAppPermissionGrant, ref),
                    SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(5, (index) {
                            return Column(
                              children: [
                                privateInfoWidget(index, state.isAppPermissionCheckboxState, ref),
                                if (index == 4) SizedBox(height: 40), // 마지막 아이템 하단에 여유 공간 추가
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: double.infinity,
                      child: PrimaryFilledButton(
                          onPressed: () {
                            state.isAllAppPermissionGrant ? GoRouter.of(context).push('/onboarding/final') : null;
                          },
                          backgroundColor: state.isAllAppPermissionGrant ? DaepiroColorStyle.o_500 : DaepiroColorStyle.o_100,
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
  
  Widget allAgreeWidget(bool isAllPermissionGrant, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: ref.read(onboardingControllerProvider.notifier).updateAllAgreeState,
        style: ElevatedButton.styleFrom(
            backgroundColor: DaepiroColorStyle.g_50,
            overlayColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(8),
            shadowColor: Colors.transparent,
            elevation: 0.0
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return DaepiroColorStyle.g_75;
            }
            return DaepiroColorStyle.g_50;
          }),
        ),
        child: Row(
          children: [
            Checkbox(
                visualDensity: VisualDensity.compact,
                side: BorderSide(color: Colors.transparent),
                activeColor: DaepiroColorStyle.g_500,
                checkColor: DaepiroColorStyle.white,
                fillColor: MaterialStateProperty.resolveWith((state) {
                  if(!state.contains(MaterialState.selected)) {
                    return DaepiroColorStyle.g_100;
                  }
                  return null;
                }),
                value: isAllPermissionGrant,
                onChanged: (value) {
                  ref.read(onboardingControllerProvider.notifier).updateAllAgreeState();
                }),
            SizedBox(width: 8,),
            Text(
              '(필수) 약관 모두 동의',
              style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_800),
            )
          ],
        ),
      ),
    );
  }

  Widget privateInfoWidget(int index, List<bool> isPermissionCheckboxState, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () => ref.read(onboardingControllerProvider.notifier).updateEachPermissionState(index),
        style: ElevatedButton.styleFrom(
          backgroundColor: DaepiroColorStyle.white,
            overlayColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(8),
            shadowColor: Colors.transparent,
            elevation: 0.0
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return DaepiroColorStyle.g_50;
            }
            return DaepiroColorStyle.white;
          }),
        ),
        child: Row(
          children: [
            Checkbox(
                visualDensity: VisualDensity.compact,
                side: BorderSide(color: Colors.transparent),
                activeColor: DaepiroColorStyle.g_500,
                checkColor: DaepiroColorStyle.white,
                fillColor: MaterialStateProperty.resolveWith((state) {
                  if(!state.contains(MaterialState.selected)) {
                    return DaepiroColorStyle.g_100;
                  }
                  return null;
                }),
                value:isPermissionCheckboxState[index],
                onChanged: (value) {
                 ref.read(onboardingControllerProvider.notifier).updateEachPermissionState(index);
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
      ),
    );
  }
}