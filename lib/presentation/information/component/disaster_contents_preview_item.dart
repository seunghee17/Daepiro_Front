import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../const/utils.dart';

class DisasterContentsItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final String from;
  final String date;
  final int eye;
  final int save;
  final String bodyUrl;

  const DisasterContentsItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.from,
    required this.date,
    required this.eye,
    required this.save,
    required this.bodyUrl
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/news/${Uri.encodeComponent(bodyUrl)}');
      },
      child: Container(
        height: 92,
        color: DaepiroColorStyle.white,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: DaepiroTextStyle.body_1_b.copyWith(
                        color: DaepiroColorStyle.g_900
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
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
                    ],
                  )
                ],
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
                    fit: BoxFit.cover))
            else
              ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                      'assets/icons/empty_image.png',
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover))
          ],
        ),
      ),
    );
  }
}
