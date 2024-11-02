import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/DaepiroTheme.dart';

class DisasterHistoryPreview extends StatefulWidget {
  final SvgPicture icon;
  final String title;
  final String date;

  const DisasterHistoryPreview({
    Key? key,
    required this.icon,
    required this.title,
    required this.date
  }): super(key: key);

  @override
  _DisasterHistoryPreview createState() => _DisasterHistoryPreview();
}

class _DisasterHistoryPreview extends State<DisasterHistoryPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: DaepiroColorStyle.o_50,
              shape: BoxShape.circle,
            ),
            child: widget.icon
          ),
          const SizedBox(width: 12),
          Column(
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
                widget.date,
                style: DaepiroTextStyle.caption.copyWith(
                  color: DaepiroColorStyle.g_200,
                ),
              )
            ]
          )
        ]
      ),
    );
  }
}