import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

//navigatorstate로 접근할 수 있게 해주어 앱내 화면이동 가능
//루트 네비게이터와 별도의 네비게이션 키를 설정하는 부분
// final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
// final _communityNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'community');
// final _informationNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'information');
// final _sponsorNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sponsor');
// final _mypageNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mypage');
// final FlutterSecureStorage storage = FlutterSecureStorage();
//
// Future<String?> checkRedirect(BuildContext context, GoRouterState state) async {
//   String? accessToken = await storage.read(key: 'accessToken');
//   String? refreshToken = await storage.read(key: 'refreshToken');
//   if((accessToken == null && refreshToken == null) || accessToken == "" && refreshToken == "") {
//     return '/login';
//   }
//   return '/home';
// }
//
// final goRouteProvider = Provider((ref) {
//   return GoRouter(
//       initialLocation: '/splash',
//     navigatorKey: _rootNavigatorKey,
//     debugLogDiagnostics: true,
//     routes: [
//       GoRoute(
//           path: '/splash',
//         builder: (context, state) => const SplashScreen(),
//       ),
//       GoRoute(
//         path: '/login',
//         builder: (context, state) => const LoginScreen(),
//       ),
//       GoRoute(
//         path: '/onboarding',
//         builder: (context, state) => const OnboardingScreen(),
//       ),
//       StatefulShellRoute.indexedStack(
//         builder: (context, state, navigationShell) {
//           return MainNavigation
//         },
//         parentNavigatorKey: _rootNavigatorKey,
//           navigatorKey: _shellNavigatorKey,
//           routes:[
//             GoRoute(
//                 path: '/home',
//               builder: (context, state) => const HomeScreen(),
//             ),
//             GoRoute(
//               path: '/community',
//               builder: (context, state) => const CommunityMainScreen(),
//             ),
//             GoRoute(
//               path: '/information',
//               builder: (context, state) => const InformationScreen(),
//             ),
//             GoRoute(
//               path: '/sponsor',
//               builder: (context, state) => const SponsorScreen(),
//             ),
//             GoRoute(
//               path: '/mypage',
//               builder: (context, state) => const MypageScreen(),
//             ),
//           ],
//       )
//     ],
//     redirect: checkRedirect
//   );
// });