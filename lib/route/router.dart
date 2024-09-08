import 'package:daepiro/presentation/onboarding/Onboarding1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../presentation/community/community_main_screen.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/information/information_screen.dart';
import '../presentation/login/login_screen.dart';
import '../presentation/mypage/mypage_screen.dart';
import '../presentation/onboarding/onboarding_screen.dart';
import '../presentation/splash/splash_screen.dart';
import '../presentation/sponsor/sponsor_screen.dart';
import 'main_navigation.dart';

//navigatorstate로 접근할 수 있게 해주어 앱내 화면이동 가능
//루트 네비게이터와 별도의 네비게이션 키를 설정하는 부분
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _communityNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'community');
final _informationNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'information');
final _sponsorNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sponsor');
final _mypageNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mypage');
final FlutterSecureStorage storage = FlutterSecureStorage();

//중간에 토큰 만료시 로직은 개선해야함
Future<String?> checkRedirect(BuildContext context, GoRouterState state) async {
  String current = state.uri.path;
  if(current != '/splash') {
    //await Future.delayed(Duration(seconds: 3));
    String? accessToken = await storage.read(key: 'accessToken');
    String? refreshToken = await storage.read(key: 'refreshToken');
    if((accessToken == null && refreshToken == null) || accessToken == "" && refreshToken == "") {
      return '/login';
    }
    return '/home';
  } else {
    return null;
  }
}

final goRouteProvider = Provider((ref) {
  return GoRouter(
      initialLocation: '/splash',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: '/splash',
        builder: (context, state) =>  SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
        routes: [
          GoRoute(
              path: 'onboarding1',
            builder: (context, state) => const Onboarding1()
          ),
        ]
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainNavigation(navigationShell: navigationShell);
        },
        parentNavigatorKey: _rootNavigatorKey,
          branches:[
            StatefulShellBranch(
              navigatorKey: _homeNavigatorKey,
                routes: [
                  GoRoute(
                      path: '/home',
                    builder: (context, state) => const HomeScreen(),
                  ),
                ],
            ),
            StatefulShellBranch(
              navigatorKey: _communityNavigatorKey,
              routes: [
                GoRoute(
                  path: '/community',
                  builder: (context, state) => const CommunityMainScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _informationNavigatorKey,
              routes: [
                GoRoute(
                  path: '/information',
                  builder: (context, state) => const InformationScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _sponsorNavigatorKey,
              routes: [
                GoRoute(
                  path: '/sponsor',
                  builder: (context, state) => const SponsorScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _mypageNavigatorKey,
              routes: [
                GoRoute(
                  path: '/mypage',
                  builder: (context, state) => const MypageScreen(),
                ),
              ],
            ),
          ],
      )
    ],
  );
});