import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:daepiro/presentation/widgets/button/secondary_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../community_view_model.dart';

class CommunityDisasterScreen extends ConsumerWidget {
  const CommunityDisasterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final communityViewModel = ref.watch(communityViewModelProvider);
    return Expanded(
      child: communityViewModel.when(
          data: (state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    GestureDetector(
                        onTap: (){
                          GoRouter.of(context).push('/community/rule');
                        },
                        child: ruleContainer()
                    ),
                    SizedBox(height: 20),
                    twoButtonContainer(ref, state.receiveButton, state.AllButton)
                  ],
                ),
              )
            );
          },
          error: (error, stack) => Text('에러: ${error}'),
          loading: () => const CircularProgressIndicator())
    );
  }
  
  Widget ruleContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: DaepiroColorStyle.o_50
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13),
        child: Row(
          children: [
            SizedBox(width: 12),
            SvgPicture.asset('assets/icons/noti.svg',
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(DaepiroColorStyle.o_400, BlendMode.srcIn)
            ),
            SizedBox(width: 6),
            Text( '대피로 커뮤니티 이용수칙',
              style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_900)
            ),
            Spacer(),
            SvgPicture.asset('assets/icons/arrow_right.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)
            ),
            SizedBox(width: 12)
          ],
        ),
      ),
    );
  }

  Widget twoButtonContainer(WidgetRef ref, bool receiveButton, bool AllButton) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SecondaryFilledButton(
                onPressed: ref.read(communityViewModelProvider.notifier).clickReceiveButton,
                radius: 99,
                child: Text(
                  '수신',
                  style: DaepiroTextStyle.body_1_m.copyWith(color: receiveButton ? DaepiroColorStyle.white : DaepiroColorStyle.g_600),
                ),
                backgroundColor: receiveButton ? DaepiroColorStyle.g_600 : DaepiroColorStyle.g_50,
              horizontalPadding: 16,
              verticalPadding: 6,
            ),
            SizedBox(width: 8),
            SecondaryFilledButton(
              onPressed: ref.read(communityViewModelProvider.notifier).clickReceiveButton,
              radius: 99,
              child: Text(
                '전체',
                style: DaepiroTextStyle.body_1_m.copyWith(color: receiveButton ? DaepiroColorStyle.white : DaepiroColorStyle.g_600),
              ),
              backgroundColor: receiveButton ? DaepiroColorStyle.g_600 : DaepiroColorStyle.g_50,
              horizontalPadding: 16,
              verticalPadding: 6,
            )
          ],
        ),
      ),
    );
  }

  // Widget contentItem() {
  //
  // }

  //댓글 존재하지 않을때 ui
  Widget noneReplyContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: DaepiroColorStyle.g_50
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text( '아직 재난 상황에 대한 댓글이 없어요',
              style: DaepiroTextStyle.body_2_b.copyWith(color: DaepiroColorStyle.g_600)
            ),
            SizedBox(height: 2),
            Text( '재난 상황에 대한 정보를 이웃에게 공유해주세요',
                style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_600)
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: DaepiroColorStyle.g_500,
                borderRadius: BorderRadius.all(Radius.circular(99)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                child: Text('댓글 달기',
                  style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}