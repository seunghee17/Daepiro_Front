import 'package:daepiro/presentation/community/community_disaster_view_model.dart';
import 'package:daepiro/presentation/community/screens/disaster/community_disaster_screen.dart';
import 'package:daepiro/presentation/community/screens/town/community_town_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../cmm/DaepiroTheme.dart';

//커뮤니티 메인화면
class CommunityMainScreen extends ConsumerWidget {
  const CommunityMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(communityDisasterProvider);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
            length: 2,
            child: Builder(
              builder: (BuildContext context) {
                final TabController tabController =
                DefaultTabController.of(context);
                tabController.addListener(() {
                  if (tabController.index == 1) {
                    ref.read(communityDisasterProvider.notifier).changeScreenState(false);
                  } else {
                    ref.read(communityDisasterProvider.notifier).changeScreenState(true);
                  }
                });
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: changeHeader(state.isDisasterScreen)
                    ),
                    TabBar(
                      splashFactory: NoSplash.splashFactory,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: DaepiroColorStyle.g_800,
                        ),
                        insets: EdgeInsets.symmetric(
                            horizontal: 100.0), // 좌우 인셋을 조절하여 너비를 비율에 맞춤
                      ),
                      indicatorWeight: 2,
                      labelStyle: DaepiroTextStyle.body_1_m,
                      labelColor: DaepiroColorStyle.g_800,
                      unselectedLabelColor: DaepiroColorStyle.g_300,
                      labelPadding: EdgeInsets.symmetric(vertical: 16),
                      tabs: [Tab(text: '재난상황'), Tab(text: '동네생활')],
                    ),
                    Expanded(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            CommunityDisasterScreen(),
                            CommunityTownScreen()
                          ],
                        ))
                  ],
                );
              },
            ))
      ),
    );
  }

  Widget disasterHeaderWidget() {
    return Container(
        child: Row(
      children: [
        SizedBox(width: 20),
        Text(
          '커뮤니티',
          style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
        )
      ],
    ));
  }

  Widget townHeaderWidget() {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: (){},
            child: Row(
              children: [
                Text('강남구',
                  style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
                ),
                SizedBox(width: 4),
                SvgPicture.asset(
                    'assets/icons/icon_arrow_down.svg',
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
              ],
            ),
          ),
          Spacer(),
          TextButton(
              onPressed: (){},
              child: Text(
                '글쓰기',
                style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.o_500),
              )
          )
        ],
      ),
    );
  }
  Widget changeHeader(bool tabState) {
    if(tabState) {
      return disasterHeaderWidget();
    } else {
      return townHeaderWidget();
    }
  }
}
