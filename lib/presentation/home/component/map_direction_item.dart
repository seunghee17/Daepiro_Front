import 'package:flutter/cupertino.dart';

import '../../../cmm/DaepiroTheme.dart';

class MapDirectionItem extends StatelessWidget {
  final Image icon;
  final String text;

  const MapDirectionItem({
    Key? key,
    required this.icon,
    required this.text
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: DaepiroColorStyle.g_50,
          borderRadius: BorderRadius.circular(4)
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: icon
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: DaepiroTextStyle.body_2_m.copyWith(
                color: DaepiroColorStyle.g_600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
