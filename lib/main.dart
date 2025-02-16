import 'package:daepiro/data/http/tokenErrorViewModel.dart';
import 'package:daepiro/presentation/const/string_helper.dart';
import 'package:daepiro/route/router.dart';
import 'package:daepiro/set_fcm.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'cmm/DaepiroTheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  String nativeKakaoKey = dotenv.get('KAKAOKEY');
  await StringHelper.ruleInitialize();
  KakaoSdk.init(nativeAppKey: nativeKakaoKey);
  await _naverInit();
  await Firebase.initializeApp();
  SettingFCM().initNotification();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();
  print("FCM 토큰: $token");

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _naverInit() async {
  await dotenv.load(fileName: ".env");
  String naverMapKey = dotenv.get('NAVER_MAP_CLIENTID');
  await NaverMapSdk.instance.initialize(
    clientId: naverMapKey,
    onAuthFailed: (e) => print("네이버맵 인증 오류:$e")
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenRefreshError = ref.watch(errorNotifierProvider);
    final goRouter = ref.watch(goRouteProvider);

    if(tokenRefreshError != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        while(context.canPop()) {
          context.pop();
        }
        GoRouter.of(context).push('/login');
        ref.read(errorNotifierProvider.notifier).clearError();
      });
    }

    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: DaepiroColorStyle.white,
      ),
    );
  }
}
