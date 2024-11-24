import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../cmm/DaepiroTheme.dart';

class DisasterType extends StatefulWidget {
  final String iconPath;
  final String text;

  DisasterType({
    Key? key,
    required this.iconPath,
    required this.text,
  }): super(key: key);

  @override
  State<DisasterType> createState() => _DisasterTypeState();
}

class _DisasterTypeState extends State<DisasterType> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: DaepiroColorStyle.g_50,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(7),
            decoration: const BoxDecoration(
              color: DaepiroColorStyle.g_50,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/icons/icon_disaster_sample.svg', height: 36, width: 36),
          ),
          const SizedBox(height: 4),
          Text(
            widget.text,
            style: DaepiroTextStyle.body_2_m.copyWith(
                color: DaepiroColorStyle.g_500
            ),
          )
        ],
      ),
    );
  }
}
