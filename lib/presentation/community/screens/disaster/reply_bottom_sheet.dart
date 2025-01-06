import 'package:daepiro/presentation/community/controller/community_disaster_view_model.dart';
import 'package:daepiro/presentation/community/screens/reply_menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../cmm/DaepiroTheme.dart';
import '../../../../data/model/response/disaster_reply_response.dart';

class ReplyBottomSheet extends ConsumerStatefulWidget {
  final int? situationId;

  ReplyBottomSheet({super.key, this.situationId});

  @override
  ReplyBottomSheetState createState() => ReplyBottomSheetState();
}

class ReplyBottomSheetState extends ConsumerState<ReplyBottomSheet> {
  final TextEditingController replyController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(communityDisasterProvider);

    if (state.deleteCommentId != 0 && !state.isChildCommentState) {
      Future.delayed(const Duration(seconds: 5), () async {
        if (state.deleteCommentId != 0 ) {
          await ref.read(communityDisasterProvider.notifier).deleteReply();
        }
      });
    }

    if (state.deleteChildCommentId != 0 && state.isChildCommentState) {
      Future.delayed(const Duration(seconds: 5), () async {
        if (state.deleteChildCommentId != 0 ) {
          await ref.read(communityDisasterProvider.notifier).deleteReply();
        }
      });
    }

