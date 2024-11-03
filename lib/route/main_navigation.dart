import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../presentation/widgets/DaepiroTheme.dart';


class MainNavigation extends StatelessWidget {
  const MainNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;


  void _goBranch(int index) {
    if(index != navigationShell.currentIndex) {
      navigationShell.goBranch(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationBar(
      body: navigationShell,
      currentIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: Container (
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: DaepiroColorStyle.g_75, width: 2),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            height: MediaQuery.of(context).size.height * 0.099,
            backgroundColor: DaepiroColorStyle.white,
            indicatorColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                (Set<MaterialState> states) {
                  if(states.contains(MaterialState.selected)) {
                    return DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_600);
                  }
                  return DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_100);
                },
            ),
            iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
                (Set<MaterialState> states) {
                  if(states.contains(MaterialState.selected)) {
                    return IconThemeData(color: DaepiroColorStyle.g_600);
                  }
                  return IconThemeData(color: DaepiroColorStyle.g_100);
                }
            ),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: NavigationBar(
            selectedIndex: currentIndex,
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/icon_home.svg',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/icon_home.svg',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
                ),
                label: '홈',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                'assets/icons/icon_community.svg',
                colorFilter: ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
              ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/icon_community.svg',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
                ),
                label: '커뮤니티',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/icon_info.svg',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
                ),
                selectedIcon:  SvgPicture.asset(
                  'assets/icons/icon_info.svg',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
                ),
                label: '재난정보',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/icon_funding.svg',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/icon_funding.svg',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
                ),
                label: '후원',
              ),
              NavigationDestination(
                icon:SvgPicture.asset(
                  'assets/icons/icon_mypage.svg',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/icon_mypage.svg',
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
                ),
                label: '마이페이지',
              ),
            ],
            onDestinationSelected: (index) {
              if (index != currentIndex) onDestinationSelected(index);
            },
          ),
        ),
      ),
    );
  }
}