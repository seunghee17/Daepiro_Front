import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../home/component/around_shelter_preview.dart';
import '../home/component/map_direction_item.dart';
import '../home/const.dart';
import '../widgets/DaepiroTheme.dart';
import '../widgets/chip/secondary_chip.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final PageController _aroundShelterPageController = PageController(
      initialPage: 0,
      viewportFraction: 1.0
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "재난 정보",
                        style: DaepiroTextStyle.h6.copyWith(
                          color: DaepiroColorStyle.g_800,
                        ),
                      )
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "재난 콘텐츠",
                                  style: DaepiroTextStyle.h6.copyWith(
                                    color: DaepiroColorStyle.g_900,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    context.push('/information/disasterContents');
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
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 2,
                                color: DaepiroColorStyle.g_50,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                                  decoration: BoxDecoration(
                                      color: DaepiroColorStyle.o_50,
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Text(
                                      "실시간 뉴스",
                                      style: DaepiroTextStyle.caption.copyWith(
                                        color: DaepiroColorStyle.o_500,
                                      )
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                    "특별재난지역 선포 당진 면천면, 지난달 집중호우에 12억원 피해",
                                    style: DaepiroTextStyle.h6.copyWith(
                                      color: DaepiroColorStyle.g_800,
                                    )
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  "2024-08-13 · 연합뉴스",
                                  style: DaepiroTextStyle.caption.copyWith(
                                    color: DaepiroColorStyle.g_400,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/icons/image_sample.jpg',
                                    )
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Column(
                            children: [
                              Container(
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "주변 대피소",
                                        style: DaepiroTextStyle.h6.copyWith(
                                          color: DaepiroColorStyle.g_900,
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          // context.push('/home/disasterMessageHistory');
                                        },
                                        child: GestureDetector(
                                          onTap: () {
                                            // context.push('/home/aroundShelter');
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
                                        ),
                                      )
                                    ]
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                child: Row(
                                  children: [
                                    for (int index=0;index<Const.disasterTypeList.length;index++)
                                      Row(
                                        children: [
                                          SecondaryChip(
                                              // isSelected: index == _selectedDisasterType,
                                              isSelected: false,
                                              text: Const.disasterTypeList[index],
                                              onPressed: () {
                                                setState(() {
                                                  // _selectedDisasterType = index;
                                                });
                                              }
                                          ),
                                          const SizedBox(width: 8)
                                        ],
                                      )
                                  ],
                                ),
                              ),
                              ExpandablePageView.builder(
                                  controller: _aroundShelterPageController,
                                  scrollDirection: Axis.horizontal,
                                  padEnds: false,
                                  itemCount: 5,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      padding: EdgeInsets.only(top: 16),
                                      child: AroundShelterPreview(
                                        name: "강남구 보건소 지하 1층",
                                        distinct: 250,
                                        address: "서울특별시 강남구 선릉로 668, 강남구 보건소(삼성동)",
                                        onClickDirection: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(12)
                                                  ),
                                                  backgroundColor: DaepiroColorStyle.white,
                                                  child: Container(
                                                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.symmetric(vertical: 24),
                                                          child: Text(
                                                            "대피소 길찾기 바로가기",
                                                            style: DaepiroTextStyle.body_1_b.copyWith(
                                                              color: DaepiroColorStyle.g_900,
                                                            ),
                                                          ),
                                                        ),
                                                        MapDirectionItem(
                                                            icon: Image.asset('assets/icons/icon_naver_map.png', height: 24, width: 24),
                                                            text: "네이버지도 바로가기"
                                                        ),
                                                        const SizedBox(height: 8),
                                                        MapDirectionItem(
                                                            icon: Image.asset('assets/icons/icon_kakao_map.png', height: 24, width: 24),
                                                            text: "카카오맵 바로가기"
                                                        ),
                                                        const SizedBox(height: 8),
                                                        MapDirectionItem(
                                                            icon: Image.asset('assets/icons/icon_t_map.png', height: 24, width: 24),
                                                            text: "티맵 바로가기"
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                          );
                                        },
                                      ),
                                    );
                                  }
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: DaepiroColorStyle.g_50,
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "응급대처",
                                            style: DaepiroTextStyle.body_1_b.copyWith(
                                              color: DaepiroColorStyle.g_800,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "응급상황 발생시\n대처방법을 알아두세요.",
                                            style: DaepiroTextStyle.caption.copyWith(
                                              color: DaepiroColorStyle.g_400,
                                            ),
                                          ),
                                          const SizedBox(width: 4),

                                        ]
                                    ),
                                  )
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: DaepiroColorStyle.g_50,
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "행동요령",
                                            style: DaepiroTextStyle.body_1_b.copyWith(
                                              color: DaepiroColorStyle.g_800,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "재난 별 대처 행동요령을\n미리 알아두세요.",
                                            style: DaepiroTextStyle.caption.copyWith(
                                              color: DaepiroColorStyle.g_400,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                        ]
                                    ),
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}