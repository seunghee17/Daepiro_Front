import 'package:daepiro/presentation/const/common_disaster_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../cmm/DaepiroTheme.dart';
import '../../const/emergency_disaster_list.dart';

class DisasterType extends StatelessWidget {
  final String type;
  final String name;
  // final String disasterId;

  const DisasterType({
    super.key,
    required this.type,
    required this.name,
    // required this.disasterId
  });

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(7),
            decoration: const BoxDecoration(
              color: DaepiroColorStyle.g_50,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(findIconByName(type, name), height: 36, width: 36),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: DaepiroTextStyle.body_2_m.copyWith(
                color: DaepiroColorStyle.g_500
            ),
          )
        ],
      ),
    );
  }
}

String findIconByName(
    String type,
    String name
  ) {
  final List<Map<String, String>> list = (type == "emergency") ? EmergencyDisasterList : CommonDisasterList;

  for (var item in list) {
    if (item["name"] == name) {
      return item["icon"] ?? "";
    }
  }
  return "";
}