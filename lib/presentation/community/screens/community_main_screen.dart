import 'package:daepiro/presentation/community/community_view_model.dart';
import 'package:daepiro/presentation/community/screens/community_disaster_screen.dart';
import 'package:daepiro/presentation/community/screens/community_town_screen.dart';
import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                    padding: const EdgeInsets.only(top: 14),
                    child: headerWidget(),
                  ),
                  TabBar(
                    indicatorColor: DaepiroColorStyle.g_800,
                    indicatorWeight: 2,
                    indicatorPadding: EdgeInsets.only(top: 14),
                    tabs: [
                      Tab(
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Text('재난상황', style: DaepiroTextStyle.body_1_m.copyWith(color:DaepiroColorStyle.g_800 ))
                          )
                      ),
                      Tab(
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Text('동네생활', style: DaepiroTextStyle.body_1_m.copyWith(color:DaepiroColorStyle.g_800 ))
                          )
                      )
                    ],
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