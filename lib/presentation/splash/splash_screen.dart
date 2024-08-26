import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
   return Scaffold(
     body: Column(
       children: [
         ElevatedButton(
           onPressed: () => context.go('/login'),
           child: const Text('로그인으로'),
         ),
         ElevatedButton(
           onPressed: () => context.go('/main'),
           child: const Text('메인으로'),
         ),
         ElevatedButton(
           onPressed: () => context.go('/main'),
           child: const Text('메인으로'),
         ),
         ElevatedButton(
           onPressed: () => context.go('/onboarding'),
           child: const Text('온보딩으로'),
         ),
         Text(
           '샘플 텍스트',
           style: TextStyle(fontSize: screenWidth * 0.1),
         )
       ],
     ),
   );
  }

}