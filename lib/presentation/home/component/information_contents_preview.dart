import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InformationContentsPreview extends StatefulWidget {
  final String imagePath;
  final String title;
  final String from;
  final String date;

  const InformationContentsPreview({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.from,
    required this.date,
  }): super(key: key);

  @override
  State<InformationContentsPreview> createState() => _InformationContentsPreviewState();
}

class _InformationContentsPreviewState extends State<InformationContentsPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              widget.imagePath,
              width: 68,
              height: 68,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: DaepiroTextStyle.body_1_b.copyWith(
                    color: DaepiroColorStyle.g_900,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.from,
                      style: DaepiroTextStyle.caption.copyWith(
                        color: DaepiroColorStyle.g_700,
                      ),
                    ),
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
          )
        ]
      ),
    );
  }
}
