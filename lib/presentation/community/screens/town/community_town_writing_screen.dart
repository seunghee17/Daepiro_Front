import 'package:daepiro/presentation/community/controller/community_town_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../cmm/DaepiroTheme.dart';

class CommunityTownWritingScreen extends ConsumerStatefulWidget {
  const CommunityTownWritingScreen({super.key});

  @override
  CommunityTownWritingState createState() => CommunityTownWritingState();
}

//동네생활 글쓰기 화면
class CommunityTownWritingState
    extends ConsumerState<CommunityTownWritingScreen> {
  bool isTouched = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(communityTownProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(context),
              SizedBox(height: 12),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () =>
                            showCategoryBottomSheet(context, isTouched),
                        child: writingTypeWidget(state.townCategory)),
                  ],
                ),
              )),
              //TODO 현위치 표시하겠는가 박스
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => GoRouter.of(context).pop,
              child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_900, BlendMode.srcIn)),
            ),
            Expanded(
              child: Text(
                '글쓰기',
                textAlign: TextAlign.center,
                style: DaepiroTextStyle.h6
                    .copyWith(color: DaepiroColorStyle.g_800),
              ),
            ),
            GestureDetector(
                onTap: () {}, //TODO 활성화 조건에 따른 완료 처리
                child: Text(
                  '완료', //TODO 색상 수정해야함
                  style: DaepiroTextStyle.body_1_m
                      .copyWith(color: DaepiroColorStyle.g_100),
                )),
          ],
        ),
      ),
    );
  }

  Widget writingTypeWidget(String writingType) {
    //일상, 교통 등등이 매개변수
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DaepiroColorStyle.g_50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            writingType == '전체'
                ? Text(
                    '게시글 주제를 선택해주세요.',
                    style: DaepiroTextStyle.body_1_m
                        .copyWith(color: DaepiroColorStyle.g_300),
                  )
                : Text(
                    writingType,
                    style: DaepiroTextStyle.body_1_m
                        .copyWith(color: DaepiroColorStyle.g_900),
                  ),
            Spacer(),
            SvgPicture.asset('assets/icons/icon_arrow_down.svg',
                colorFilter:
                    ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
          ],
        ),
      ),
    );
  }

  //카테고리 선택 바텀시트
  void showCategoryBottomSheet(BuildContext context, bool isTouched) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                child: Column(
                  children: [categoryItemWidget(isTouched)],
                ),
              ),
            ],
          );
        },
        isScrollControlled: true);
  }

  //바텀시트 내부 위젯
  Widget categoryItemWidget(bool isTouched) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
      child: Column(
        children: [
          bottomSheetheaderWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      ref
                          .read(communityTownProvider.notifier)
                          .setCategoryState('일상');
                      GoRouter.of(context).pop();
                    },
                    child: categoryListItem('일상', isTouched)),
                GestureDetector(
                    onTap: () {
                      ref
                          .read(communityTownProvider.notifier)
                          .setCategoryState('교통');
                      GoRouter.of(context).pop();
                    },
                    child: categoryListItem('교통', isTouched)),
                GestureDetector(
                    onTap: () {
                      ref
                          .read(communityTownProvider.notifier)
                          .setCategoryState('치안');
                      GoRouter.of(context).pop();
                    },
                    child: categoryListItem('치안', isTouched)),
                GestureDetector(
                    onTap: () {
                      ref
                          .read(communityTownProvider.notifier)
                          .setCategoryState('기타');
                      GoRouter.of(context).pop();
                    },
                    child: categoryListItem('기타', isTouched)),
              ],
            ),
          )
        ],
      ),
    );
  }

  //바텀시트 내부 헤더
  Widget bottomSheetheaderWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 16),
                Opacity(
                  opacity: 0.0,
                  child: SvgPicture.asset(
                    'assets/icons/icon_close.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                Expanded(
                  child: Text(
                    '게시글 주제',
                    textAlign: TextAlign.center,
                    style: DaepiroTextStyle.body_1_b
                        .copyWith(color: DaepiroColorStyle.g_900),
                  ),
                ),
                SvgPicture.asset('assets/icons/icon_close.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        DaepiroColorStyle.g_900, BlendMode.srcIn)),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(color: DaepiroColorStyle.g_50),
              width: double.infinity,
              height: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget categoryListItem(String category, bool isTouched) {
    return Container(
      decoration: BoxDecoration(
        color: isTouched ? DaepiroColorStyle.g_50 : DaepiroColorStyle.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          category,
          style: DaepiroTextStyle.body_1_m
              .copyWith(color: DaepiroColorStyle.g_900),
        ),
      ),
    );
  }
}
