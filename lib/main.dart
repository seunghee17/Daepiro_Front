import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:daepiro/route/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  String nativeKakaoKey = dotenv.get('KAKAOKEY');
  KakaoSdk.init(nativeAppKey: nativeKakaoKey);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouteProvider);

    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: DaepiroColorStyle.white,
      ),
    );


  }

}
