import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../cmm/DaepiroTheme.dart';
import '../../../../data/model/response/community_dongnae_content_detail_response.dart';
import '../../controller/community_town_view_model.dart';

class CommunityTownDetailScreen extends ConsumerWidget {
  const CommunityTownDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(communityTownProvider);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    headerWidget(ref, state.contentDetail.category!, context),
                    contentWidget(state.contentDetail, ref),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: footerWidget(ref, context),
          )
        ],
      ),
    ));
  }

  //헤더 위젯
  Widget headerWidget(WidgetRef ref, String category, BuildContext context) {
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
            textAlign: TextAlign.center,
            ref
                .read(communityTownProvider.notifier)
                .setContentCategory(category),
            style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
          ),
        )),
        SizedBox(
          width: 24,
        )
      ],
    );
  }

  Widget contentWidget(ContentDetail content, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //TODO 서버로부터 사진형식 보고 다시 수정해야함
            // Container(
            //   decoration: BoxDecoration(
            //       color: DaepiroColorStyle.g_600,
            //       borderRadius: BorderRadius.circular(999)),
            // ),
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
                    child: SvgPicture.asset(
                        'assets/icons/icon_certification.svg',
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
              //TODO 추가적 로직
              onTap: () {},
              child: SvgPicture.asset('assets/icons/icon_more.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_200, BlendMode.srcIn)),
            ),
          ],
        ),
        const SizedBox(height: 20),
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
            visible: false,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    //TODO 사진아이템 추가
                  }),
            )),
        SizedBox(height: 20),
      ],
    );
  }

  Widget footerWidget(WidgetRef ref, BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: DaepiroColorStyle.g_50))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await ref
                    .read(communityTownProvider.notifier)
                    .checkPermission();
                GoRouter.of(context).push('/album_choice');
              },
              child: SvgPicture.asset('assets/icons/icon_photo.svg',
                  width: 28,
                  height: 28,
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_400, BlendMode.srcIn)),
            ),
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                maxLength: 1000,
                cursorColor: DaepiroColorStyle.g_900,
                onTapOutside: (event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                style: DaepiroTextStyle.body_2_m
                    .copyWith(color: DaepiroColorStyle.g_900),
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  hintText: '댓글을 작성해주세요.',
                  fillColor: DaepiroColorStyle.g_50,
                  hintStyle: DaepiroTextStyle.body_2_m
                      .copyWith(color: DaepiroColorStyle.g_200),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: DaepiroColorStyle.g_75,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            TextButton(
              onPressed: () async {
                //TODO 댓글 추가로직
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
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
