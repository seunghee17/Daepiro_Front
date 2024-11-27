import 'package:daepiro/presentation/community/community_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../cmm/DaepiroTheme.dart';
//공지사항 페이지
class CommunityRuleScreen extends ConsumerWidget {
  const CommunityRuleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final communityViewModel = ref.watch(communityNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(context),
              Expanded(
                  child: SingleChildScrollView(
                    child: bodyWidget(),
                  )),
              bottomWidget(),
              SizedBox(height: 20)
            ],
          ),
        )
      )
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            GestureDetector(
              onTap: GoRouter.of(context).pop,
              child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)
              ),
            ),
            Expanded(
              child: Text(
                  '공지사항',
                  textAlign: TextAlign.center,
                  style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800)
              ),
            ),
            Opacity(
              opacity: 0.0,
              child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget bodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text('대피로 이용 수칙 제목',
        style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),),
        SizedBox(height: 8),
        Text('2024.09.09',
        style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_400),),
        SizedBox(height: 24),
        Text('내용내용내용',
        style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_800),),
        SizedBox(height: 24),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: DaepiroColorStyle.g_50,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text('공지사항 타이틀',
                style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_800),),
                SizedBox(height: 12),
                Text( '공지사항 내용\n공지사항 내용',
                  style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_800),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget bottomWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Text('CONTACT: daepiro82@gmail.com',
          style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_400),
        ),
      ),
    );
  }

}