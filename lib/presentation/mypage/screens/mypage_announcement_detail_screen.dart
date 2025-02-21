
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:daepiro/presentation/const/utils.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../../data/model/response/mypage/get_mypage_announcement_detail_response.dart';
import '../controller/mypage_viewmodel.dart';

class MypageAnnouncementDetailScreen extends ConsumerWidget {
  final String? id;
  const MypageAnnouncementDetailScreen({super.key, this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageProvider);
    final viewModel = ref.read(myPageProvider.notifier);
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(state.isLoading || state.announcementDetailResponse == null)
                  const Center(child: CircularProgressIndicator()),
                if(!state.isLoading && state.announcementDetailResponse != null)
                  headerWidget(context),
                  SizedBox(height: 20),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            contentDetail(state.announcementDetailResponse!),
                          ],
                        ),
                      )
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: footerWidget(),
                )
              ],
            ),
          ),
        )
    );
  }

  //헤더 위젯
  Widget headerWidget(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                width: 24,
                height: 24,
                colorFilter:
                ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
          ),
        ),
        Spacer(),
        Text('공지사항',
            style:
            DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800)),
        Spacer(),
        Container(
          width: 24,
          height: 24,
        )
      ],
    );
  }

  Widget contentDetail(AnnouncementDetailResponse detail) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              detail.data?.title ?? '',
            style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
          ),
          SizedBox(height: 8),
          Text(
            formatDateToDot(detail.data?.createdAt ?? ''),
            style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_400),
          ),
          SizedBox(height: 24),
          Text(
            detail.data?.body ?? '',
            style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_800),
          ),
          SizedBox(height: 24),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: DaepiroColorStyle.g_50
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [

                ],
              ),
            )
          )
        ],
      ),
    );
  }

  Widget footerWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Text('CONTACT: daepiro82@gmail.com',
          style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_400),
        ),
      ),
    );
  }

}
