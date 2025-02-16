import 'package:daepiro/presentation/community/controller/community_town_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../cmm/DaepiroTheme.dart';
import '../../../../data/model/response/community/community_dongnae_content_response.dart';

class CommunityTownScreen extends ConsumerStatefulWidget {
  const CommunityTownScreen({super.key});

  @override
  CommunityTownState createState() => CommunityTownState();
}

//동네생활 화면
class CommunityTownState extends ConsumerState<CommunityTownScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }


  void _onScroll() {
    final state = ref.read(communityTownProvider);
    final viewModel = ref.read(communityTownProvider.notifier);

    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (state.isDongNaeHasMore && !state.isDongNaeLoading) {
        viewModel.loadContent();
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(communityTownProvider);

    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/community_rule');
                  },
                  child: ruleContainer()),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: typeRadioButton(state.townCategory, ref)),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.contentList.length,
                  itemBuilder: (context, index) {
                  final content = state.contentList[index];
                  return listItemWidget(() async {
                        await ref.read(communityTownProvider.notifier).getContentDetail(content.id!);
                        GoRouter.of(context).push('/community_town_detail');
                      },
                  content, ref);
                  }
              ),
              if (state.isDongNaeLoading)
                const Center(
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
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: DaepiroColorStyle.o_50),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Row(
          children: [
            const SizedBox(width: 12),
            SvgPicture.asset('assets/icons/icon_noti.svg',
                width: 28,
                height: 28,
                colorFilter:
                    const ColorFilter.mode(DaepiroColorStyle.o_400, BlendMode.srcIn)),
            const SizedBox(width: 6),
            Text('대피로 커뮤니티 이용수칙',
                style: DaepiroTextStyle.body_2_m
                    .copyWith(color: DaepiroColorStyle.g_900)),
            const Spacer(),
            SvgPicture.asset('assets/icons/icon_arrow_right.svg',
                width: 16,
                height: 16,
                colorFilter:
                    const ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
            const SizedBox(width: 12)
          ],
        ),
      ),
    );
  }

  //글 유형 타입 radio button
  Widget typeRadioButton(String townCategory, WidgetRef ref) {
    return SizedBox(
        height: 36,
        child: Row(
          children: [
            typeItem(townCategory == '전체', '전체', ref),
            typeItem(townCategory == '일상', '일상', ref),
            typeItem(townCategory == '교통', '교통', ref),
            typeItem(townCategory == '치안', '치안', ref),
            typeItem(townCategory == '기타', '기타', ref)
          ],
        ));
  }

  Widget typeItem(bool isSame, String realText, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () async {
          await ref.read(communityTownProvider.notifier).selectButton(realText);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: isSame
                  ? DaepiroColorStyle.g_600
                  : DaepiroColorStyle.g_50),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: Text(
              realText,
              style: isSame
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
  Widget listItemWidget(VoidCallback event, Content content, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: event,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                typeChip(ContentCategory.getByValue(content.category!)),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content.title ?? '',
                            style: DaepiroTextStyle.body_1_b
                                .copyWith(color: DaepiroColorStyle.g_900),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            content.body ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: DaepiroTextStyle.body_2_m
                                .copyWith(color: DaepiroColorStyle.g_500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Visibility(
                      visible: content.previewImageUrl != null,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: content.previewImageUrl != null ? Image.network(
                            width: 68,
                            height: 68,
                            content.previewImageUrl!,
                            fit: BoxFit.fill,
                          ) : const SizedBox.shrink(),
                        ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      content.authorUser?.nickname ?? '',
                      style: DaepiroTextStyle.caption
                          .copyWith(color: DaepiroColorStyle.g_800),
                    ),
                    const SizedBox(width: 2),
                    Visibility(
                      visible: content.authorUser?.isVerified ?? false,
                      child: SvgPicture.asset(
                          'assets/icons/icon_certification.svg',
                          width: 16,
                          height: 16,
                          colorFilter: const ColorFilter.mode(
                              DaepiroColorStyle.o_300, BlendMode.srcIn)),
                    ),
                    const SizedBox(width: 6),
                    Text(
                        ref
                            .read(communityTownProvider.notifier)
                            .parseCommentTime(
                            content.lastModifiedAt == content.createdAt! ?
                                content.createdAt! : content.lastModifiedAt!),
                        style: DaepiroTextStyle.caption
                            .copyWith(color: DaepiroColorStyle.g_300)),
                    const Spacer(),
                    SvgPicture.asset('assets/icons/icon_good.svg',
                        width: 16,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                            DaepiroColorStyle.g_200, BlendMode.srcIn)),
                    const SizedBox(width: 2),
                    Text(content.likeCount.toString(),
                        style: DaepiroTextStyle.caption
                            .copyWith(color: DaepiroColorStyle.g_200)),
                    const SizedBox(width: 4),
                    SvgPicture.asset('assets/icons/icon_community.svg',
                        width: 16,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                            DaepiroColorStyle.g_200, BlendMode.srcIn)),
                    const SizedBox(width: 2),
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

  Widget typeChip(String type) {
    return Container(
      decoration: BoxDecoration(
          color: DaepiroColorStyle.g_50,
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Text(
         type,
          style:
              DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_500),
        ),
      ),
    );
  }
}
