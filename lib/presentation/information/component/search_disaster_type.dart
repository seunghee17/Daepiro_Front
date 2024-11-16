import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SearchDisasterType extends StatelessWidget {
  final String iconPath;
  final String text;

  const SearchDisasterType({
    Key? key,
    required this.iconPath,
    required this.text,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
