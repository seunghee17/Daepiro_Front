import 'package:daepiro/route/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    Future.delayed(Duration(seconds: 5), checkAuth);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void checkAuth() async {
    String? accessToken = await storage.read(key: 'accessToken');
    String? refreshToken = await storage.read(key: 'refreshToken');
    if((accessToken == null) && refreshToken == null || accessToken == "" && refreshToken == "") {
      GoRouter.of(context).go('/login');
    } else {
      GoRouter.of(context).go('/home');
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
