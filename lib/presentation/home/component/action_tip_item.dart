import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../cmm/DaepiroTheme.dart';

class ActionTipItem extends StatefulWidget {
  final bool isSelected;
  final String text;

  const ActionTipItem({
    Key? key,
    required this.isSelected,
    required this.text,
  }): super(key: key);

  @override
  State<ActionTipItem> createState() => _ActionTipItemState();
}

class _ActionTipItemState extends State<ActionTipItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isSelected
              ? SvgPicture.asset('assets/icons/icon_check_box_on.svg')
              : SvgPicture.asset('assets/icons/icon_check_box_off.svg'),
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
