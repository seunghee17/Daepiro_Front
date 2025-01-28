import 'package:daepiro/data/http/tokenErrorViewModel.dart';
import 'package:daepiro/route/router.dart';
import 'package:daepiro/set_fcm.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'cmm/DaepiroTheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  String nativeKakaoKey = dotenv.get('KAKAOKEY');
  KakaoSdk.init(nativeAppKey: nativeKakaoKey);
  await Firebase.initializeApp();

  SettingFCM().initNotification();
  String? _fcmToken = await FirebaseMessaging.instance.getToken();
  print('토큰토큰 $_fcmToken');

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

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
