import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text('home')
          ],
        ),
      ),
    );
  }

}