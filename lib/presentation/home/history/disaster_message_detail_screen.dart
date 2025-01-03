import 'package:daepiro/presentation/const/const.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/chip/secondary_chip.dart';
import '../component/action_tip_item.dart';
import '../component/around_shelter_preview.dart';
import '../component/map_direction_item.dart';

class DisasterMessageDetailScreen extends StatefulWidget {
  const DisasterMessageDetailScreen({super.key});

  @override
  State<DisasterMessageDetailScreen> createState() => _DisasterMessageDetailScreenState();
}

class _DisasterMessageDetailScreenState extends State<DisasterMessageDetailScreen> {
  final PageController _aroundShelterPageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9
  );
  int _selectedActionTipType = 0;
  int _selectedDisasterType = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: SvgPicture.asset('assets/icons/icon_arrow_left.svg')
                        ),
                      )
                    ]
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(20, 4, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: DaepiroColorStyle.o_50,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset('assets/icons/icon_natural_disaster.svg')
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "서울시 성북구 쌍문동 호우 발생",
                                style: DaepiroTextStyle.h5.copyWith(
                                  color: DaepiroColorStyle.g_900,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "금일 10.23. 19:39경 소촌동 855 화재 발생, 인근주민은 안전유의 및 차량우회바랍니다. 960-8222금일 10.23. 19:39경 소촌동 855 화재 발생, 인근주민은 안전유의 및 차량우회바랍니다.",
                                style: DaepiroTextStyle.body_2_m.copyWith(
                                  color: DaepiroColorStyle.g_500,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "2024.8.11. 14:24",
                                style: DaepiroTextStyle.caption.copyWith(
                                  color: DaepiroColorStyle.g_300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 4,
                          color: DaepiroColorStyle.g_50,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "행동요령",
                                style: DaepiroTextStyle.h6.copyWith(
                                  color: DaepiroColorStyle.g_900,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                                decoration: BoxDecoration(
                                    color: DaepiroColorStyle.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: DaepiroColorStyle.black.withOpacity(0.12),
                                        blurRadius: 12,
                                        offset: const Offset(0, 0),
                                      )
                                    ]
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Row(
                                        children: [
                                          for (int index=0;index<Const.actionTipsList.length;index++)
                                            Row(
                                              children: [
                                                SecondaryChip(
                                                    isSelected: index == _selectedActionTipType,
                                                    text: Const.actionTipsList[index],
                                                    onPressed: () {
                                                      setState(() {
                                                        _selectedActionTipType = index;
                                                      });
                                                    }
                                                ),
                                                const SizedBox(width: 8)
                                              ],
                                            )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ActionTipItem(
                                        isSelected: true,
                                        text: "튼튼한 탁자 아래에 들어가 몸을 보호하셨"
                                    ),
                                    ActionTipItem(
                                        isSelected: false,
                                        text: "튼튼한 탁자 아래에 들어가 몸을 보호하셨나요튼튼한 탁자 아래에 들어가 몸을 보호하셨"
                                    ),
                                    ActionTipItem(
                                        isSelected: true,
                                        text: "튼튼한 탁자 아래에 들어가 몸을 보호하??"
                                    ),
                                    ActionTipItem(
                                        isSelected: true,
                                        text: "튼튼한 탁자 아래에 들어가 몸을 보호하??"
                                    ),
                                    ActionTipItem(
                                        isSelected: false,
                                        text: "튼튼한 탁자 아래에 들어가 몸을 보호하??"
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
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
                                          context.push('/home/aroundShelter');
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
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  for (int index=0;index<Const.disasterTypeList.length;index++)
                                    Row(
                                      children: [
                                        SecondaryChip(
                                            isSelected: index == _selectedDisasterType,
                                            text: Const.disasterTypeList[index],
                                            onPressed: () {
                                              setState(() {
                                                _selectedDisasterType = index;
                                              });
                                            }
                                        ),
                                        const SizedBox(width: 8)
                                      ],
                                    )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: ExpandablePageView.builder(
                                  controller: _aroundShelterPageController,
                                  scrollDirection: Axis.horizontal,
                                  padEnds: false,
                                  itemCount: 5,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      padding: const EdgeInsets.only(top: 16, bottom: 20),
                                      margin: const EdgeInsets.only(right: 8),
                                      child: AroundShelterPreview(
                                       name: "강남구 보건소 지하 1층",
                                       distinct: 250,
                                       address: "서울특별시 강남구 선릉로 668, 강남구 보건소(삼성동)",
                                       startLatitude: 0,
                                       startLongitude: 0,
                                       endLatitude: 0,
                                       endLongitude: 0
                                      )
                                    );
                                  }
                              ),
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
    );
  }
}
