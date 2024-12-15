import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../const/utils.dart';

class DisasterContentsItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final String from;
  final String date;
  final int eye;
  final int save;

  const DisasterContentsItem({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.from,
    required this.date,
    required this.eye,
    required this.save
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: DaepiroTextStyle.body_1_b.copyWith(
                      color: DaepiroColorStyle.g_900
                  ),
                ),
              ),
              const SizedBox(width: 10),
              if (imagePath.isNotEmpty)
                ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      imagePath,
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                    )
                )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                from,
                style: DaepiroTextStyle.caption.copyWith(
                    color: DaepiroColorStyle.g_800
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  formatDateToDot(date),
                  style: DaepiroTextStyle.caption.copyWith(
                      color: DaepiroColorStyle.g_300
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/icon_eye.svg',
                        colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn),
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        eye.toString(),
                        style: DaepiroTextStyle.caption.copyWith(
                          color: DaepiroColorStyle.g_200,
                        ),
                      )
                    ]
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/icon_save.svg',
                        colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn),
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        save.toString(),
                        style: DaepiroTextStyle.caption.copyWith(
                          color: DaepiroColorStyle.g_200,
                        ),
                      )
                    ]
                ),
              ),
            ],
          )
        ]
      ),
    );
  }
}
