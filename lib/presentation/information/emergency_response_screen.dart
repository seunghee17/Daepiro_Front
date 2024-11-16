import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/DaepiroTheme.dart';

class EmergencyResponseScreen extends StatefulWidget {
  const EmergencyResponseScreen({super.key});

  @override
  State<EmergencyResponseScreen> createState() => _EmergencyResponseScreen();
}

class _EmergencyResponseScreen extends State<EmergencyResponseScreen> with SingleTickerProviderStateMixin {
  final PageController _responsePageController = PageController(initialPage: 0);
  late final TabController _tabController = TabController(
    length: 4,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 500),
  );

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/arrow_left.svg',
                          alignment: Alignment.centerLeft,
                          colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '응급대처',
                          style: DaepiroTextStyle.h6.copyWith(
                            color: DaepiroColorStyle.g_800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/icon_search.svg',
                        alignment: Alignment.centerRight,
                        colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                      ),
                    ],
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: DaepiroColorStyle.g_800,
                    labelStyle: DaepiroTextStyle.body_1_m,
                    unselectedLabelColor: DaepiroColorStyle.g_300,
                    unselectedLabelStyle: DaepiroTextStyle.body_1_m,
                    indicatorColor: DaepiroColorStyle.g_800,
                    indicatorWeight: 4,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(
                        child: Text("심폐소생술"),
                      ),
                      Tab(
                        child: Text("응급처치"),
                      ),
                      Tab(
                        child: Text("소화기"),
                      ),
                      Tab(
                        child: Text("하임리히"),
                      )
                    ],
                  ),
                ),
                ExpandablePageView(
                  controller: _responsePageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {

                  },
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 2,
                                  color: DaepiroColorStyle.g_50,
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Stack(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: DaepiroColorStyle.o_500,
                                          borderRadius: BorderRadius.circular(4)
                                      ),
                                      child: Text(
                                          'STEP 01',
                                          style: DaepiroTextStyle.body_2_m.copyWith(
                                            color: DaepiroColorStyle.white,
                                          )
                                      )
                                  )
                                ],
                              )
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                            decoration: BoxDecoration(
                                color: DaepiroColorStyle.g_50,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '반응의 확인',
                                    style: DaepiroTextStyle.body_1_b.copyWith(
                                      color: DaepiroColorStyle.g_700,
                                    )
                                ),
                                const SizedBox(width: 4),
                                Text(
                                    '양쪽 어깨를 두드리며, 환자의 의식과 반응 확인',
                                    style: DaepiroTextStyle.body_2_m.copyWith(
                                      color: DaepiroColorStyle.g_600,
                                    )
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Center(
                  child: SmoothPageIndicator(
                    controller: _responsePageController,
                    count: 1,
                    effect: ExpandingDotsEffect(
                        dotColor: DaepiroColorStyle.g_75,
                        activeDotColor: DaepiroColorStyle.g_300,
                        dotHeight: 6,
                        dotWidth: 6,
                        spacing: 6,
                        expansionFactor: 2.5
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: DaepiroColorStyle.g_50,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Center(
                            child: Text(
                                '이전',
                                style: DaepiroTextStyle.body_1_b.copyWith(
                                  color: DaepiroColorStyle.g_700,
                                )
                            ),
                          ),
                        )
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: DaepiroColorStyle.o_500,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Center(
                              child: Text(
                                  '다음',
                                  style: DaepiroTextStyle.body_1_b.copyWith(
                                    color: DaepiroColorStyle.white,
                                  )
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

