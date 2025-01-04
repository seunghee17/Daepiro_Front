import 'package:daepiro/presentation/const/common_disaster_list.dart';
import 'package:daepiro/presentation/const/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../cmm/DaepiroTheme.dart';

class DisasterType extends StatelessWidget {
  final String name;

  const DisasterType({
    super.key,
    required this.name,
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
            padding: const EdgeInsets.all(7),
            decoration: const BoxDecoration(
              color: DaepiroColorStyle.g_50,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(findDisasterIconByName(name: name), height: 36, width: 36),
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