    if (state.isEditState) {
      //일반 댓글 편집 상태임
      focusNode.requestFocus();
    } else if(state.editChildCommentId != 0) {
      focusNode.requestFocus();
    }

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
      child: Column(
        children: [
          headerWidget(),
          Expanded(
            child: state.disasterReplyList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      noReplyWidget(),
                    ],
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          if (state.isLoading)
                            Center(
                              child: CircularProgressIndicator(),
                            )
                          else
                            replyListWidget(
                              ref,
                              state.disasterReplyList,
                              widget.situationId ?? 0,
                              state.isEditState,
                              state.editCommentId,
                              state.deleteCommentId,
                              state.isChildCommentState,
                              state.isEditChildCommentState,
                              state.editChildCommentId,
                            )
                        ],
                      ),
                    ),
                  ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: state.isEditState
                  ? footerWidget(
                      replyController,
                      widget.situationId ?? 0,
                      state.isEditState,
                      state.editCommentId,
                      focusNode,
                      state.parentCommentId,
                      state.isChildCommentState,
                      state.isEditChildCommentState,
                    )
                  : footerWidget(
                      replyController,
                      widget.situationId ?? 0,
                      state.isEditState,
                      null,
                      focusNode,
                      state.parentCommentId,
                      state.isChildCommentState,
                      state.isEditChildCommentState,
                    )),
        ],
      ),
    );
  }

  Widget headerWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 16),
                Opacity(
                  opacity: 0.0,
                  child: SvgPicture.asset(
                    'assets/icons/icon_close.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                Expanded(
                  child: Text(
                    '댓글',
                    textAlign: TextAlign.center,
                    style: DaepiroTextStyle.body_1_b
                        .copyWith(color: DaepiroColorStyle.g_900),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    ref.read(communityDisasterProvider.notifier).setReplyId(0);
                    ref
                        .read(communityDisasterProvider.notifier)
                        .setEditState(false);
                    ref
                        .read(communityDisasterProvider.notifier)
                        .clearDisasterReplyData();
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/icons/icon_close.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                          DaepiroColorStyle.g_900, BlendMode.srcIn)),
                ),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(color: DaepiroColorStyle.g_50),
              width: double.infinity,
              height: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget replyListWidget(
    WidgetRef ref,
    List<Reply> list,
    int situationId,
    bool isEditState,
    int editCommentId,
    int deleteCommentId,
    bool isChildCommentState,
    bool isEditChildCommentState,
    int editChildCommentId,
  ) {
    return Container(
        width: double.infinity,
        child: Column(
          children: List.generate(list.length, (index) {
            return replyWidget(
              ref,
              context,
              list[index],
              situationId,
              isEditState,
              editCommentId,
              deleteCommentId,
              isChildCommentState,
              isEditChildCommentState,
              editChildCommentId,
            );
          }),
        ));
  }

  //댓글 위젯
  Widget replyWidget(
    WidgetRef ref,
    BuildContext context,
    Reply reply,
    int situationId,
    bool isEditState,
    int editCommentId,
    int deleteCommentId,
    bool isChildCommentState,
    bool isEditChildCommentState,
    int editChildCommentId,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: isEditState && editCommentId == reply.id
              ? DaepiroColorStyle.g_50
              : DaepiroColorStyle.white,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  reply.name ?? '탈퇴한 사용자',
                  style: DaepiroTextStyle.caption
                      .copyWith(color: DaepiroColorStyle.g_800),
                ),
                Visibility(
                    visible: reply.isVerified ?? false,
                    child: Row(
                      children: [
                        SizedBox(width: 2),
                        SvgPicture.asset('assets/icons/icon_certification.svg',
                            width: 16,
                            height: 16,
                            colorFilter: ColorFilter.mode(
                                DaepiroColorStyle.o_300, BlendMode.srcIn)),
                      ],
                    )),
                SizedBox(width: 6),
                Visibility(
                  visible: reply.isModified ?? false,
                    child: Text('수정됨 · ',
                      style: DaepiroTextStyle.caption
                          .copyWith(color: DaepiroColorStyle.g_300),
                    ),
                ),
                Text(
                  ref
                      .read(communityDisasterProvider.notifier)
                      .parseCommentTime(reply.time!),
                  style: DaepiroTextStyle.caption
                      .copyWith(color: DaepiroColorStyle.g_300),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    goToAdditional(context, reply.isMine!, reply.id!, ref, isChildCommentState);
                  },
                  child: SvgPicture.asset('assets/icons/icon_moreinfo.svg',
                      colorFilter: ColorFilter.mode(
                          DaepiroColorStyle.g_200, BlendMode.srcIn)),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              editCommentId == reply.id ? '수정중' : reply.content!,
              style: DaepiroTextStyle.body_2_m
                  .copyWith(color: DaepiroColorStyle.g_900),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                GestureDetector(
                    onTap: () async {
                      await ref
                          .read(communityDisasterProvider.notifier)
                          .replyLike(reply.id!);
                    },
                    child: likeButton(false, reply.likeCount!)),
                SizedBox(width: 8),
                GestureDetector(
                    onTap: () {
                      //답글 쓰기 클릭시 로직
                      //parentid 지정
                      ref.read(communityDisasterProvider.notifier).setChildCommentState(true);
                      ref
                          .read(communityDisasterProvider.notifier)
                          .setParentCommentId(reply.id!);
                      focusNode.requestFocus();
                    },
                    child: replyWriteButton())
              ],
            ),
            SizedBox(height: 8),
            if (reply.childComments != [])
              reReplyListWidget(
                  reply.childComments!,
                  context,
                  situationId,
                  isChildCommentState,
                  isEditChildCommentState,
                  editChildCommentId)
          ],
        ),
      ),
    );
  }

  Widget reReplyListWidget(
    List<ChildComments> list,
    BuildContext context,
    int situationId,
    bool isChildCommentState,
    bool isEditChildCommentState,
    int editChildCommentId,
  ) {
    return Container(
      width: double.infinity,
      child: Column(
        children: List.generate(list.length, (index) {
          return reReplyWidget(context, list[index], situationId,
              isChildCommentState, isEditChildCommentState, editChildCommentId);
        }),
      ),
    );
  }

  Widget reReplyWidget(
      BuildContext context,
      ChildComments childComments,
      int situationId,
      bool isChildCommentState,
      bool isEditChildCommentState,
      int editChildCommentId) {
    return Container(
      decoration: BoxDecoration(
        color: isEditChildCommentState && editChildCommentId == childComments.id
            ? DaepiroColorStyle.g_50
            : DaepiroColorStyle.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 4,
                  decoration: BoxDecoration(color: DaepiroColorStyle.g_75),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 20,
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              childComments.name ?? '탈퇴한 사용자',
                              style: DaepiroTextStyle.caption
                                  .copyWith(color: DaepiroColorStyle.g_800),
                            ),
                            Visibility(
                                visible: childComments.isVerified ?? false,
                                child: Row(
                                  children: [
                                    SizedBox(width: 2),
                                    SvgPicture.asset(
                                        'assets/icons/icon_certification.svg',
                                        width: 16,
                                        height: 16,
                                        colorFilter: ColorFilter.mode(
                                            DaepiroColorStyle.o_300,
                                            BlendMode.srcIn)),
                                  ],
                                )),
                            SizedBox(width: 6),
                            Text(
                              ref
                                  .read(communityDisasterProvider.notifier)
                                  .parseCommentTime(childComments.time!),
                              style: DaepiroTextStyle.caption
                                  .copyWith(color: DaepiroColorStyle.g_300),
                            ),
                            Flexible(child: Container()),
                            GestureDetector(
                                onTap: () {
                                  ref
                                      .read(communityDisasterProvider.notifier)
                                      .setChildCommentState(true);
                                  goToAdditional(
                                      context,
                                      childComments.isMine!,
                                      childComments.id!,
                                      ref,
                                      isChildCommentState);
                                },
                                child: SvgPicture.asset(
                                    'assets/icons/icon_moreinfo.svg',
                                    colorFilter: ColorFilter.mode(
                                        DaepiroColorStyle.g_200,
                                        BlendMode.srcIn))),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          editChildCommentId == childComments.id
                              ? '수정중'
                              : childComments.content!,
                          style: DaepiroTextStyle.body_2_m
                              .copyWith(color: DaepiroColorStyle.g_900),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  await ref
                                      .read(communityDisasterProvider.notifier)
                                      .replyLike(childComments.id!);
                                },
                                child: likeButton(
                                    false, childComments.likeCount ?? 0)),
                            Spacer()
                          ],
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget footerWidget(
      TextEditingController controller,
      int articleId,
      bool isEditState,
      int? id,
      FocusNode replyFocusNode,
      int parentCommentId,
      bool isChildCommentState,
      bool isEditChildCommentState) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: DaepiroColorStyle.g_50))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Row(
          children: [
            SizedBox(width: 20),
            //TODO 앨범 일단 제거
            // GestureDetector(
            //   onTap: () async {
            //     await ref.read(communityDisasterProvider.notifier).checkPermission();
            //     GoRouter.of(context).push('/album_choice');
            //   },
            //   child: SvgPicture.asset('assets/icons/icon_photo.svg',
            //       width: 28,
            //       height: 28,
            //       colorFilter: ColorFilter.mode(
            //           DaepiroColorStyle.g_400, BlendMode.srcIn)),
            // ),
            // SizedBox(width: 12),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: DaepiroColorStyle.g_50),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLength: 1000,
                      focusNode: replyFocusNode,
                      controller: controller,
                      cursorColor: DaepiroColorStyle.g_900,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      style: DaepiroTextStyle.body_2_m
                          .copyWith(color: DaepiroColorStyle.g_900),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        isDense: true,
                        hintText: '댓글을 작성해주세요.',
                        fillColor: DaepiroColorStyle.g_50,
                        hintStyle: DaepiroTextStyle.body_2_m
                            .copyWith(color: DaepiroColorStyle.g_200),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  TextButton(
                    onPressed: () async {
                      if (isEditState) {
                        //수정하기 상태
                        ref
                            .read(communityDisasterProvider.notifier)
                            .setEditState(false);
                        await ref
                            .read(communityDisasterProvider.notifier)
                            .editReply(controller.text);
                        ref
                            .read(communityDisasterProvider.notifier)
                            .setReplyId(0);
                      } else if (isChildCommentState) {
                        //대댓글을 수정, 작성 하려는 상태
                        if (parentCommentId != 0) {
                          //대댓글을 작성 상태(답글쓰기)
                          ref
                              .read(communityDisasterProvider.notifier)
                              .setParentCommentId(0);
                          await ref
                              .read(communityDisasterProvider.notifier)
                              .setReplyComment(
                                  controller.text, parentCommentId);
                        } else if (isEditChildCommentState) {
                          //대댓글을 수정하려는 상태
                          ref
                              .read(communityDisasterProvider.notifier)
                              .setEditState(false);
                          await ref
                              .read(communityDisasterProvider.notifier)
                              .editReply(controller.text);
                          ref
                              .read(communityDisasterProvider.notifier)
                              .setReplyId(0);
                        }
                        ref
                            .read(communityDisasterProvider.notifier)
                            .setChildCommentState(false);
                      } else {
                        //일반 댓글 작성의 경우
                        await ref
                            .read(communityDisasterProvider.notifier)
                            .setComment(controller.text);
                      }
                      controller.clear();
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(0, 12, 16, 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1)),
                        overlayColor: Colors.transparent),
                    child: Text('등록',
                        style: DaepiroTextStyle.body_2_m
                            .copyWith(color: DaepiroColorStyle.g_600)),
                  )
                ],
              ),
            )),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }

  Widget likeButton(bool isClick, int likeNum) {
    return Container(
      decoration: BoxDecoration(
          color: isClick ? DaepiroColorStyle.o_50 : DaepiroColorStyle.g_50,
          borderRadius: BorderRadius.circular(99)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/icon_good.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                    isClick ? DaepiroColorStyle.o_400 : DaepiroColorStyle.g_300,
                    BlendMode.srcIn)),
            SizedBox(width: 2),
            Text(
              '좋아요',
              style: DaepiroTextStyle.caption.copyWith(
                  color: isClick
                      ? DaepiroColorStyle.o_400
                      : DaepiroColorStyle.g_300),
            ),
            SizedBox(width: 2),
            Visibility(
              visible: likeNum > 0,
              child: Text(
                '${likeNum}',
                style: DaepiroTextStyle.caption.copyWith(
                    color: isClick
                        ? DaepiroColorStyle.o_400
                        : DaepiroColorStyle.g_300),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget replyWriteButton() {
    return Container(
      decoration: BoxDecoration(
          color: DaepiroColorStyle.g_50,
          borderRadius: BorderRadius.circular(99)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/icon_community.svg',
                width: 16,
                height: 16,
                colorFilter:
                    ColorFilter.mode(DaepiroColorStyle.g_300, BlendMode.srcIn)),
            SizedBox(width: 2),
            Text(
              '답글쓰기',
              style: DaepiroTextStyle.caption
                  .copyWith(color: DaepiroColorStyle.g_300),
            )
          ],
        ),
      ),
    );
  }

  Widget noReplyWidget() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '아직 작성된 댓글이 없어요',
            style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.g_300),
          ),
          SizedBox(height: 8),
          Text(
            '가장 먼저 유익한 정보를 나눠주세요!',
            style: DaepiroTextStyle.body_1_m
                .copyWith(color: DaepiroColorStyle.g_300),
          ),
        ],
      ),
    );
  }

  //삭제, 수정중일때의 text 위젯
  // Widget stateTextWidget(int editCommentId, int deleteCommentId,
  //     bool isEditState, String content) {
  //   if (deleteCommentId != 0) {
  //     //삭제 예정
  //     return Row(
  //       children: [
  //         SvgPicture.asset(
  //           'assets/icons/icon_warning.svg',
  //           width: 20,
  //           height: 20,
  //           colorFilter:
  //               ColorFilter.mode(DaepiroColorStyle.g_300, BlendMode.srcIn),
  //         ),
  //         Expanded(
  //             child: Container(
  //           child: Text(
  //             '작성자에 의해 삭제된 댓글입니다.',
  //             style: DaepiroTextStyle.body_2_m
  //                 .copyWith(color: DaepiroColorStyle.g_900),
  //           ),
  //         )),
  //       ],
  //     );
  //   } else {
  //     //삭제 이외의 조건
  //     return Text(
  //       isEditState && editCommentId != 0 ? '수정중' : content,
  //       style:
  //           DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_900),
  //     );
  //   }
  // }

  //수정 삭제를 위한 blur 화면 띄우는 메소드
  void goToAdditional(BuildContext context, bool isUser, int commentId,
      WidgetRef ref, bool isChildCommentState) {
    showDialog(
        useSafeArea: false,
        context: context,
        barrierColor: Colors.black.withOpacity(0.6),
        builder: (context) {
          return PopScope(
              onPopInvoked: (bool didPop) {
                if (didPop) {
                  if (isChildCommentState) {
                    ref
                        .read(communityDisasterProvider.notifier)
                        .setChildCommentState(false);
                  }
                }
              },
              child: ReplyMenuScreen(
                  isUser: isUser,
                  commentId: commentId,
                  onCancel: () => ref
                      .read(communityDisasterProvider.notifier)
                      .setDeleteState(0),
                  setDeleteState: () => ref
                      .read(communityDisasterProvider.notifier)
                      .setDeleteState(commentId),
                  setChildCommentState: () => ref
                  .read(communityDisasterProvider.notifier).setChildCommentState(false),
                  isChildCommentState: isChildCommentState
              ));
        });
  }
}
