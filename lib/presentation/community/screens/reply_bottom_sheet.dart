import 'package:daepiro/presentation/community/community_disaster_view_model.dart';
import 'package:daepiro/presentation/community/screens/reply_menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../cmm/DaepiroTheme.dart';

class ReplyBottomSheet extends ConsumerStatefulWidget {
  @override
  ReplyBottomSheetState createState() => ReplyBottomSheetState();
}

class ReplyBottomSheetState extends ConsumerState<ReplyBottomSheet> {
  final TextEditingController replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final communityViewModel = ref.watch(communityDisasterProvider);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            headerWidget(),
            Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        replyWidget(ref, true, context, true),
                        reReplyWidget(true, context, true)
                      ],
                    ),
                  ),
                )
            ),
            footerWidget()
          ],
        ),
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
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                      'assets/icons/icon_close.svg',
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

  Widget replyWidget(WidgetRef ref, bool isCertificateUser, BuildContext context, bool isUser) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '김연지',
                style: DaepiroTextStyle.caption
                    .copyWith(color: DaepiroColorStyle.g_800),
              ),
              Visibility(
                  visible: isCertificateUser,
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
              Text(
                '5분전',
                style: DaepiroTextStyle.caption
                    .copyWith(color: DaepiroColorStyle.g_300),
              ),
              Spacer(),
              //TODO 사양보고 다시 설정하기
              GestureDetector(
                onTap: () {
                  goToEdit(context, isUser);
                },
                child: SvgPicture.asset('assets/icons/icon_moreinfo.svg',
                    colorFilter: ColorFilter.mode(
                        DaepiroColorStyle.g_200, BlendMode.srcIn)),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            '내용내용내용',
            style: DaepiroTextStyle.body_2_m
                .copyWith(color: DaepiroColorStyle.g_900),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              GestureDetector(onTap: () {}, child: likeButton(false, 1)),
              SizedBox(width: 8),
              GestureDetector(onTap: () {}, child: replyWriteButton())
            ],
          ),
          //TODO listview생성해서 대댓글 담아야함
        ],
      ),
    );
  }

  Widget reReplyWidget(bool isCertificateUser, BuildContext context, bool isUser) {
    return Container(
      child: IntrinsicHeight (
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
                          '김연지',
                          style: DaepiroTextStyle.caption
                              .copyWith(color: DaepiroColorStyle.g_800),
                        ),
                        Visibility(
                            visible: isCertificateUser,
                            child: Row(
                              children: [
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/icon_certification.svg',
                                    width: 16,
                                    height: 16,
                                    colorFilter: ColorFilter.mode(DaepiroColorStyle.o_300, BlendMode.srcIn)),
                              ],
                            )),
                        SizedBox(width: 6),
                        Text(
                          '5분전',
                          style: DaepiroTextStyle.caption
                              .copyWith(color: DaepiroColorStyle.g_300),
                        ),
                        Flexible(child: Container()),
                        GestureDetector(
                            onTap: () {
                              goToEdit(context, isUser);
                            },
                            child: SvgPicture.asset(
                                'assets/icons/icon_moreinfo.svg',
                                colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn))),
        
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      '내용내용내용바나나차차',
                      style: DaepiroTextStyle.body_2_m
                          .copyWith(color: DaepiroColorStyle.g_900),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        GestureDetector(onTap: () {}, child: likeButton(true, 1)),
                        Spacer()
                      ],
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget footerWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: DaepiroColorStyle.g_50))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Row(
          children: [
            SizedBox(width: 20),
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
              //TODO: 1000자 제한 추가하기
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: DaepiroColorStyle.g_50
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: null,
                        cursorColor: DaepiroColorStyle.g_900,
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_900),
                        decoration: InputDecoration(
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
                      onPressed: (){},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0, 12, 16, 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1)
                          ),
                          overlayColor: Colors.transparent
                      ),
                      child: Text('등록', style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_600)),
                    )
                  ],
                ),
              )
            ),
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
                  color: isClick ? DaepiroColorStyle.o_400 : DaepiroColorStyle.g_300),
            ),
            SizedBox(width: 2),
            Visibility(
              visible: likeNum > 0,
              child: Text(
                '${likeNum}',
                style: DaepiroTextStyle.caption.copyWith(
                    color: isClick ? DaepiroColorStyle.o_400 : DaepiroColorStyle.g_300),
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
    return Center(
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

  Widget deleteSuccessDialog() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Text(
              '댓글이 삭제되었습니다.',
              style: DaepiroTextStyle.body_2_m
                  .copyWith(color: DaepiroColorStyle.white),
            ),
            Spacer(),
            GestureDetector(
              //TODO 댓글 삭제 취소 api 연결필요
              onTap: () {},
              child: Text(
                '취소',
                style: DaepiroTextStyle.body_2_m
                    .copyWith(color: DaepiroColorStyle.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //수정 삭제를 위한 blur 화면 띄우는 메소드
  void goToEdit(BuildContext context, bool isUser) {
    showDialog(
        useSafeArea: false,
        context: context,
        barrierColor: Colors.black.withOpacity(0.6),
        builder: (context) {
          return ReplyMenuScreen(isUser: isUser);
        });
  }

  //댓글 삭제
  //TODO: isDeleteComplete와 연결시키기
  void showDeleteSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.black.withOpacity(0.6),
      behavior: SnackBarBehavior.floating,
      content: Text(
        '댓글이 삭제되었습니다.',
        style:
            DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.white),
      ),
      action: SnackBarAction(
          label: '취소',
          textColor: DaepiroColorStyle.white,
          //TODO 댓글 삭제 취소 api 연결필요
          onPressed: () {}),
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
