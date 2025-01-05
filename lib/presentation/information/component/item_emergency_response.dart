import 'package:flutter/cupertino.dart';
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
                border: Border.all(
                  width: 2,
                  color: DaepiroColorStyle.g_50,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(Const.emergencyResponseList[tabIndex][pageIndex][1])
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                          decoration: BoxDecoration(
                              color: DaepiroColorStyle.o_500,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Text(
                              Const.emergencyResponseList[tabIndex][pageIndex][0],
                              style: DaepiroTextStyle.body_2_m.copyWith(
                                color: DaepiroColorStyle.white,
                              )
                          )
                      )
                  ),
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
                    Const.emergencyResponseList[tabIndex][pageIndex][2],
                    style: DaepiroTextStyle.body_1_b.copyWith(
                      color: DaepiroColorStyle.g_700,
                    )
                ),
                const SizedBox(width: 4),
                Text(
                    Const.emergencyResponseList[tabIndex][pageIndex][3],
                    style: DaepiroTextStyle.body_2_m.copyWith(
                      color: DaepiroColorStyle.g_600,
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
