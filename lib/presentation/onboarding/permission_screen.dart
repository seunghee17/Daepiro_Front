import 'package:daepiro/presentation/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/DaepiroTheme.dart';

class PermissionScreen extends ConsumerWidget {
  List<String> permissionDescription = ['위치권한', '알림', '카메라', '사진'];
  List<String> permissionSubDescription = ['사용자 위치 확인', '재난 알림 수신', '커뮤니티', '커뮤니티'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(onboardingControllerProvider);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return controller.when(
        data: (state) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: DaepiroColorStyle.black,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: screenHeight*0.6,
                    decoration: BoxDecoration(
                      color: DaepiroColorStyle.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
                    ),
                    child: SingleChildScrollView (
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 24),
                            Text(
                              '대피로는 사용자의 위치를 받아서\n재난 알림을 전송해요.',
                              style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
                            ),
                            GestureDetector(
                              onTap: ref.read(onboardingControllerProvider.notifier).updateAllAgreeState,
                              child: allAgreeWidget(
                                  state.isAllPermissionGrant,
                                  ref.read(onboardingControllerProvider.notifier).updateAllAgreeState,
                                screenWidth
                              ),
                            ),
                            SizedBox(
                              width: screenWidth-40,
                              child: ListView.builder(
                                  itemCount: 4,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        ref.read(onboardingControllerProvider.notifier).updateEachPermissionState(index);
                                      },
                                      child: permissionWidget(
                                          index,
                                          state.isPermissionCheckboxState,
                                              () {
                                            ref.read(onboardingControllerProvider.notifier).updateEachPermissionState(index);
                                          },
                                        screenWidth
                                      ),
                                    );
                                  }
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                )
              ],
            )
          );
        },
        error: (error, state) => Center(child: Text('error: ${error}')),
        loading: () => const Center(child: CircularProgressIndicator())
    );
  }

  Widget allAgreeWidget(bool isAllPermissionGrant, VoidCallback onChange, double screenWidth) {
    return Container(
        width: screenWidth,
        decoration: BoxDecoration(
            color: DaepiroColorStyle.g_75,
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
                  value: isAllPermissionGrant,
                  onChanged: (value) {
                    onChange();
                  }),
              SizedBox(width: 8),
              Text(
                '권한 모두 동의',
                style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_800),
              )
            ],
          ),
        )
    );
  }

  //각 권한 허용 위젯
  Widget permissionWidget(int index, List<bool> isPermissionCheckboxState, VoidCallback onChange, double screenWidth) {
    return Container(
        width: screenWidth,
        decoration: BoxDecoration(
            color: DaepiroColorStyle.white,
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
                  value:isPermissionCheckboxState[index],
                  onChanged: (value) {
                    onChange();
                  }),
              SizedBox(width: 8,),
              Text(
                permissionDescription[index],
                style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_800),
              ),
              Spacer(),
              Text(
                permissionSubDescription[index],
                style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_300),
              ),
            ],
          ),
        )
    );
  }

}