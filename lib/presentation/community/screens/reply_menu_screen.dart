import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../cmm/DaepiroTheme.dart';
import '../community_view_model.dart';

//수정하기 & 삭제하기
class ReplyMenuScreen extends ConsumerWidget {
  final bool isUser;

  const ReplyMenuScreen({super.key, required this.isUser});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final communityViewModel = ref.watch(communityViewModelProvider);
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: isUser ? editMenu(context) : reportMenu(context)),
      ],
    );
  }

  Widget editMenu(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: DaepiroColorStyle.g_50,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  '수정하기',
                  textAlign: TextAlign.center,
                  style: DaepiroTextStyle.body_1_b
                      .copyWith(color: DaepiroColorStyle.g_700),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 7),
        GestureDetector(
            onTap: () {
              GoRouter.of(context).pop;
              showDialog(
                  useSafeArea: false,
                  context: context,
                  builder: (context) {
                    return ReplyMenuScreen(isUser: isUser);
                  });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: DaepiroColorStyle.g_50,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    '삭제하기',
                    textAlign: TextAlign.center,
                    style: DaepiroTextStyle.body_1_b
                        .copyWith(color: DaepiroColorStyle.g_700),
                  ),
                ),
              ),
            ))
      ],
    );
  }

  Widget reportMenu(BuildContext context) {
    return GestureDetector(
        onTap: () {
          GoRouter.of(context).pop;
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: DaepiroColorStyle.g_50,
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            '삭제하기',
            textAlign: TextAlign.center,
            style: DaepiroTextStyle.body_1_b
                .copyWith(color: DaepiroColorStyle.g_700),
          ),
        ));
  }
}
