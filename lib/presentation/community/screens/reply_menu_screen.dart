import 'dart:ui';
import 'package:daepiro/presentation/community/controller/community_disaster_view_model.dart';
import 'package:daepiro/presentation/community/controller/community_town_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/button/secondary_filled_button.dart';

//수정하기 & 삭제하기
class ReplyMenuScreen extends ConsumerWidget {
  final bool isUser;
  final int commentId;
  final VoidCallback onCancel;
  final VoidCallback setDeleteState;
  final VoidCallback setChildCommentState;
  final bool isChildCommentState;

  const ReplyMenuScreen({
    super.key,
    required this.isUser,
    required this.commentId,
    required this.onCancel,
    required this.setDeleteState,
    required this.setChildCommentState,
    required this.isChildCommentState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(communityDisasterProvider);
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: isUser
                ? editMenu(
                    context,
                    ref,
                    commentId,
                    onCancel,
                    setDeleteState,
                    setChildCommentState,
                    isChildCommentState,
                    state.isDisasterScreen)
                : reportMenu(context)),
      ],
    );
  }

  Widget editMenu(
    BuildContext context,
    WidgetRef ref,
    int commentId,
    VoidCallback onCancel,
    VoidCallback setDeleteState,
    VoidCallback setChildCommentState,
    bool isChildCommentState,
    bool isDisasterScreen,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (isDisasterScreen) {
              ref.read(communityDisasterProvider.notifier).setEditState(true);
              ref
                  .read(communityDisasterProvider.notifier)
                  .setReplyId(commentId);
            } else {
              ref.read(communityTownProvider.notifier).setEditState(true);
              ref.read(communityTownProvider.notifier).setReplyId(commentId);
            }
            GoRouter.of(context).pop();
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
              GoRouter.of(context).pop();
              isChildCommentState
                  ? deleteDialog(context, ref, commentId, onCancel,
                      setDeleteState, setChildCommentState)
                  : deleteDialog(
                      context, ref, commentId, onCancel, setDeleteState, null);
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
          GoRouter.of(context).go('/community_report_screen');
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: DaepiroColorStyle.g_50,
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            '신고하기',
            textAlign: TextAlign.center,
            style: DaepiroTextStyle.body_1_b
                .copyWith(color: DaepiroColorStyle.g_700),
          ),
        ));
  }

  void deleteDialog(
      BuildContext context,
      WidgetRef ref,
      int commentId,
      VoidCallback onCancel,
      VoidCallback setDeleteState,
      VoidCallback? setChildCommentState) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            titlePadding: EdgeInsets.fromLTRB(20, 24, 20, 24),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '댓글을 삭제하시겠습니까?',
                  style: DaepiroTextStyle.body_1_b
                      .copyWith(color: DaepiroColorStyle.g_900),
                )
              ],
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: SecondaryFilledButton(
                        verticalPadding: 12,
                        onPressed: () {
                          setChildCommentState;
                          Navigator.pop(context);
                        },
                        radius: 8,
                        backgroundColor: DaepiroColorStyle.g_50,
                        pressedColor: DaepiroColorStyle.g_75,
                        child: Text(
                          textAlign: TextAlign.center,
                          '그만두기',
                          style: DaepiroTextStyle.body_1_b
                              .copyWith(color: DaepiroColorStyle.g_700),
                        )),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: SecondaryFilledButton(
                        verticalPadding: 12,
                        onPressed: () async {
                          GoRouter.of(context).pop();
                          showDeleteSnackbar(
                            context,
                            onCancel,
                            setDeleteState,
                          );
                        },
                        radius: 8,
                        backgroundColor: DaepiroColorStyle.g_700,
                        pressedColor: DaepiroColorStyle.g_400,
                        child: Text(
                          textAlign: TextAlign.center,
                          '삭제하기',
                          style: DaepiroTextStyle.body_1_b
                              .copyWith(color: DaepiroColorStyle.white),
                        )),
                  )
                ],
              ),
            ],
          );
        });
  }

  void showDeleteSnackbar(BuildContext context, VoidCallback onCancel,
      VoidCallback setDeleteState) {
    setDeleteState();
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50.0,
        left: 20.0,
        right: 20.0,
        child: Material(
          elevation: 8.0,
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '댓글이 삭제되었습니다.',
                    style: DaepiroTextStyle.body_2_m
                        .copyWith(color: DaepiroColorStyle.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onCancel();
                    overlayEntry.remove();
                  },
                  child: Text(
                    '취소',
                    style: DaepiroTextStyle.body_2_m
                        .copyWith(color: DaepiroColorStyle.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 5), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}
