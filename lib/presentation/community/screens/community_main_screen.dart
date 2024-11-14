import 'package:daepiro/presentation/community/community_view_model.dart';
import 'package:daepiro/presentation/community/screens/community_disaster_screen.dart';
import 'package:daepiro/presentation/community/screens/community_town_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../cmm/DaepiroTheme.dart';
//커뮤니티 메인화면
class CommunityMainScreen extends ConsumerWidget {
  const CommunityMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final communityViewModel = ref.watch(communityViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: communityViewModel.when(
          data: (state) {
            return DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: headerWidget(),
                  ),
                  TabBar(
                    splashFactory: NoSplash.splashFactory,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: DaepiroColorStyle.g_800,
                      ),
                      insets: EdgeInsets.symmetric(horizontal: 100.0), // 좌우 인셋을 조절하여 너비를 비율에 맞춤
                    ),
                    indicatorWeight: 2,
                    labelStyle: DaepiroTextStyle.body_1_m,
                    labelColor: DaepiroColorStyle.g_800,
                    unselectedLabelColor: DaepiroColorStyle.g_300,
                    labelPadding: EdgeInsets.symmetric(vertical: 16),
                    tabs: [
                      Tab(
                          text: '재난상황',
                      ),
                      Tab(
                          text: '동네생활',
                      )],
                  ),
                  Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          CommunityDisasterScreen(),
                          CommunityTownScreen()
                        ],
                      )
                  )
                ],
              ),
            );
          },
          error: (error, stack) => Text('에러: ${error}'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }

Widget headerWidget() {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 20),
          Text('커뮤니티',
            style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),),
        ],
      )
    );
}

}