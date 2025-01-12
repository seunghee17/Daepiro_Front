import 'package:daepiro/presentation/onboarding/controller/onboarding_view_model.dart';
import 'package:daepiro/route/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends ConsumerStatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: Duration(seconds: 5)
    );
    _controller.forward();
    checkAuth().then((isAuthenticated) {
      Future.delayed(Duration(seconds: 5), () async {
        if (isAuthenticated) {
          bool isOnboardingComplete = await _checkOnboardingComplete(ref);
          if(isOnboardingComplete) {
            GoRouter.of(context).replace('/community');
          } else {
            GoRouter.of(context).replace('/onboarding');
          }
        } else {
          GoRouter.of(context).replace('/login');
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> checkAuth() async {
    String? accessToken = await storage.read(key: 'accessToken');
    String? refreshToken = await storage.read(key: 'refreshToken');
    if((accessToken == null) && refreshToken == null || accessToken == "" && refreshToken == "") {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> _checkOnboardingComplete(WidgetRef ref) async {
    await ref.read(onboardingStateNotifierProvider.notifier).storeUserAdresses();
    String? address = await storage.read(key: 'fullAddress_0');
    if(address == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Lottie.asset('assets/lottie/splash.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller.addStatusListener((status) {
                    if(status == AnimationStatus.dismissed)
                      _controller.forward();
                    else if(status == AnimationStatus.completed)
                      _controller.reverse();
                  });
                  _controller
                  ..duration = composition.duration
                  ..forward();
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
