import 'package:daepiro/presentation/mypage/controller/mypage_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../cmm/DaepiroTheme.dart';
import '../../../data/model/response/mypage/get_mypage_articles_response.dart';
import '../../community/controller/community_town_view_model.dart';

class MyPageUserWritingScreen extends ConsumerStatefulWidget {
  @override
  MyPageUserWritingState createState() => MyPageUserWritingState();
}

class MyPageUserWritingState extends ConsumerState<MyPageUserWritingScreen> {
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
    final state = ref.read(myPageProvider);
    final viewModel = ref.read(myPageProvider.notifier);

    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (state.isArticleHasMore && !state.isArticleLoading) {
        viewModel.getMyArticles();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myPageProvider);
    final viewModel = ref.read(myPageProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(),
              Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.myArticles.length,
                            itemBuilder: (context, index) {
                              final content = state.myArticles[index];
                              return listItemWidget(() async {
                                //상세 기사정보 화면으로 이동
                                await ref.read(communityTownProvider.notifier).getContentDetail(content.id!);
                                GoRouter.of(context).push('/community_town_detail');
                              }, content, ref);
                            }
                        ),
                        if (state.isArticleLoading)
                          Center(
                            child: CircularProgressIndicator(),
                          )
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      )
    );
  }

  //리스트 아이템 위젯
  Widget listItemWidget(VoidCallback event, UserArticle content, WidgetRef ref) {
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
                SizedBox(height: 8),
                typeChip(ContentCategory.getByValue(content.category!)),
                SizedBox(height: 12),
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
                          SizedBox(height: 2),
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
                    SizedBox(width: 10),
                    Visibility(
                      visible: content.previewImageUrl != null,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: content.previewImageUrl != null ? Image.network(
                          width: 68,
                          height: 68,
                          content.previewImageUrl!,
                          fit: BoxFit.fill,
                        ) : SizedBox.shrink(),
                      ),
                    )
                  ],
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
                        ref
                            .read(communityTownProvider.notifier)
                            .parseCommentTime(
                            content.lastModifiedAt == content.createdAt! ?
                            content.createdAt! : content.lastModifiedAt!),
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

  Widget typeChip(String type) {
    return Container(
      decoration: BoxDecoration(
          color: DaepiroColorStyle.g_50,
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Text(
          type,
          style:
          DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_500),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
                ref.read(myPageProvider.notifier).initMyArticleState();
              },
              child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_900, BlendMode.srcIn)),
            ),
          ),
          Expanded(
            child: Text(
              '내가 쓴 글',
              textAlign: TextAlign.center,
              style:
              DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
            ),
          ),
          Container(
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }

}