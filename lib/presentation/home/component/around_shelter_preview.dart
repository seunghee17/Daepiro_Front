import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../cmm/DaepiroTheme.dart';
import 'map_direction_item.dart';

class AroundShelterPreview extends StatelessWidget {
  final String name;
  final int distinct;
  final String address;
  final double startLatitude;
  final double startLongitude;
  final double endLatitude;
  final double endLongitude;

  const AroundShelterPreview({
    super.key,
    required this.name,
    required this.distinct,
    required this.address,
    required this.startLatitude,
    required this.startLongitude,
    required this.endLatitude,
    required this.endLongitude,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: const EdgeInsets.all(16),
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
          Row(
              children: [
                Text(
                  name,
                  style: DaepiroTextStyle.body_1_b.copyWith(
                    color: DaepiroColorStyle.g_900,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "${distinct}m",
                  style: DaepiroTextStyle.body_2_m.copyWith(
                    color: DaepiroColorStyle.o_500,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: address));
                  },
                  child: SvgPicture.asset(
                      'assets/icons/icon_copy.svg',
                      colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
                      width: 30,
                      height: 30
                  ),
                )
              ]
          ),
          Text(
            address,
            style: DaepiroTextStyle.body_2_m.copyWith(
              color: DaepiroColorStyle.g_500,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
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
                          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 24),
                                child: Text(
                                  "대피소 길찾기 바로가기",
                                  style: DaepiroTextStyle.body_1_b.copyWith(
                                    color: DaepiroColorStyle.g_900,
                                  ),
                                ),
                              ),
                              MapDirectionItem(
                                type: "naver",
                                startLatitude: startLatitude,
                                startLongitude: startLongitude,
                                endLatitude: endLatitude,
                                endLongitude: endLongitude,
                              ),
                              const SizedBox(height: 8),
                              MapDirectionItem(
                                type: "kakao",
                                startLatitude: startLatitude,
                                startLongitude: startLongitude,
                                endLatitude: endLatitude,
                                endLongitude: endLongitude,
                              ),
                              const SizedBox(height: 8),
                              MapDirectionItem(
                                type: "tmap",
                                startLatitude: startLatitude,
                                startLongitude: startLongitude,
                                endLatitude: endLatitude,
                                endLongitude: endLongitude,
                              ),
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
    );
  }

}
