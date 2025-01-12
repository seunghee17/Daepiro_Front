import 'package:daepiro/presentation/community/controller/community_disaster_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../cmm/DaepiroTheme.dart';
import '../../../../data/model/response/community_dongnae_content_detail_response.dart';
import '../../controller/community_town_view_model.dart';
import '../reply_menu_screen.dart';

class CommunityTownDetailScreen extends ConsumerStatefulWidget {
  const CommunityTownDetailScreen({Key? key}) : super(key: key);

  @override
  CommunityTownDetailState createState() => CommunityTownDetailState();
}

class CommunityTownDetailState
    extends ConsumerState<CommunityTownDetailScreen> {
  TextEditingController replyController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(communityTownProvider);

    //댓글 작성 혹은 대댓글 작성시 자동으로 focus 주기위한 용도
    if (state.deleteCommentId != 0 && !state.isChildCommentState) {
      Future.delayed(const Duration(seconds: 5), () async {
        if (state.deleteCommentId != 0) {
          await ref.read(communityTownProvider.notifier).deleteReply();
        }
      });
    }

    if (state.deleteChildCommentId != 0 && state.isChildCommentState) {
      Future.delayed(const Duration(seconds: 5), () async {
        if (state.deleteChildCommentId != 0) {
          await ref.read(communityTownProvider.notifier).deleteReply();
        }
      });
    }

    if (state.isEditState) {
      //일반 댓글 편집 상태임
      focusNode.requestFocus();
    } else if (state.editChildCommentId != 0) {
      focusNode.requestFocus();
    }

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    headerWidget(
                        ContentCategory.getByValue(
                            state.contentDetail.category!),
                        context),
                    subHeaderWidget(state.contentDetail, ref),
                    contentWidget(state.contentDetail, ref),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () async {
                              await ref
                                  .read(communityTownProvider.notifier)
                                  .replyLike(state.contentDetail.id!);
                            },
                            child: likeButton(state.contentDetail.isLiked!,
                                state.contentDetail.likeCount!)),
                        Spacer()
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(color: DaepiroColorStyle.g_50),
                      width: double.infinity,
                      height: 4,
                    ),
                    if (state.isDongNaeLoading)
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      replyListWidget(
                          state.townReplyList,
                          state.isEditState,
                          state.editCommentId,
                          state.isChildCommentState,
                          state.deleteCommentId)
                  ],
                ),
              ),
            ),
          ),
          footerWidget(
              replyController,
              focusNode,
              context,
              state.isEditState,
              state.isChildCommentState,
              state.parentCommentId,
              state.isEditChildCommentState)
        ],
      ),
    ));
  }

  //헤더 위젯
  Widget headerWidget(String category, BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GestureDetector(
            onTap: GoRouter.of(context).pop,
            child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                width: 24,
                height: 24,
                colorFilter:
                    ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
          ),
        ),
        Expanded(
            child: Center(
          child: Text(
            category,
            style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
          ),
        )),
        SizedBox(
          width: 24,
        )
      ],
    );
  }

  Widget subHeaderWidget(ContentDetail content, WidgetRef ref) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          //TODO 사진
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(content.authorUser!.nickname!,
                    style: DaepiroTextStyle.body_2_b
                        .copyWith(color: DaepiroColorStyle.g_800)),
                Visibility(
                  visible: content.authorUser?.isVerified ?? false,
                  child: SvgPicture.asset('assets/icons/icon_certification.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                          DaepiroColorStyle.o_300, BlendMode.srcIn)),
                ),
              ]),
              const SizedBox(height: 2),
              Text(
                  ref
                      .read(communityTownProvider.notifier)
                      .parseCommentTime(content.createdAt ?? ''),
                  style: DaepiroTextStyle.caption
                      .copyWith(color: DaepiroColorStyle.g_300)),
            ],
          ),
          Spacer(),
          GestureDetector(
            //TODO 게시글 수정
            onTap: () {},
            child: SvgPicture.asset('assets/icons/icon_more.svg',
                width: 24,
                height: 24,
                colorFilter:
                    ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn)),
          ),
        ],
      ),
    );
  }

  //수정 삭제를 위한 blur 화면 띄우는 메소드
  void goToAdditional(BuildContext context, bool isUser, int id, WidgetRef ref,
      bool isChildCommentState) {
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
                        .read(communityTownProvider.notifier)
                        .setChildCommentState(false);
                  }
                }
              },
              child: ReplyMenuScreen(
                  isUser: isUser,
                  commentId: id,
                  onCancel: () => ref
                      .read(communityTownProvider.notifier)
                      .setDeleteState(0),
                  setDeleteState: () => ref
                      .read(communityTownProvider.notifier)
                      .setDeleteState(id),
                  setChildCommentState: () => ref
                      .read(communityTownProvider.notifier)
                      .setChildCommentState(false),
                  isChildCommentState: isChildCommentState));
        });
  }

  Widget contentWidget(ContentDetail content, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content.title ?? '',
          style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
        ),
        const SizedBox(height: 8),
        Text(
          content.body ?? '',
          style: DaepiroTextStyle.body_2_m
              .copyWith(color: DaepiroColorStyle.g_400),
        ),
        Visibility(
            visible: content.files!.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 118,
                child: ListView.builder(
                    itemCount: content.files!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      Container(
                        width: 118,
                        margin: EdgeInsets.only(right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            content.files![index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }),
              ),
            )),
        SizedBox(height: 20),
      ],
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

  //댓글 리스트 위젯
  Widget replyListWidget(
      List<CommentData> list,
      bool isTownEditState,
      int editTownCommentId,
      bool isTownChildCommentState,
      int editTownChildCommentId) {
    return Container(
        width: double.infinity,
        child: Column(
          children: List.generate(list.length, (index) {
            return replyWidget(list[index], isTownEditState, editTownCommentId,
                isTownChildCommentState, editTownChildCommentId);
          }),
        ));
  }

  //대댓글 리스트 위젯들
  Widget reReplyListWidget(
    bool isChildCommentState,
    int editChildCommentId,
    List<Children> list,
  ) {
    return Container(
      width: double.infinity,
      child: Column(
        children: List.generate(list.length, (index) {
          return reReplyWidget(
            isChildCommentState,
            editChildCommentId,
            list[index],
          );
        }),
      ),
    );
  }

  //댓글 아이템 위젯
  Widget replyWidget(CommentData comment, bool isEditState, int editCommentId,
      bool isChildCommentState, int editChildCommentId) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: isEditState && editChildCommentId == comment.id
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
                  comment.author?.nickname ?? '탈퇴한 사용자',
                  style: DaepiroTextStyle.caption
                      .copyWith(color: DaepiroColorStyle.g_800),
                ),
                Visibility(
                    visible: comment.author?.isVerified ?? false,
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
                  visible: comment.createdAt == comment.lastModifiedAt,
                  child: Text(
                    '수정됨 · ',
                    style: DaepiroTextStyle.caption
                        .copyWith(color: DaepiroColorStyle.g_300),
                  ),
                ),
                Text(
                  ref
                      .read(communityTownProvider.notifier)
                      .parseCommentTime(comment.lastModifiedAt!),
                  style: DaepiroTextStyle.caption
                      .copyWith(color: DaepiroColorStyle.g_300),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    goToAdditional(
                        context, true, comment.id!, ref, isChildCommentState);
                  },
                  child: SvgPicture.asset('assets/icons/icon_moreinfo.svg',
                      colorFilter: ColorFilter.mode(
                          DaepiroColorStyle.g_200, BlendMode.srcIn)),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              editCommentId == comment.id ? '수정중' : comment.body!,
              style: DaepiroTextStyle.body_2_m
                  .copyWith(color: DaepiroColorStyle.g_900),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                GestureDetector(
                    onTap: () async {
                      await ref
                          .read(communityTownProvider.notifier)
                          .replyLike(comment.id!);
                    },
                    child: likeButton(
                        comment.isLiked ?? false, comment.likeCount!)),
                SizedBox(width: 8),
                GestureDetector(
                    onTap: () {
                      //TODO 답글쓰기 로직
                      ref
                          .read(communityTownProvider.notifier)
                          .setChildCommentState(true);
                      ref
                          .read(communityTownProvider.notifier)
                          .setParentCommentId(comment.id!);
                      focusNode.requestFocus();
                    },
                    child: replyWriteButton())
              ],
            ),
            SizedBox(height: 8),
            if (comment.children != [])
              reReplyListWidget(
                  isChildCommentState, editChildCommentId, comment.children!)
          ],
        ),
      ),
    );
  }

  //대댓글 아이템 위젯
  Widget reReplyWidget(bool isTownEditChildCommentState,
      int editTownChildCommentId, Children childComment) {
    return Container(
      decoration: BoxDecoration(
        color: isTownEditChildCommentState &&
                editTownChildCommentId == childComment.id
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
                              childComment.author!.nickname ?? '탈퇴한 사용자',
                              style: DaepiroTextStyle.caption
                                  .copyWith(color: DaepiroColorStyle.g_800),
                            ),
                            Visibility(
                                visible:
                                    childComment.author!.isVerified ?? false,
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
                                  .read(communityTownProvider.notifier)
                                  .parseCommentTime(
                                      childComment.lastModifiedAt!),
                              style: DaepiroTextStyle.caption
                                  .copyWith(color: DaepiroColorStyle.g_300),
                            ),
                            Flexible(child: Container()),
                            GestureDetector(
                                onTap: () {
                                  ref
                                      .read(communityTownProvider.notifier)
                                      .setChildCommentState(true);
                                  goToAdditional(
                                      context,
                                      true,
                                      childComment.id!,
                                      ref,
                                      isTownEditChildCommentState);
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
                          editTownChildCommentId == childComment.id
                              ? '수정중'
                              : childComment.body!,
                          style: DaepiroTextStyle.body_2_m
                              .copyWith(color: DaepiroColorStyle.g_900),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  await ref
                                      .read(communityTownProvider.notifier)
                                      .replyLike(childComment.id!);
                                },
                                child: likeButton(childComment.isLiked ?? false,
                                    childComment.likeCount ?? 0)),
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

  Widget footerWidget(
      TextEditingController controller,
      FocusNode focusNode,
      BuildContext context,
      bool isEditState,
      bool isChildCommentState,
      int parentCommentId,
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
                    focusNode: focusNode,
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
                  )),
                  SizedBox(width: 12),
                  TextButton(
                    onPressed: () async {
                      if (isEditState) {
                        //수정하기 상태
                        ref
                            .read(communityTownProvider.notifier)
                            .setEditState(false);
                        await ref
                            .read(communityTownProvider.notifier)
                            .editReply(controller.text);
                        ref.read(communityTownProvider.notifier).setReplyId(0);
                      } else if (isChildCommentState) {
                        //대댓글을 수정, 작성 하려는 상태
                        if (parentCommentId != 0) {
                          //대댓글을 작성 상태(답글쓰기)
                          ref
                              .read(communityTownProvider.notifier)
                              .setParentCommentId(0);
                          await ref
                              .read(communityTownProvider.notifier)
                              .setReplyComment(
                                  controller.text, parentCommentId);
                        } else if (isEditChildCommentState) {
                          //대댓글을 수정하려는 상태
                          ref
                              .read(communityTownProvider.notifier)
                              .setEditState(false);
                          await ref
                              .read(communityTownProvider.notifier)
                              .editReply(controller.text);
                          ref
                              .read(communityTownProvider.notifier)
                              .setReplyId(0);
                        }
                        ref
                            .read(communityTownProvider.notifier)
                            .setChildCommentState(false);
                      } else {
                        //일반 댓글 작성의 경우
                        await ref
                            .read(communityTownProvider.notifier)
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
                  ),
                ],
              ),
            )),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
