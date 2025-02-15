import 'package:daepiro/cmm/DaepiroTheme.dart';
import 'package:daepiro/cmm/button/secondary_light_button.dart';
import 'package:daepiro/presentation/mypage/controller/mypage_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MypageScreen extends ConsumerWidget {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final state = ref.watch(myPageProvider);
   final viewModel = ref.read(myPageProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  '마이페이지',
                  style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserWidget(context, state.realName, state.profileImgUrl, state.nickName),
                        SizedBox(height: 20),
                        Text(
                          '내 정보',
                          style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_800),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => GoRouter.of(context).push('/mypage_fix_alarminfo'),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    color: DaepiroColorStyle.g_50
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20),
                                      SvgPicture.asset('assets/icons/icon_alarm.svg',
                                          width: 24,
                                          height: 24,
                                          colorFilter:
                                          ColorFilter.mode(DaepiroColorStyle.o_400, BlendMode.srcIn)),
                                      SizedBox(height: 6),
                                      Text('알림 설정', style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900)),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  await viewModel.getMyArticles();
                                  GoRouter.of(context).push('/mypage_user_writing');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      color: DaepiroColorStyle.g_50
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20),
                                      SvgPicture.asset('assets/icons/icon_community.svg',
                                          width: 24,
                                          height: 24,
                                          colorFilter:
                                          ColorFilter.mode(DaepiroColorStyle.o_400, BlendMode.srcIn)),
                                      SizedBox(height: 6),
                                      Text('내가 쓴글', style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900)),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text('고객 센터', style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_900)),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () => GoRouter.of(context).push('/mypage_fix_userinfo'),
                            child: mypageListItem('공지사항')
                        ),
                        GestureDetector(
                            onTap: () => GoRouter.of(context).push('/mypage_inquires'),
                            child: mypageListItem('문의하기')
                        ),
                        GestureDetector(
                            onTap: () => GoRouter.of(context).push('/mypage_fix_userinfo'),
                            child: mypageListItem('개인정보 처리 약관')
                        ),
                        GestureDetector(
                            onTap: () => GoRouter.of(context).push('/mypage_fix_userinfo'),
                            child: mypageListItem('앱버전')
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: SecondaryLightButton(
                                    onPressed: (){},
                                    radius: 4,
                                    child: Text('회원탈퇴', style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_600)),
                                  padding: 10,
                                )
                            ),
                            SizedBox(width: 8),
                            Expanded(
                                child: SecondaryLightButton(
                                  onPressed: (){},
                                  radius: 4,
                                  child: Text('로그아웃', style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_600)),
                                  padding: 10,
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      )
    );
  }

  Widget UserWidget(BuildContext context, String realName, String profileImgUrl, String nickName) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle
            ),
            child: Image.network(
              profileImgUrl,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return CircularProgressIndicator();
              },
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Spacer(),
              Text(realName, style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_800)),
              SizedBox(width: 8),
              Text('@${nickName}', style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200)),
              Spacer(),
            ],
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () => GoRouter.of(context).push('/mypage_fix_userinfo'),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(99)),
                color: DaepiroColorStyle.g_50
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Text('프로필 수정', style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_600)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget mypageListItem(String title) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
              ),
              if(title != '앱버전')
                SvgPicture.asset('assets/icons/icon_arrow_right.svg',
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn)
                ),
              if(title == '앱버전')
                Text(
                  'v.1.0.0',
                  style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
                )
            ],
          ),
        ),
      ),
    );
  }


}