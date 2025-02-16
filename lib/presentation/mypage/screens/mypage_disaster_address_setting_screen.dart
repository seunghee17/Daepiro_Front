import 'package:daepiro/presentation/mypage/controller/mypage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MypageDisasterAddressSettingScreen extends ConsumerStatefulWidget {
  const MypageDisasterAddressSettingScreen({super.key});

  @override
  MyPageDisasterAddressState createState() => MyPageDisasterAddressState();
}

class MyPageDisasterAddressState extends ConsumerState<MypageDisasterAddressSettingScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myPageProvider);

    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              
            ],
          ),
        ),
      )
    );
  }
}