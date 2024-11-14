import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/button/primary_filled_button.dart';
import '../controller/permission_view_model.dart';

class PermissionScreen extends ConsumerWidget {
  final VoidCallback onPermissionCheck;
  PermissionScreen({Key? key, required this.onPermissionCheck}) : super(key: key);
  List<String> permissionDescription = ['위치권한', '알림', '카메라', '사진'];
  List<String> permissionSubDescription = ['사용자 위치 확인', '재난 알림 수신', '커뮤니티', '커뮤니티'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionController = ref.watch(permissionViewModelProvider);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return permissionController.when(
        data: (state) {
          return Container(
            width: double.infinity,
            height: screenHeight * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: DaepiroColorStyle.white,
            ),
            child: Column(
              children: [
                Expanded (
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '대피로는 사용자의 위치를 받아서\n재난 알림을 전송해요.',
                            style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
                          ),
                        ),
                        SizedBox(height: 16),
                        allAgreeWidget(state.isAllPermissionGrant, ref),
                        SizedBox(
                          child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    permissionWidget(index, state.isPermissionCheckboxState, ref),
                                    if(index==3) SizedBox(height: 44),
                                  ],
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomSheetFootter(screenWidth, ref, state.isPermissionCheckboxState, context)
              ],
            ),
          );
        },
        error: (error, state) => Center(child: Text('error: ${error}')),
        loading: () => const Center(child: CircularProgressIndicator())
    );

  }

  Widget allAgreeWidget(bool isAllPermissionGrant, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: ref.read(permissionViewModelProvider.notifier).updateAllAgreeState,
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
                  ref.read(permissionViewModelProvider.notifier).updateAllAgreeState();
                }),
            SizedBox(width: 8),
            Text(
              '권한 전체 동의',
              style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_800),
            )
          ],
        ),
      ),
    );
  }

  //권한별 동의 위젯
  Widget permissionWidget(int index, List<bool> isPermissionCheckboxState, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () => ref.read(permissionViewModelProvider.notifier).updateEachPermissionState(index),
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
                value: isPermissionCheckboxState[index],
                onChanged: (value) {
                  ref.read(permissionViewModelProvider.notifier).updateEachPermissionState(index);
                }),
            SizedBox(width: 8),
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
      ),
    );
  }

  //bottomsheet의 하단바
  Widget bottomSheetFootter(double screenWidth, WidgetRef ref, List<bool> isPermissionCheckboxState, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '권한을 허용하지 않아도 서비스를 사용할 수 있으나\n일부 서비스 이용이 제한될 수 있어요.',
            style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_300),
          ),
          SizedBox(height: 10),
          Container(
            width: screenWidth,
            child: PrimaryFilledButton(
              onPressed: () async {
                await ref.read(permissionViewModelProvider.notifier).permissionRequest();
                onPermissionCheck();
              },
                backgroundColor: DaepiroColorStyle.g_700,
                pressedColor: DaepiroColorStyle.g_600,
                borderRadius: 8,
                child: Text(
                  '다음',
                  style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.white),
                ),
                verticalPadding: 12
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

}