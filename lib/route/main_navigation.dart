import 'package:daepiro/presentation/community/controller/community_disaster_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../cmm/DaepiroTheme.dart';

class MainNavigation extends ConsumerStatefulWidget {
  const MainNavigation({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends ConsumerState<MainNavigation> {

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationBar(
      body: widget.navigationShell,
      currentIndex: widget.navigationShell.currentIndex,
      onDestinationSelected: (index) async {
        if(index != widget.navigationShell.currentIndex) {
          widget.navigationShell.goBranch(index);
          if(index==1) {
            await ref.read(communityDisasterProvider.notifier).reloadData();
          }
        }
      },
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
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: DaepiroColorStyle.g_75, width: 2),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            height: MediaQuery.of(context).size.height * 0.099,
            backgroundColor: DaepiroColorStyle.white,
            indicatorColor: Colors.transparent,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (Set<WidgetState> states) {
                  if(states.contains(WidgetState.selected)) {
                    return DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_600);
                  }
                  return DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_100);
                },
            ),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
                (Set<WidgetState> states) {
                  if(states.contains(WidgetState.selected)) {
                    return const IconThemeData(color: DaepiroColorStyle.g_600);
                  }
                  return const IconThemeData(color: DaepiroColorStyle.g_100);
                }
            ),
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
          child: NavigationBar(
            selectedIndex: currentIndex,
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/icon_home.svg',
                  colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/icon_home.svg',
                  colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
                ),
                label: '홈',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                'assets/icons/icon_community.svg',
                colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
              ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/icon_community.svg',
                    colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
                ),
                label: '커뮤니티',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/icon_info.svg',
                  colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
                ),
                selectedIcon:  SvgPicture.asset(
                  'assets/icons/icon_info.svg',
                  colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
                ),
                label: '재난정보',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/icon_funding.svg',
                  colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/icon_funding.svg',
                  colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
                ),
                label: '후원',
              ),
              NavigationDestination(
                icon:SvgPicture.asset(
                  'assets/icons/icon_my.svg',
                  colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_100, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/icon_my.svg',
                  colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
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