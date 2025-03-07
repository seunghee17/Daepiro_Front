import 'package:daepiro/presentation/onboarding/controller/onboarding_view_model.dart';
import 'package:daepiro/route/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

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
      duration: const Duration(seconds: 5)
    );
    _controller.forward();
    checkAuth().then((isAuthenticated) {
      Future.delayed(const Duration(seconds: 5), () async {
        if (isAuthenticated) {
          try {
            bool isOnboardingComplete = await _checkOnboardingComplete(ref);
            if(isOnboardingComplete) {
              GoRouter.of(context).replace('/home');
            } else {
              GoRouter.of(context).replace('/onboarding');
            }
          } catch(e) {
            GoRouter.of(context).replace('/login');
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
    print("accessToken: $accessToken");
    String? refreshToken = await storage.read(key: 'refreshToken');
    if((accessToken == null) && refreshToken == null || accessToken == "" && refreshToken == "") {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> _checkOnboardingComplete(WidgetRef ref) async {
    try {
      await ref.read(onboardingStateNotifierProvider.notifier).storeSecureStorage();
      String? address = await storage.read(key: 'fullAddress_0');
      if(address == null) {
        return false;
      } else {
        return true;
      }
    } catch(e) {
      rethrow;
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        alignment: Alignment.center,
        child: Center(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Lottie.asset('assets/lottie/splash.json',
                    controller: _controller,
                    onLoaded: (composition) {
                      _controller.addStatusListener((status) {
                        if(status == AnimationStatus.dismissed) {
                          _controller.forward();
                        } else if(status == AnimationStatus.completed)
                          _controller.reverse();
                      });
                      _controller
                      ..duration = composition.duration
                      ..forward();
                    }
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
