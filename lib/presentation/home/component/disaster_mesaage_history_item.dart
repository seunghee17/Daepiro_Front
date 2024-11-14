import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../cmm/DaepiroTheme.dart';

class DisasterMesaageHistoryItem extends StatefulWidget {
  final SvgPicture icon;
  final String title;
  final String contents;
  final String date;

  const DisasterMesaageHistoryItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.contents,
    required this.date,
  }): super(key: key);

  @override
  _DisasterMesaageHistoryItem createState() => _DisasterMesaageHistoryItem();
}

class _DisasterMesaageHistoryItem extends State<DisasterMesaageHistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: DaepiroColorStyle.o_50,
                shape: BoxShape.circle,
              ),
              child: widget.icon
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: DaepiroTextStyle.body_1_b.copyWith(
                    color: DaepiroColorStyle.g_900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.contents,
                  style: DaepiroTextStyle.body_2_m.copyWith(
                    color: DaepiroColorStyle.g_500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.date,
                  style: DaepiroTextStyle.caption.copyWith(
                    color: DaepiroColorStyle.g_200,
                  ),
                )
              ]
            ),
          )
        ]
      ),
    );
  }
}