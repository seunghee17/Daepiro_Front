import 'package:daepiro/presentation/const/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../cmm/DaepiroTheme.dart';

class DisasterContentsMainItem extends StatelessWidget {
  final String type;
  final String source;
  final String title;
  final String date;
  final String thumbnailUrl;
  final String bodyUrl;

  const DisasterContentsMainItem({
    Key? key,
    required this.type,
    required this.title,
    required this.source,
    required this.date,
    required this.thumbnailUrl,
    required this.bodyUrl
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            decoration: BoxDecoration(
                color: DaepiroColorStyle.o_50,
                borderRadius: BorderRadius.circular(4)
            ),
            child: Text(
                type,
                style: DaepiroTextStyle.caption.copyWith(
                  color: DaepiroColorStyle.o_500,
                )
            ),
          ),
          const SizedBox(height: 12),
          Text(
              title,
              style: DaepiroTextStyle.h6.copyWith(
                color: DaepiroColorStyle.g_800,
              )
          ),
          const SizedBox(height: 12),
          Text(
            "${formatDateToHyphen(date)} · $source",
            style: DaepiroTextStyle.caption.copyWith(
              color: DaepiroColorStyle.g_400,
            ),
          ),
          const SizedBox(height: 12),
          if (thumbnailUrl.isNotEmpty)
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  thumbnailUrl,
                  width: double.infinity,
                  fit: BoxFit.cover
                )
            )
        ],
      ),
    );
  }
}
