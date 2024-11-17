import 'package:daepiro/presentation/home/component/action_tip_item.dart';
import 'package:daepiro/presentation/information/component/action_tip_bottom_sheet.dart';
import 'package:daepiro/presentation/information/component/disaster_type.dart';
import 'package:daepiro/presentation/widgets/chip/secondary_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/DaepiroTheme.dart';

class ActionTipScreen extends StatefulWidget {
  const ActionTipScreen({super.key});

  @override
  State<ActionTipScreen> createState() => _ActionTipScreenState();
}

class _ActionTipScreenState extends State<ActionTipScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 2,
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
                          'assets/icons/icon_arrow_left.svg',
                          alignment: Alignment.centerLeft,
                          colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '행동요령',
                          style: DaepiroTextStyle.h6.copyWith(
                            color: DaepiroColorStyle.g_800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push('/information/searchDisaster');
                        },
                        child: SvgPicture.asset(
                          'assets/icons/icon_search.svg',
                          alignment: Alignment.centerRight,
                          colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                        ),
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
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        child: Text("위급/긴급 재난"),
                      ),
                      Tab(
                        child: Text("일반재난"),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(20,20,20,0),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: DaepiroColorStyle.g_50,
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '수신권장',
                                            style: DaepiroTextStyle.caption.copyWith(
                                              color: DaepiroColorStyle.o_500,
                                            )
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                            '국가적 위기상황이나 당장 대피가 필요할만큼\n생명에 위협이 되는 재난입니다.',
                                            style: DaepiroTextStyle.caption.copyWith(
                                              color: DaepiroColorStyle.g_800,
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(20,20,20,0),
                                child: GridView.builder(
                                    itemCount: 16,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return ActionTipBottomSheet(
                                                  disasterType: '가뭄',
                                                );
                                              }
                                          );
                                        },
                                        child: DisasterType(
                                            iconPath: 'assets/icons/icon_disaster_sample.svg',
                                            text: "재난이름$index"
                                        ),
                                      );
                                    }
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(20,20,20,0),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: DaepiroColorStyle.g_50,
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '기상 특보와 같이 안전 주의를 요하는 재난입니다.',
                                            style: DaepiroTextStyle.caption.copyWith(
                                              color: DaepiroColorStyle.g_800,
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(20,20,20,0),
                                child: GridView.builder(
                                    itemCount: 8,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return ActionTipBottomSheet(
                                                  disasterType: '가뭄',
                                                );
                                              }
                                          );
                                        },
                                        child: DisasterType(
                                            iconPath: 'assets/icons/icon_disaster_sample.svg',
                                            text: "재난이름$index"
                                        ),
                                      );
                                    }
                                ),
                              ),
                            )
                          ],
                        )
                      ]
                    ),
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

