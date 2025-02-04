import 'package:daepiro/cmm/button/secondary_light_button.dart';
import 'package:daepiro/presentation/mypage/controller/mypage_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../cmm/DaepiroTheme.dart';

class MyPageAlarmSettingScreen extends ConsumerWidget {
  const MyPageAlarmSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageProvider);
    final viewModel = ref.read(myPageProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerWidget(context, ref),
            alarmSettingListItem(
                '커뮤니티 알림',
                '재난 상황과 동네생활 커뮤니케이션에 대한 댓글, 좋아요 등의 정보를 전달하는 알림입니다.',
                state.communityAlarmState,
                () => viewModel.setNotificationType('community')
            ),
            Container(
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(
                color: DaepiroColorStyle.g_50
              ),
            ),
            alarmSettingListItem(
                '재난 알림',
                '재난 문자 및 정보를 전달하는 알림입니다.',
                state.communityAlarmState,
                    () => viewModel.setNotificationType('disaster')
            ),
            Expanded(
                child: SecondaryLightButton(
                    onPressed: () => GoRouter.of(context).push('/mypage_setting_address'),
                    radius: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Text(
                            '재난 알림 지역 설정',
                            style: DaepiroTextStyle.body_1_m.copyWith(color: Colors.black),
                          ),
                        ),
                        SvgPicture.asset('assets/icons/icon_arrow_right.svg',
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(DaepiroColorStyle.g_400, BlendMode.srcIn)
                        ),
                      ],
                    ),
                    padding: 16)),
            SizedBox(height: 8),
            Expanded(
              child: SecondaryLightButton(
                  onPressed: () => GoRouter.of(context).push('/mypage_setting_disaster_type'),
                  radius: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Text(
                          '재난 유형 설정',
                          style: DaepiroTextStyle.body_1_m.copyWith(color: Colors.black),
                        ),
                      ),
                      SvgPicture.asset('assets/icons/icon_arrow_right.svg',
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(DaepiroColorStyle.g_400, BlendMode.srcIn)
                      ),
                    ],
                  ),
                  padding: 16),
            )
          ],
        ),
      ),
    );
  }

  //헤더 위젯
  Widget headerWidget(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                width: 24,
                height: 24,
                colorFilter:
                ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
          ),
          Spacer(),
          Text('알림 설정',
              style:
              DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800)),
          Spacer(),
          SizedBox(width: 24)
        ],
      ),
    );
  }

  Widget alarmSettingListItem(String title, String content, bool value, Function onChanged) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: DaepiroTextStyle.body_2_m.copyWith(color: Colors.black)),
                SizedBox(height: 4),
                Text(content, style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_300)),
              ],
            ),
            Spacer(),
            CupertinoSwitch(
                value: value,
                onChanged: (bool value) {
                  onChanged;
                },
              activeColor: DaepiroColorStyle.o_500,
              thumbColor: Colors.white,
              trackColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}