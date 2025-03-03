import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../cmm/DaepiroTheme.dart';

class ActionTipItem extends StatefulWidget {
  final String text;
  final bool isSelected;

  const ActionTipItem({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  State<ActionTipItem> createState() => _ActionTipItemState();
}

class _ActionTipItemState extends State<ActionTipItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DaepiroColorStyle.white,
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isSelected
              ? SvgPicture.asset('assets/icons/icon_check_box_enabled.svg', colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_500, BlendMode.srcIn), width: 32, height: 32)
              : SvgPicture.asset('assets/icons/icon_check_box_disabled.svg', colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn), width: 32, height: 32),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              widget.text,
              style: DaepiroTextStyle.body_2_m.copyWith(
                color: widget.isSelected ? DaepiroColorStyle.g_200 : DaepiroColorStyle.g_800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
