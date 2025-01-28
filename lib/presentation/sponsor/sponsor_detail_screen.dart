import 'package:daepiro/data/model/response/sponsor/sponsor_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../cmm/DaepiroTheme.dart';
import '../const/utils.dart';

class SponsorDetailScreen extends ConsumerStatefulWidget {
  final Sponsor extra;

  const SponsorDetailScreen({
    super.key,
    required this.extra
  });

  @override
  ConsumerState<SponsorDetailScreen> createState() => _SponsorDetailScreenState();
}

class _SponsorDetailScreenState extends ConsumerState<SponsorDetailScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            color: DaepiroColorStyle.white,
            child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 4, bottom: 4, left: 12),
                          child: SvgPicture.asset('assets/icons/icon_arrow_left.svg'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 14),
                        alignment: Alignment.center,
                        child: Text(
                          "후원정보",
                          style: DaepiroTextStyle.h6.copyWith(
                            color: DaepiroColorStyle.g_800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: DaepiroColorStyle.o_50
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          findDisasterIconByName(name: widget.extra.disasterType ?? ""),
                                          width: 16,
                                          height: 16,
                                          colorFilter: ColorFilter.mode(DaepiroColorStyle.o_500, BlendMode.srcIn),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          widget.extra.disasterType ?? "",
                                          style: DaepiroTextStyle.caption.copyWith(
                                            color: DaepiroColorStyle.o_500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: DaepiroColorStyle.o_50
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                    child: Text(
                                      calculateDaysDiff(widget.extra.deadline ?? ""),
                                      style: DaepiroTextStyle.body_2_m.copyWith(
                                        color: DaepiroColorStyle.g_600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                widget.extra.sponsorName ?? "",
                                style: DaepiroTextStyle.body_2_m.copyWith(
                                  color: DaepiroColorStyle.g_600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                widget.extra.title ?? "",
                                style: DaepiroTextStyle.h6.copyWith(
                                  color: DaepiroColorStyle.g_900,
                                ),
                              ),
                              if (widget.extra.deadline != null)
                                Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    Text(
                                      formatDateToDot(widget.extra.deadline ?? ""),
                                      style: DaepiroTextStyle.caption.copyWith(
                                        color: DaepiroColorStyle.g_400,
                                      ),
                                    )
                                  ],
                                ),
                              const SizedBox(height: 16),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  widget.extra.thumbnail ?? "",
                                  width: double.infinity,
                                  height: 187,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 12),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TabBar(
                                      controller: _tabController,
                                      labelColor: DaepiroColorStyle.g_800,
                                      labelStyle: DaepiroTextStyle.body_1_m,
                                      unselectedLabelColor: DaepiroColorStyle.g_300,
                                      unselectedLabelStyle: DaepiroTextStyle.body_1_m,
                                      indicatorColor: DaepiroColorStyle.g_800,
                                      indicatorWeight: 2,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      tabs: const [
                                        Tab(
                                          child: Text("내용소개"),
                                        ),
                                        Tab(
                                          child: Text("후원"),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height,
                                      child: TabBarView(
                                          controller: _tabController,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                    '서울의 15% 넘는 면적이 물에 잠겼습니다.',
                                                    style: DaepiroTextStyle.body_1_b.copyWith(
                                                      color: DaepiroColorStyle.g_900,
                                                    )
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                    '서울의 15% 넘는 면적이 물에 잠겼습니다.',
                                                    style: DaepiroTextStyle.body_1_b.copyWith(
                                                      color: DaepiroColorStyle.g_900,
                                                    )
                                                ),
                                              ],
                                            ),
                                          ]
                                      ),
                                    )
                                  ],
                                ),
                              )

                              // Container(
                              //   child: TabBarView(
                              //       controller: _tabController,
                              //       children: [
                              //         Column(
                              //           children: [
                              //             Container(
                              //               padding: const EdgeInsets.all(20),
                              //               child: Column(
                              //                 children: [
                              //                   Container(
                              //                     width: double.infinity,
                              //                     padding: const EdgeInsets.all(16),
                              //                     decoration: BoxDecoration(
                              //                         color: DaepiroColorStyle.g_50,
                              //                         borderRadius: BorderRadius.circular(8)
                              //                     ),
                              //                     child: Column(
                              //                       crossAxisAlignment: CrossAxisAlignment.start,
                              //                       children: [
                              //                         Text(
                              //                             '후원 정보 요약',
                              //                             style: DaepiroTextStyle.body_1_b.copyWith(
                              //                               color: DaepiroColorStyle.g_900,
                              //                             )
                              //                         ),
                              //                         const SizedBox(height: 10),
                              //                         Text(
                              //                             '- 추석 연휴 이후 남부 지역에 강한 비가 쏟아졌어요.',
                              //                             style: DaepiroTextStyle.body_2_m.copyWith(
                              //                               color: DaepiroColorStyle.g_800,
                              //                             )
                              //                         )
                              //                       ],
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             const SizedBox(height: 20),
                              //             Text(
                              //                 '서울의 15% 넘는 면적이 물에 잠겼습니다.',
                              //                 style: DaepiroTextStyle.body_1_b.copyWith(
                              //                   color: DaepiroColorStyle.g_900,
                              //                 )
                              //             ),
                              //             const SizedBox(height: 12),
                              //             // Text(
                              //             //     '추석 연휴가 끝나자마자, 남부 지역을 중심으로 매우 강하고 많은 비가 쏟아졌습니다. 21일 하루에만, 부산 대부분 지역과 경남 창원시에 400㎜ 안팎의 폭우가 내렸습니다. 1년 강수량의 25%가량이 단 하루 만에 내리면서, 집과 도로, 축사와 건물 등 서울 면적의 15% 이상이 침수됐습니다. 거센 비바람을 피해 많은 이웃들이 집을 버리고 대피소로 몸을 피했습니다. 전남, 부산, 그리고 경남 등지에서 1,841세대,  2,626명이 집을 떠나 잠 못 이루는 밤을 보내야 했습니다.',
                              //             //     style: DaepiroTextStyle.body_2_m.copyWith(
                              //             //       color: DaepiroColorStyle.g_800,
                              //             //     )
                              //             // )
                              //           ],
                              //         ),
                              //         Column(
                              //           children: [
                              //             Container(
                              //               padding: const EdgeInsets.fromLTRB(20,20,20,0),
                              //               child: Column(
                              //                 children: [
                              //                   Container(
                              //                     width: double.infinity,
                              //                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                              //                     decoration: BoxDecoration(
                              //                         color: DaepiroColorStyle.g_50,
                              //                         borderRadius: BorderRadius.circular(8)
                              //                     ),
                              //                     child: Column(
                              //                       crossAxisAlignment: CrossAxisAlignment.start,
                              //                       children: [
                              //                         Text(
                              //                             '기상 특보와 같이 안전 주의를 요하는 재난입니다.',
                              //                             style: DaepiroTextStyle.caption.copyWith(
                              //                               color: DaepiroColorStyle.g_800,
                              //                             )
                              //                         )
                              //                       ],
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //
                              //           ],
                              //         )
                              //       ]
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              if (await canLaunchUrl(Uri.parse(widget.extra.sponsorUrl ?? ""))) {
                                launchUrl(Uri.parse(widget.extra.sponsorUrl ?? ""));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: DaepiroColorStyle.o_500
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "후원하기",
                                style: DaepiroTextStyle.body_1_b.copyWith(
                                  color: DaepiroColorStyle.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            Share.share(widget.extra.sponsorUrl ?? "");
                          },
                          child: SvgPicture.asset(
                            'assets/icons/icon_share.svg',
                            width: 28,
                            height: 28,
                            colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_400, BlendMode.srcIn),
                          ),
                        )
                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}