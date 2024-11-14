import 'package:daepiro/presentation/community/screens/reply_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/button/primary_filled_button.dart';
import '../../../cmm/button/secondary_filled_button.dart';
import '../community_view_model.dart';
//재난상황 화면
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
                    twoButtonContainer(ref, state.receiveButton, state.AllButton),
                    SizedBox(height: 20),
                    Expanded(
                      //TODO api나온후 변경해야함
                        child: ListView.builder(
                          itemCount: 5,
                            itemBuilder: (context, index) {
                              return contentItem('화재', '서울시 강남구 동작동', '어쩌고저쩌고', '서울시 강남구', '오후 02:30', 4, context);
                            }
                        )
                    )
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
            SvgPicture.asset('assets/icons/icon_noti.svg',
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(DaepiroColorStyle.o_400, BlendMode.srcIn)
            ),
            SizedBox(width: 6),
            Text( '대피로 커뮤니티 이용수칙',
              style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_900)
            ),
            Spacer(),
            SvgPicture.asset('assets/icons/icon_arrow_right.svg',
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

  Widget contentItem(String disasterType, String location, String content, String shortLocation, String timeText, int comments, BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              PrimaryFilledButton(
                  backgroundColor: DaepiroColorStyle.o_50,
                  pressedColor: DaepiroColorStyle.o_50,
                  borderRadius: 4,
                  child: Row(
                    children: [
                      Text(
                        '화재',
                        style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.o_500),
                      )
                    ],
                  ),
                  verticalPadding: 2
              ),
              Spacer(),
              //TODO: 행동요령 페이지 넘어가게 하기
              GestureDetector(
                onTap: (){},
                child: Row(
                  children: [
                    Text(
                      '행동요령',
                      style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_300),
                    ),
                    SvgPicture.asset(
                      'assets/icons/icon_arrow_right',
                      colorFilter: ColorFilter.mode(DaepiroColorStyle.g_300, BlendMode.srcIn),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          RichText(
            text: TextSpan(
                text: location,
                style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
                children: [
                  TextSpan(
                    text: disasterType,
                    style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.o_500),
                  ),
                  TextSpan(
                    text: '발생',
                    style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
                  ),
                ]
            ),
          ),
          Text(
            content,
            style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_600),
          ),
          SizedBox(height: 12),
          Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/location',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_400, BlendMode.srcIn),
                ),
                SizedBox(width: 4),
                Text(
                  '${shortLocation} ∙ ${timeText}',
                  style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_400),
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/community',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn),
                ),
                SizedBox(width: 2),
                Text(
                  '${comments}',
                  style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_200),
                )
              ],
          ),
          comments >0 ?
          replyContainer(context) : noneReplyContainer()
        ],
      ),
    );
  }

  Widget replyContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DaepiroColorStyle.g_50,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            replyWidget('사거리에 어쩌구', '5분전', 0),
            replyWidget('사거리에 어쩌구', '5분전', 3),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ReplyBottomSheet();
                    }
                );
              },
              child: Row(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    '더보기',
                    style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2)
          ],
        ),
      ),
    );
  }

  Widget replyWidget(String content, String timeText, int likeNum) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DaepiroColorStyle.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_900),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  content,
                  style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_300),
                ),
                Spacer(),
                Visibility(
                  visible: likeNum!=0,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/good',
                          colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn),
                        ),
                        SizedBox(width: 2),
                        Text(
                          '${likeNum}',
                          style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_500),
                        )
                      ],
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

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