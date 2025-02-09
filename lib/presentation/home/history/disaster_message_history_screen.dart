import 'package:daepiro/presentation/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/chip/secondary_chip.dart';
import '../component/disaster_mesaage_history_item.dart';

class DisasterMessageHistoryScreen extends StatefulWidget {
  const DisasterMessageHistoryScreen({super.key});

  @override
  State<DisasterMessageHistoryScreen> createState() => _DisasterMessageHistoryScreen();
}

class _DisasterMessageHistoryScreen extends State<DisasterMessageHistoryScreen> {
  var _selectedLocationType = 0;

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
                        child: Container(
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.pop();
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
                                  "재난문자 내역",
                                  style: DaepiroTextStyle.h6.copyWith(
                                    color: DaepiroColorStyle.g_800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 4, 0, 20),
                        child: Row(
                          children: [
                            for (int index=0;index<Const.registeredLocationList.length;index++)
                              Row(
                                children: [
                                  SecondaryChip(
                                      isSelected: index == _selectedLocationType,
                                      text: Const.registeredLocationList[index],
                                      onPressed: () {
                                        setState(() {
                                          _selectedLocationType = index;
                                          context.push('/home/disasterMessageDetail');
                                        });
                                      }
                                  ),
                                  const SizedBox(width: 8)
                                ],
                              )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 8),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "09.08",
                                        style: DaepiroTextStyle.body_1_b.copyWith(
                                          color: DaepiroColorStyle.g_900,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: 4,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Column(
                                            children: [
                                              DisasterMesaageHistoryItem(
                                                  icon: SvgPicture.asset('assets/icons/icon_natural_disaster.svg'),
                                                  title: "서울시 상북구 쌍문동 호우 발생",
                                                  contents: "금일 10.23. 19:39경 소촌동 855 화재 발생, 인근주민은 안전유의 및 차량우회바랍니다. 960-8222",
                                                  date: "2024.8.11 14:24"
                                              ),
                                              const SizedBox(height: 8),
                                            ],
                                          );
                                        }
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                      )
                    ],
                  )
              )
          )
      ),
    );
  }
}
