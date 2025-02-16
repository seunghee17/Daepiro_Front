import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../const/const.dart';

class ItemEmergencyResponse extends StatelessWidget {
  final int tabIndex;
  final int pageIndex;

  const ItemEmergencyResponse({
    super.key,
    required this.tabIndex,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),  // 그림자의 색 (불투명도 조절)
                    offset: const Offset(0, 0),  // 그림자의 위치 (오른쪽, 아래로 4픽셀)
                    blurRadius: 8,  // 흐림 효과 (그림자가 퍼지는 정도)
                    spreadRadius: 1,  // 그림자의 크기 확장 정도
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                          color: DaepiroColorStyle.g_50,
                          borderRadius: BorderRadius.circular(14)
                      ),
                      child: Text(
                          Const.emergencyResponseList[tabIndex][pageIndex][0],
                          style: DaepiroTextStyle.body_2_m.copyWith(
                            color: DaepiroColorStyle.g_600,
                          )
                      )
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: DaepiroColorStyle.g_50,
                    ),
                    child: Image.asset(Const.emergencyResponseList[tabIndex][pageIndex][1])
                  ),
                  const SizedBox(height: 30),
                  if (Const.emergencyResponseList[tabIndex][pageIndex][2].isNotEmpty)
                    Column(
                      children: [
                        Text(
                          Const.emergencyResponseList[tabIndex][pageIndex][2],
                          style: DaepiroTextStyle.body_1_b.copyWith(
                            color: DaepiroColorStyle.g_700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  Text(
                    Const.emergencyResponseList[tabIndex][pageIndex][3],
                    style: DaepiroTextStyle.body_2_m.copyWith(
                      color: DaepiroColorStyle.g_600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                ],
              )
          ),
        ],
      ),
    );
  }
}
