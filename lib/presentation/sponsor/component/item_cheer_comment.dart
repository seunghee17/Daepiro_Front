import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../cmm/DaepiroTheme.dart';

class ItemCheerComment extends StatelessWidget {
  final String name;
  final String date;
  final String contents;

  const ItemCheerComment({
    super.key,
    required this.name,
    required this.date,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 0, left: 20, bottom: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: DaepiroColorStyle.white,
          boxShadow: [
            BoxShadow(
              color: DaepiroColorStyle.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 0),
            )
          ]
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/icons/icon_funding.svg',
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(DaepiroColorStyle.o_300, BlendMode.srcIn),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "$name · $date",
                        style: DaepiroTextStyle.caption.copyWith(
                          color: DaepiroColorStyle.g_900,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: SvgPicture.asset(
                        'assets/icons/icon_more2.svg',
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_300, BlendMode.srcIn),
                      ),
                    )
                  ],
                ),
                Text(
                  contents,
                  style: DaepiroTextStyle.body_2_m.copyWith(
                    color: DaepiroColorStyle.g_800,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
