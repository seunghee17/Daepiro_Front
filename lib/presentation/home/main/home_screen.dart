import 'package:daepiro/presentation/home/component/information_contents_preview.dart';
import 'package:daepiro/presentation/home/component/popular_post_preview.dart';
import 'package:daepiro/presentation/const/const.dart';
import 'package:daepiro/presentation/home/main/home_view_model.dart';
import 'package:daepiro/presentation/home/component/disaster_mesaage_history_preview.dart';
import 'package:daepiro/presentation/sponsor/component/item_sponsor_preview.dart';
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
import '../../const/utils.dart';
import '../component/sponsor_preview.dart';
import 'home_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final PageController _popularPostPageController = PageController(initialPage: 0);
  final PageController _infoContentsPageController = PageController(initialPage: 0);
  final PageController _sponsorPageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9
  );

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeStateNotifierProvider);

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
                        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 12),
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
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/icons/icon_alarm.svg',
                                  colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn),
                                )
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
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
                                              alignment: Alignment.bottomRight,
                                              child: Image.asset('assets/icons/image_character_home.png'),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(top: 26, left: 16, bottom: 16, right: 16),
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
                                                                  padding: const EdgeInsets.fromLTRB(8, 12, 12, 12),
                                                                  child: Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                        'assets/icons/icon_location.svg',
                                                                        colorFilter: const ColorFilter.mode(DaepiroColorStyle.o_500, BlendMode.srcIn),
                                                                        width: 24,
                                                                        height: 24,
                                                                      ),
                                                                      const SizedBox(width: 4),
                                                                      Text(
                                                                        "현재 위치는",
                                                                        style: DaepiroTextStyle.body_2_m.copyWith(
                                                                          color: DaepiroColorStyle.g_800,
                                                                        ),
                                                                      ),
                                                                      const Spacer(),
                                                                      Text(
                                                                        viewModel.location,
                                                                        style: DaepiroTextStyle.body_2_m.copyWith(
                                                                          color: DaepiroColorStyle.g_800,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                            )
                                                        ),
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
                                                context.push('/home/disastersHistory');
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
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            width: 2,
                                            color: DaepiroColorStyle.g_50,
                                          ),
                                        ),
                                        child: viewModel.isLoadingDisasterHistory
                                            ? Container(
                                                padding: const EdgeInsets.symmetric(vertical: 12),
                                                child: const Center(child: CircularProgressIndicator())
                                              )
                                            : Expanded(
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    physics: const NeverScrollableScrollPhysics(),
                                                    itemCount: viewModel.disasterHistoryList.length,
                                                    itemBuilder: (context, index) {
                                                      return Column(
                                                        children: [
                                                          if (index != 0)
                                                            const SizedBox(height: 8),
                                                          DisasterHistoryPreview(
                                                              disasterType: viewModel.disasterHistoryList[index].disasterType ?? "",
                                                              title: viewModel.disasterHistoryList[index].title ?? "",
                                                              date: formatDateToDateTime(viewModel.disasterHistoryList[index].time ?? "")
                                                          ),
                                                        ],
                                                      );
                                                    }
                                                ),
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
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            width: 2,
                                            color: DaepiroColorStyle.g_50,
                                          ),
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
                                                          isSelected: viewModel.selectedPopularPostCategory == index,
                                                          text: Const.popularPostCategoryList[index],
                                                          onPressed: () {
                                                            ref.read(homeStateNotifierProvider.notifier).selectPopularPostCategory(index);
                                                            _popularPostPageController.animateToPage(
                                                                0,
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
                                            viewModel.isLoadingPopularPost != 5
                                                ? Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                                    child: const Center(child: CircularProgressIndicator())
                                                  )
                                                : Column(
                                                    children: [
                                                      if (viewModel.popularPostList.isNotEmpty)
                                                        Column(
                                                          children: [
                                                            ExpandablePageView(
                                                              controller: _popularPostPageController,
                                                              scrollDirection: Axis.horizontal,
                                                              onPageChanged: (index) {},
                                                              children: [
                                                                for (int i=0;i<viewModel.popularPostList.length;i+=3)
                                                                  Column(
                                                                    children: [
                                                                      for (int j=0;j<3;j++)
                                                                        if (i+j <viewModel.popularPostList.length)
                                                                          PopularPostPreview(
                                                                            title: viewModel.popularPostList[i+j].title ?? "",
                                                                            contents: viewModel.popularPostList[i+j].body ?? "",
                                                                            location: "${viewModel.popularPostList[i+j].address?.siDo} ${viewModel.popularPostList[i+j].address?.siGunGu}",
                                                                            time: viewModel.popularPostList[i+j].createdAt ?? "",
                                                                            like: (viewModel.popularPostList[i+j].likeCount ?? 0).toString(),
                                                                            comment: (viewModel.popularPostList[i+j].commentCount ?? 0).toString(),
                                                                          ),
                                                                    ],
                                                                  )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 12),
                                                            Center(
                                                              child: SmoothPageIndicator(
                                                                controller: _popularPostPageController,
                                                                count: viewModel.popularPostList.length%3 == 0 ? viewModel.popularPostList.length~/3 : viewModel.popularPostList.length~/3+1,
                                                                effect: const ExpandingDotsEffect(
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
                                                    ],
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
                                            GestureDetector(
                                              onTap: () {
                                                context.push('/disasterContents');
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
                                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              width: 2,
                                              color: DaepiroColorStyle.g_50,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              viewModel.isLoadingContents
                                                  ? Container(
                                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                                      child: const Center(child: CircularProgressIndicator())
                                                    )
                                                  : Column(
                                                    children: [
                                                      ExpandablePageView(
                                                          controller: _infoContentsPageController,
                                                          scrollDirection: Axis.horizontal,
                                                          onPageChanged: (index) {},
                                                          children: [
                                                            for (int i=0;i<viewModel.contentsList.length;i+=2)
                                                              Column(
                                                                children: [
                                                                  for (int j=0;j<2;j++)
                                                                    if (i+j <viewModel.contentsList.length)
                                                                      Column(
                                                                        children: [
                                                                          if (j == 1)
                                                                            const SizedBox(height: 12),
                                                                          InformationContentsPreview(
                                                                              imagePath: viewModel.contentsList[i+j].thumbnailUrl ?? "",
                                                                              title: viewModel.contentsList[i+j].title ?? "",
                                                                              from: viewModel.contentsList[i+j].source ?? "",
                                                                              date: viewModel.contentsList[i+j].publishedAt ?? "",
                                                                              bodyUrl: viewModel.contentsList[i+j].bodyUrl ?? ""
                                                                          ),
                                                                        ],
                                                                      ),
                                                                ],
                                                              )
                                                          ],
                                                        ),
                                                        const SizedBox(height: 16),
                                                        Center(
                                                          child: SmoothPageIndicator(
                                                            controller: _infoContentsPageController,
                                                            count: viewModel.contentsList.length%2 == 0 ? viewModel.contentsList.length~/2 : viewModel.contentsList.length~/2 + 1,
                                                            effect: const ExpandingDotsEffect(
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
                                            ],
                                          )
                                      ),
                                      const SizedBox(height: 28),
                                      Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "추천 후원",
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
                                      if (!viewModel.isLoadingSponsor)
                                        ExpandablePageView.builder(
                                            controller: _sponsorPageController,
                                            scrollDirection: Axis.horizontal,
                                            padEnds: false,
                                            itemCount: viewModel.sponsorList.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return Container(
                                                padding: const EdgeInsets.only(top: 12),
                                                margin: const EdgeInsets.only(right: 8),
                                                child: SponsorPreview(
                                                  disasterType: viewModel.sponsorList[index].disasterType ?? "",
                                                  date: calculateDaysDiff(viewModel.sponsorList[index].deadline ?? ""),
                                                  from: viewModel.sponsorList[index].sponsorName ?? "",
                                                  title: viewModel.sponsorList[index].title ?? "",
                                                  imagePath: viewModel.sponsorList[index].thumbnail ?? "",
                                                ),
                                              );
                                            }
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
