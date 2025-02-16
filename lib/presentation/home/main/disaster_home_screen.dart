import 'package:flutter/material.dart';

import '../../../cmm/DaepiroTheme.dart';

class DisasterHomeScreen extends StatefulWidget {
  const DisasterHomeScreen({super.key});

  @override
  State<DisasterHomeScreen> createState() => _DisasterHomeScreenState();
}

class _DisasterHomeScreenState extends State<DisasterHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
          child: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: DaepiroColorStyle.white,
              child: const Column(
                children: [

                  ],
              )
            )
          )
        )
    );
  }
}
