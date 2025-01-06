import 'package:daepiro/presentation/community/controller/community_town_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../cmm/DaepiroTheme.dart';
import '../../../../data/model/response/community_dongnae_content_response.dart';

//동네생활 화면
class CommunityTownScreen extends ConsumerWidget {
  CommunityTownScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO 추후 state & viewmodel 단으로 이동해야하는 코드
    List<TypeModel> typeData = [];
    typeData.add(TypeModel(true, '전체', 'ALL'));
    typeData.add(TypeModel(false, '일상', 'LIFE'));
    typeData.add(TypeModel(false, '교통', 'TRAFFIC'));
    typeData.add(TypeModel(false, '치안', 'SAFE'));
    typeData.add(TypeModel(false, '기타', 'OTHER'));
    final state = ref.watch(communityTownProvider);
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
        final viewModel = ref.read(communityTownProvider.notifier);
        if (state.isDongNaeHasMore && !state.isDongNaeLoading) {
          viewModel.loadContent(state.townCommunityType);
        }
      }
    });

    return Scaffold(
        body: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/community_rule');
                  },
                  child: ruleContainer()),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  child: typeRadioButton(state.townCommunityType, ref)),
                if(state.isDongNaeContentEmpty && !state.isDongNaeLoading)
                  //없을때 로직
                  Container()
                else
                  ...state.contentList.map((content) {
                    return listItemWidget(() async {
                      await ref.read(communityTownProvider.notifier).getContentDetail(content.id!);
                      GoRouter.of(context).push('/community_town_detail');
                    }, content, ref);
                  }).toList(),
                if(state.isDongNaeLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ),
    );
  }

  Widget ruleContainer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: DaepiroColorStyle.o_50),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13),
        child: Row(
          children: [
            SizedBox(width: 12),
            SvgPicture.asset('assets/icons/icon_noti.svg',
                width: 28,
                height: 28,
                colorFilter:
                    ColorFilter.mode(DaepiroColorStyle.o_400, BlendMode.srcIn)),
            SizedBox(width: 6),
            Text('대피로 커뮤니티 이용수칙',
                style: DaepiroTextStyle.body_2_m
                    .copyWith(color: DaepiroColorStyle.g_900)),
            Spacer(),
            SvgPicture.asset('assets/icons/icon_arrow_right.svg',
                width: 16,
                height: 16,
                colorFilter:
                    ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
            SizedBox(width: 12)
          ],
        ),
      ),
    );
  }

  //글 유형 타입 radio button
  Widget typeRadioButton(String typeState, WidgetRef ref) {
    return Container(
        height: 36,
        child: Row(
          children: [
            typeItem('ALL', typeState, '전체', ref),
            typeItem('LIFE', typeState, '일상', ref),
            typeItem('TRAFFIC', typeState, '교통', ref),
            typeItem('SAFE', typeState, '치안', ref),
            typeItem('OTHER', typeState, '기타', ref)
          ],
        ));
  }

  Widget typeItem(
      String type, String typeState, String realText, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () async {
          await ref.read(communityTownProvider.notifier).selectButton(type);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: typeState == type
                  ? DaepiroColorStyle.g_600
                  : DaepiroColorStyle.g_50),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: Text(
              realText,
              style: typeState == type
                  ? DaepiroTextStyle.body_1_m.copyWith(color: Colors.white)
                  : DaepiroTextStyle.body_1_m
                      .copyWith(color: DaepiroColorStyle.g_600),
            ),
          ),
        ),
      ),
    );
  }

  //리스트 아이템 위젯
  Widget listItemWidget(
    VoidCallback event,
      Content content,
      WidgetRef ref
  ) {
    return GestureDetector(
      onTap: event,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Visibility(
                    visible: true,
                    child: Column(
                      children: [typeChip(), SizedBox(height: 12)],
                    )),
                Text(
                  content.title ?? '',
                  style: DaepiroTextStyle.body_1_b
                      .copyWith(color: DaepiroColorStyle.g_900),
                ),
                SizedBox(height: 2),
                Text(
                  content.body ?? '',
                  style: DaepiroTextStyle.body_2_m
                      .copyWith(color: DaepiroColorStyle.g_500),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      content.authorUser?.nickname ?? '',
                      style: DaepiroTextStyle.caption
                          .copyWith(color: DaepiroColorStyle.g_800),
                    ),
                    SizedBox(width: 2),
                    Visibility(
                      visible: content.authorUser?.isVerified ?? false,
                      child: SvgPicture.asset(
                          'assets/icons/icon_certification.svg',
                          width: 16,
                          height: 16,
                          colorFilter: ColorFilter.mode(
                              DaepiroColorStyle.o_300, BlendMode.srcIn)),
                    ),
                    SizedBox(width: 6),
                    Text(
                        ref.read(communityTownProvider.notifier).parseCommentTime(content.createdAt ?? ''),
                        style: DaepiroTextStyle.caption
                            .copyWith(color: DaepiroColorStyle.g_300)),
                    Spacer(),
                    SvgPicture.asset('assets/icons/icon_good.svg',
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(
                            DaepiroColorStyle.g_200, BlendMode.srcIn)),
                    SizedBox(width: 2),
                    Text(content.likeCount.toString(),
                        style: DaepiroTextStyle.caption
                            .copyWith(color: DaepiroColorStyle.g_200)),
                    SizedBox(width: 4),
                    SvgPicture.asset('assets/icons/icon_community.svg',
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(
                            DaepiroColorStyle.g_200, BlendMode.srcIn)),
                    SizedBox(width: 2),
                    Text(content.commentCount.toString(),
                        style: DaepiroTextStyle.caption
                            .copyWith(color: DaepiroColorStyle.g_200)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget typeChip() {
    return Container(
      decoration: BoxDecoration(
          color: DaepiroColorStyle.g_50,
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Text(
          '일상',
          style:
              DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_500),
        ),
      ),
    );
  }
}

class TypeModel {
  bool isSelected;
  final String text;
  final String type;

  TypeModel(this.isSelected, this.text, this.type);
}
