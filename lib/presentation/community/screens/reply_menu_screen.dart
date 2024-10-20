import 'dart:ui';

import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../community_view_model.dart';

class ReplyMenuScreen extends ConsumerWidget {
  final Widget child;
  const ReplyMenuScreen( {
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final communityViewModel = ref.watch(communityViewModelProvider);
    return Stack(
      children: [
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: child,
        ),
        Positioned(
            bottom: 20,
            child:selectMenu()
        )
      ],
    );
  }

  Widget selectMenu() {
    return Column(
      children: [
        GestureDetector(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(
              color: DaepiroColorStyle.g_50,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Text('수정하기',
              textAlign: TextAlign.center,
              style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_700),
            ),
          ),
        ),
        SizedBox(height: 7),
        GestureDetector(
          onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                  color: DaepiroColorStyle.g_50,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Text('삭제하기',
                textAlign: TextAlign.center,
                style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_700),
              ),
            )
        )
      ],
    );
  }

}