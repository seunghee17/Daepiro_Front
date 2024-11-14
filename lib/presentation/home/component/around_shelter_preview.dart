import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../cmm/DaepiroTheme.dart';
import 'map_direction_item.dart';

class AroundShelterPreview extends StatefulWidget {
  final String name;
  final int distinct;
  final String address;
  final VoidCallback onClickDirection;

  const AroundShelterPreview({
    Key? key,
    required this.name,
    required this.distinct,
    required this.address,
    required this.onClickDirection
  }): super(key: key);

  @override
  State<AroundShelterPreview> createState() => _AroundShelterPreviewState();
}

class _AroundShelterPreviewState extends State<AroundShelterPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.name,
                style: DaepiroTextStyle.body_1_b.copyWith(
                  color: DaepiroColorStyle.g_900,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "${widget.distinct}m",
                style: DaepiroTextStyle.body_2_m.copyWith(
                  color: DaepiroColorStyle.o_500,
                ),
              ),
              const Spacer(),
              SvgPicture.asset('assets/icons/icon_copy.svg')
            ]
          ),
          Text(
            widget.address,
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
    );
  }
}
