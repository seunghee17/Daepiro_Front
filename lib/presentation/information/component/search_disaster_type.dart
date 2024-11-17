import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'action_tip_bottom_sheet.dart';

class SearchDisasterType extends StatelessWidget {
  final String text;
  final String iconPath;

  const SearchDisasterType({
    Key? key,
    required this.text,
    required this.iconPath,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return ActionTipBottomSheet(
                disasterType: '가뭄',
              );
            }
        );
      },
      child: Container(
        color: DaepiroColorStyle.white,
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(DaepiroColorStyle.o_400, BlendMode.srcIn),
              width: 36,
              height: 36
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: DaepiroTextStyle.body_1_m.copyWith(
                    color: DaepiroColorStyle.g_900
                ),
              ),
            ),
            SvgPicture.asset(
                'assets/icons/icon_arrow_right.svg',
                colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn),
                width: 20,
                height: 20
            ),
          ],
        ),
      ),
    );
  }
}
