import 'package:daepiro/presentation/mypage/controller/mypage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../cmm/DaepiroTheme.dart';
import '../../const/common_disaster_list.dart';
import '../../const/emergency_disaster_list.dart';

class MypageDisasterTypeSettingScreen extends ConsumerStatefulWidget {
  const MypageDisasterTypeSettingScreen({super.key});

  @override
  MypageDisasterTypeSettingState createState() => MypageDisasterTypeSettingState();
}

class MypageDisasterTypeSettingState extends ConsumerState<MypageDisasterTypeSettingScreen> {
  Set<int> selected = {};
  Set<int> selectedSub = {};

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myPageProvider);
    final viewModel = ref.read(myPageProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(context, ref),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            '위급/긴급 재난',
                            style: DaepiroTextStyle.body_1_b
                                .copyWith(color: DaepiroColorStyle.g_900),
                          ),
                          const Spacer(),
                          primaryFilledButtonWidget(),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '국가적 위기상황이나 당장 대피가 필요할만큼\n생명에 위협이 되는 재난입니다.',
                        style: DaepiroTextStyle.caption
                            .copyWith(color: DaepiroColorStyle.g_300),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(EmergencyDisasterList.length,
                                  (index) {
                                bool isTapped = selected.contains(index);
                                return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isTapped) {
                                          selected.remove(index);
                                          viewModel
                                              .removeDisasterType(EmergencyDisasterList[index]['name']!);
                                        } else {
                                          selected.add(index);
                                          viewModel.addDisasterType(EmergencyDisasterList[index]['name']!);
                                        }
                                      });
                                    },
                                    child: disasterItem(
                                        isTapped,
                                        EmergencyDisasterList[index]['name']!,
                                        EmergencyDisasterList[index]['icon']!));
                              })),
                      const SizedBox(height: 24),
                      Text(
                        '일반 재난',
                        style: DaepiroTextStyle.body_1_b
                            .copyWith(color: DaepiroColorStyle.g_900),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '기상 특보와 같이 안전 주의를 요하는 재난입니다.',
                        style: DaepiroTextStyle.caption
                            .copyWith(color: DaepiroColorStyle.g_300),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                        List.generate(CommonDisasterList.length, (index) {
                          bool isTapped = selectedSub.contains(index);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isTapped) {
                                  selectedSub.remove(index);
                                 viewModel.removeDisasterType(CommonDisasterList[index]['name']!);
                                } else {
                                  selectedSub.add(index);
                                  viewModel.addDisasterType(CommonDisasterList[index]['name']!);
                                }
                              });
                            },
                            child: disasterItem(
                                isTapped,
                                CommonDisasterList[index]['name']!,
                                CommonDisasterList[index]['icon']!),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                width: 24,
                height: 24,
                colorFilter:
                const ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
          ),
        ),
        const Spacer(),
        Text('프로필 수정',
            style:
            DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800)),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            final isSuccess = await ref.read(myPageProvider.notifier).setDisasterType();
            GoRouter.of(context).pop();
            showSnackbar(context, isSuccess);
          },
          child: Text('저장',
              style: DaepiroTextStyle.body_1_m
                  .copyWith(color: DaepiroColorStyle.o_500)),
        )
      ],
    );
  }

  Widget primaryFilledButtonWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: DaepiroColorStyle.o_50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/icon_alarm.svg',
                width: 16,
                height: 16,
                colorFilter:
                const ColorFilter.mode(DaepiroColorStyle.o_500, BlendMode.srcIn)),
            Text(
              '수신권장',
              style: DaepiroTextStyle.caption
                  .copyWith(color: DaepiroColorStyle.o_500),
            )
          ],
        ),
      ),
    );
  }

  Widget disasterItem(bool isTapped, String name, String icon) {
    return Container(
      width: (MediaQuery.of(context).size.width / 3) - 20,
      decoration: BoxDecoration(
          color: isTapped ? DaepiroColorStyle.g_75 : DaepiroColorStyle.white,
          border: Border.all(
              color:
              isTapped ? DaepiroColorStyle.g_100 : DaepiroColorStyle.g_50,
              width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: DaepiroColorStyle.g_50,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(icon,
                  width: 36,
                  height: 36,
                  colorFilter: const ColorFilter.mode(
                      DaepiroColorStyle.g_500, BlendMode.srcIn)),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            name,
            style: DaepiroTextStyle.body_2_m
                .copyWith(color: DaepiroColorStyle.g_500),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void showSnackbar(BuildContext context, bool isSuccess) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50.0,
        left: 20.0,
        right: 20.0,
        child: Material(
          elevation: 8.0,
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    isSuccess ? '재난 유형 설정이 저장되었어요.' : '다시 시도해주세요.',
                    style: DaepiroTextStyle.body_2_m
                        .copyWith(color: DaepiroColorStyle.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 5), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}