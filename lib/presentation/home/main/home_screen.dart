import 'package:daepiro/presentation/home/component/information_contents_preview.dart';
import 'package:daepiro/presentation/home/component/popular_post_preview.dart';
import 'package:daepiro/presentation/home/const.dart';
import 'package:daepiro/presentation/home/main/home_view_model.dart';
import 'package:daepiro/presentation/home/component/disaster_mesaage_history_preview.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/chip/secondary_chip.dart';
import 'home_state.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key});

  final PageController _popularPostPageController = PageController(initialPage: 0);
  final PageController _infoContentsPageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<HomeState>(homeStateNotifierProvider, (previous, next) {
      if (next.isLoading) {

      }

      if (next.isOccurred) {

      }
    });

    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
              body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: DaepiroColorStyle.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).go('/home/shelter');
                              },
                              child: SvgPicture.asset('assets/icons/icon_logo_small.svg'),
                            ),
                            Container(
                                padding: EdgeInsets.all(12),
                                child: SvgPicture.asset('assets/icons/icon_alarm.svg')
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 4, left: 20, right: 20, bottom: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        decoration: BoxDecoration(
                                          color: DaepiroColorStyle.o_50,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              child: Image.asset('assets/icons/image_character_home.png'),
                                              alignment: Alignment.bottomRight,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 26, left: 16, bottom: 16, right: 16),
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "삐용님, 오늘도\n안전한 하루 보내세요!",
                                                    style: DaepiroTextStyle.h6.copyWith(
                                                      color: DaepiroColorStyle.g_900,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    padding: const EdgeInsets.only(top: 41),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(8),
                                                                ),
                                                                child: Container(
                                                                  padding: EdgeInsets.all(8),
                                                                  child: Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                        'assets/icons/icon_location.svg',
                                                                        colorFilter: ColorFilter.mode(DaepiroColorStyle.o_500, BlendMode.srcIn),
                                                                        width: 16,
                                                                        height: 16,
                                                                      ),
                                                                      const SizedBox(width: 4),
                                                                      Text(
                                                                        "현위치",
                                                                        style: DaepiroTextStyle.caption.copyWith(
                                                                          color: DaepiroColorStyle.g_800,
                                                                        ),
                                                                      ),
                                                                      const Spacer(),
                                                                      Text(
                                                                        "강남구 역삼동",
                                                                        style: DaepiroTextStyle.caption.copyWith(
                                                                          color: DaepiroColorStyle.g_800,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                            )
                                                        ),
                                                        const SizedBox(width: 8),
                                                        Expanded(
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(8),
                                                                ),
                                                                child: Container(
                                                                  padding: EdgeInsets.all(8),
                                                                  child: Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                        'assets/icons/icon_weather.svg',
                                                                        colorFilter: ColorFilter.mode(DaepiroColorStyle.o_500, BlendMode.srcIn),
                                                                        width: 16,
                                                                        height: 16,
                                                                      ),
                                                                      const SizedBox(width: 4),
                                                                      Text(
                                                                        "오늘의 날씨",
                                                                        style: DaepiroTextStyle.caption.copyWith(
                                                                          color: DaepiroColorStyle.g_800,
                                                                        ),
                                                                      ),
                                                                      const Spacer(),
                                                                      Text(
                                                                        "맑음",
                                                                        style: DaepiroTextStyle.caption.copyWith(
                                                                          color: DaepiroColorStyle.g_800,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                            )
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 28),
                                      Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "최근 재난문자 히스토리",
                                              style: DaepiroTextStyle.h6.copyWith(
                                                color: DaepiroColorStyle.g_900,
                                              ),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                context.push('/home/disasterMessageHistory');
                                              },
                                              child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "더보기",
                                                      style: DaepiroTextStyle.body_2_m.copyWith(
                                                        color: DaepiroColorStyle.o_400,
                                                      ),
                                                    ),
                                                    SvgPicture.asset('assets/icons/icon_arrow_right.svg')
                                                  ]
                                              ),
                                            )
                                          ]
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                                        decoration: BoxDecoration(
                                            color: DaepiroColorStyle.white,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: DaepiroColorStyle.black.withOpacity(0.08),
                                                blurRadius: 10,
                                                offset: const Offset(0, 0),
                                              )
                                            ]
                                        ),
                                        child: Column(
                                          children: [
                                            DisasterHistoryPreview(
                                                icon: SvgPicture.asset('assets/icons/icon_natural_disaster.svg'),
                                                title: "서울시 성북구 쌍문동 호우 발생",
                                                date: "2024.8.11 14:24"
                                            ),
                                            SizedBox(height: 8),
                                            DisasterHistoryPreview(
                                                icon: SvgPicture.asset('assets/icons/icon_natural_disaster.svg'),
                                                title: "서울시 성북구 쌍문동 호우 발생2",
                                                date: "2024.8.11 14:24"
                                            ),
                                            SizedBox(height: 8),
                                            DisasterHistoryPreview(
                                                icon: SvgPicture.asset('assets/icons/icon_natural_disaster.svg'),
                                                title: "서울시 성북구 쌍문동 호우 발생3",
                                                date: "2024.8.11 14:24"
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 28),
                                      Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "동네생활 인기 게시글",
                                              style: DaepiroTextStyle.h6.copyWith(
                                                color: DaepiroColorStyle.g_900,
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "더보기",
                                                    style: DaepiroTextStyle.body_2_m.copyWith(
                                                      color: DaepiroColorStyle.o_400,
                                                    ),
                                                  ),
                                                  SvgPicture.asset('assets/icons/icon_arrow_right.svg')
                                                ]
                                            )
                                          ]
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                                        decoration: BoxDecoration(
                                            color: DaepiroColorStyle.white,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.08),
                                                blurRadius: 10,
                                                offset: const Offset(0, 0),
                                              )
                                            ]
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                for (int index=0; index<5; index++)
                                                  Row(
                                                    children: [
                                                      SecondaryChip(
                                                          // isSelected: _homeViewModel.selectedPopularPostCategory == index,
                                                          isSelected: false,
                                                          text: Const.popularPostCategoryList[index],
                                                          onPressed: () {
                                                            // _homeViewModel.selectPopularPostCategory(index);
                                                            _popularPostPageController.animateToPage(
                                                                index,
                                                                duration: const Duration(milliseconds: 1),
                                                                curve: Curves.easeIn
                                                            );
                                                          }
                                                      ),
                                                      const SizedBox(width: 8)
                                                    ],
                                                  )
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            ExpandablePageView(
                                              controller: _popularPostPageController,
                                              scrollDirection: Axis.horizontal,
                                              onPageChanged: (index) {
                                                // _homeViewModel.selectPopularPostCategory(index);
                                              },
                                              children: [
                                                for (int i=0;i<5;i++)
                                                  Column(
                                                    children: [
                                                      PopularPostPreview(
                                                          title: "새로운 카페 오픈했네요 $i",
                                                          contents: "사거리 CU 옆에 새로 생긴 카페 바나나푸딩 사거리 CU 옆에 새로 생긴 카페 바나나푸딩",
                                                          location: "서울시 강남구",
                                                          time: "5분전",
                                                          like: "3",
                                                          comment: "2"
                                                      ),
                                                      PopularPostPreview(
                                                          title: "새로운 카페 오픈했네요 $i",
                                                          contents: "사거리 CU 옆에 새로 생긴 카페 바나나푸딩 사거리 CU 옆에 새로 생긴 카페 바나나푸딩",
                                                          location: "서울시 강남구",
                                                          time: "5분전",
                                                          like: "3",
                                                          comment: "2"
                                                      ),
                                                      PopularPostPreview(
                                                          title: "새로운 카페 오픈했네요 $i",
                                                          contents: "사거리 CU 옆에 새로 생긴 카페 바나나푸딩 사거리 CU 옆에 새로 생긴 카페 바나나푸딩",
                                                          location: "서울시 강남구",
                                                          time: "5분전",
                                                          like: "3",
                                                          comment: "2"
                                                      ),
                                                    ],
                                                  )
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            Center(
                                              child: SmoothPageIndicator(
                                                controller: _popularPostPageController,
                                                count: Const.popularPostCategoryList.length,
                                                effect: ExpandingDotsEffect(
                                                    dotColor: DaepiroColorStyle.g_75,
                                                    activeDotColor: DaepiroColorStyle.g_300,
                                                    dotHeight: 6,
                                                    dotWidth: 6,
                                                    spacing: 6,
                                                    expansionFactor: 2.5
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 28),
                                      Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "정보 콘텐츠",
                                              style: DaepiroTextStyle.h6.copyWith(
                                                color: DaepiroColorStyle.g_900,
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "더보기",
                                                    style: DaepiroTextStyle.body_2_m.copyWith(
                                                      color: DaepiroColorStyle.o_400,
                                                    ),
                                                  ),
                                                  SvgPicture.asset('assets/icons/icon_arrow_right.svg')
                                                ]
                                            )
                                          ]
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                                          decoration: BoxDecoration(
                                              color: DaepiroColorStyle.white,
                                              borderRadius: BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.08),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 0),
                                                )
                                              ]
                                          ),
                                          child: Column(
                                            children: [
                                              ExpandablePageView(
                                                controller: _infoContentsPageController,
                                                scrollDirection: Axis.horizontal,
                                                onPageChanged: (index) {
                                                },
                                                children: [
                                                  for (int i=0;i<3;i++)
                                                    Column(
                                                      children: [
                                                        InformationContentsPreview(
                                                            imagePath: 'assets/icons/image_sample.jpg',
                                                            title: "북한, 새벽까지 오물풍선 190개 날렸다...",
                                                            from: "동아닷컴",
                                                            date: "2024.08.11"
                                                        ),
                                                        InformationContentsPreview(
                                                            imagePath: 'assets/icons/image_sample.jpg',
                                                            title: "북한, 새벽까지 오물풍선 190개 날렸다...",
                                                            from: "동아닷컴",
                                                            date: "2024.08.11"
                                                        ),
                                                      ],
                                                    )
                                                ],
                                              ),
                                              const SizedBox(height: 16),
                                              Center(
                                                child: SmoothPageIndicator(
                                                  controller: _infoContentsPageController,
                                                  count: 3,
                                                  effect: ExpandingDotsEffect(
                                                      dotColor: DaepiroColorStyle.g_75,
                                                      activeDotColor: DaepiroColorStyle.g_300,
                                                      dotHeight: 6,
                                                      dotWidth: 6,
                                                      spacing: 6,
                                                      expansionFactor: 2.5
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    ],
                  )
              )
          )
      ),
    );
  }
}
