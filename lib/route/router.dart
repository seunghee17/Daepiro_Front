import 'package:daepiro/data/model/response/sponsor/sponsor_list_response.dart';
import 'package:daepiro/presentation/community/screens/album/album_choice_screen.dart';
import 'package:daepiro/presentation/community/screens/album/uploadimage_screen.dart';
import 'package:daepiro/presentation/community/screens/community_report_screen.dart';
import 'package:daepiro/presentation/information/contents/disaster_contents_screen.dart';
import 'package:daepiro/presentation/information/emergency_response/emergency_response_screen.dart';
import 'package:daepiro/presentation/information/contents/search/search_disaster_contents_screen.dart';
import 'package:daepiro/presentation/information/behavior_tip/search/search_disaster_type_screen.dart';
import 'package:daepiro/presentation/community/screens/community_rule_screen.dart';
import 'package:daepiro/presentation/information/shelter/around_shelter_extra.dart';
import 'package:daepiro/presentation/onboarding/screens/juso_input_screen.dart';
import 'package:daepiro/presentation/onboarding/screens/onboarding_third_screen.dart';
import 'package:daepiro/presentation/sponsor/cheer_screen.dart';
import 'package:daepiro/presentation/sponsor/sponsor_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import '../data/model/response/information/behavior_list_response.dart';
import '../presentation/community/screens/community_main_screen.dart';
import '../presentation/community/screens/town/community_town_detail_screen.dart';
import '../presentation/community/screens/town/community_town_writing_screen.dart';
import '../presentation/home/history/disaster_message_detail_screen.dart';
import '../presentation/home/history/disaster_message_history_screen.dart';
import '../presentation/home/main/home_screen.dart';
import '../presentation/information/behavior_tip/behavior_tips_screen.dart';
import '../presentation/information/main/information_screen.dart';
import '../presentation/information/shelter/around_shelter_screen.dart';
import '../presentation/login/login_screen.dart';
import '../presentation/mypage/mypage_screen.dart';
import '../presentation/onboarding/screens/onboarding_fifth_screen.dart';
import '../presentation/onboarding/screens/onboarding_final_screen.dart';
import '../presentation/onboarding/screens/onboarding_first_screen.dart';
import '../presentation/onboarding/screens/onboarding_fourth_screen.dart';
import '../presentation/onboarding/screens/onboarding_second_screen.dart';
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
  if (current != '/splash') {
    await Future.delayed(Duration(seconds: 3));
    String? accessToken = await storage.read(key: 'accessToken');
    String? refreshToken = await storage.read(key: 'refreshToken');
    if ((accessToken == null && refreshToken == null) ||
        accessToken == "" && refreshToken == "") {
      return '/login';
    }
    return '/home';
  } else {
    return null;
  }
}

final goRouteProvider = Provider((ref) {
  return GoRouter(
     // initialLocation: '/splash',
     initialLocation: '/login',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: '/splash',
        builder: (context, state) =>  SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
          path: '/community_rule',
          builder: (context, state) => CommunityRuleScreen()
      ),
      GoRoute(
          path: '/community_town_detail',
          builder: (context, state) => CommunityTownDetailScreen()
      ),
      GoRoute(
          path: '/album_choice',
          builder: (context, state) => AlbumChoiceScreen()
      ),
      GoRoute(
          path: '/album_screen',
          builder: (context, state) => AlbumScreen()
      ),
      GoRoute(
          path: '/community_report_screen',
          builder: (context, state) => CommunityReportScreen()
      ),
      GoRoute(
        path: '/community_town_writing',
        builder: (context, state) => CommunityTownWritingScreen()
      ),
      GoRoute(
          path: '/onboarding',
          builder: (context, state) => const OnboardingFirstScreen(),
          routes: [
            GoRoute(
                path: 'first',
                builder: (context, state) => const OnboardingSecondScreen()
            ),
            GoRoute(
                path: 'second',
                builder: (context, state) => const OnboardingThirdScreen()
            ),
            GoRoute(
                path: 'juso/:type/:index',
                builder: (context, state) {
                  final type = state.pathParameters['type'];
                  final index = state.pathParameters['index'];
                  return JusoInputScreen(type: type, index: index);
                }
            ),
            GoRoute(
                path: 'third',
                builder: (context, state) => OnboardingFourthScreen()
            ),
            GoRoute(
                path: 'fourth',
                builder: (context, state) => OnboardingFifthScreen()
            ),
            GoRoute(
                path: 'final',
                builder: (context, state) => OnboardingFinalScreen()
            ),
          ]
      ),
      GoRoute(
          path: '/behaviorTips',
          builder: (context, state) => BehaviorTipsScreen()
      ),
      GoRoute(
          path: '/emergencyResponse',
          builder: (context, state) => EmergencyResponseScreen()
      ),
      GoRoute(
          path: '/disasterContents',
          builder: (context, state) => DisasterContentsScreen()
      ),
      GoRoute(
          path: '/searchDisasterContents',
          builder: (context, state) => SearchDisasterContentsScreen()
      ),
      GoRoute(
        path: '/aroundShelter',
        builder: (context, state) => AroundShelterScreen(
            extra: state.extra as AroundShelterExtra
        ),
      ),
      GoRoute(
          path: '/searchDisasterType',
          builder: (context, state) => SearchDisasterTypeScreen(
              behaviorList: state.extra as List<Behavior>
          )
      ),
      GoRoute(
        path: '/sponsorDetail',
        builder: (context, state) => SponsorDetailScreen(
            extra: state.extra as Sponsor
        ),
      ),
      GoRoute(
        path: '/cheer',
        builder: (context, state) => CheerScreen(),
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
                    builder: (context, state) => HomeScreen(),
                    routes: [
                      GoRoute(
                        path: 'disasterMessageHistory',
                        builder: (context, state) => const DisasterMessageHistoryScreen(),
                      ),
                      GoRoute(
                        path: 'disasterMessageDetail',
                        builder: (context, state) => const DisasterMessageDetailScreen(),
                      ),
                    ]
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
                  builder: (context, state) => InformationScreen(),
                  routes: [


                  ]
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _sponsorNavigatorKey,
              routes: [
                GoRoute(
                  path: '/sponsor',
                  builder: (context, state) => SponsorScreen(),
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