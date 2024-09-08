
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var imagewidth = screenWidth * 0.7;
    var imageheight = screenHeight * 0.3;
    var horizontalPadding = screenWidth * 0.1; // 화면 너비의 10%
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Text('홈')
            ]
        ),
      ),
    );
  }

}