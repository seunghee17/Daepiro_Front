import 'package:daepiro/presentation/home/component/map_direction_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/chip/secondary_chip.dart';
import '../const.dart';

class AroundShelterScreen extends StatefulWidget {
  const AroundShelterScreen({super.key});

  @override
  State<AroundShelterScreen> createState() => _AroundShelterScreen();
}

class _AroundShelterScreen extends State<AroundShelterScreen> {
  int _selectedDisasterType = 0;

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
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(top: 4, bottom: 4, left: 12),
                          child: SvgPicture.asset(
                            'assets/icons/icon_arrow_left.svg',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 14),
                        alignment: Alignment.center,
                        child: Text(
                          "주변 대피소 목록",
                          style: DaepiroTextStyle.h6.copyWith(
                            color: DaepiroColorStyle.g_800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
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
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                      color: DaepiroColorStyle.g_50,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/icon_location_24.svg'),
                      const SizedBox(width: 4),
                      Text(
                        "서울시 성북구 쌍문동",
                        style: DaepiroTextStyle.body_1_m.copyWith(
                          color: DaepiroColorStyle.g_600,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    children: [
                                      Text(
                                        "강남구 보건소 지하 1층",
                                        style: DaepiroTextStyle.body_1_b.copyWith(
                                          color: DaepiroColorStyle.g_900,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "250m",
                                        style: DaepiroTextStyle.body_2_m.copyWith(
                                          color: DaepiroColorStyle.o_500,
                                        ),
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset('assets/icons/icon_copy.svg')
                                    ]
                                ),
                                Text(
                                  "서울특별시 강남구 선릉로 668, 강남구 보건소 (삼성동)서울특별시 강남구 선릉로 668, 강남구 보건소 (삼성동)",
                                  style: DaepiroTextStyle.body_2_m.copyWith(
                                    color: DaepiroColorStyle.g_500,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  width: double.infinity,
                                  child: MaterialButton(
                                    color: DaepiroColorStyle.g_50,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    elevation: 0,
                                    onPressed: () {
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
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 4),
                                      child: Text(
                                        '길찾기',
                                        style: DaepiroTextStyle.body_2_m.copyWith(
                                          color: DaepiroColorStyle.g_600,
                                        )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: DaepiroColorStyle.g_50,
                            height: 1,
                          )
                        ],
                      );
                    }
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
