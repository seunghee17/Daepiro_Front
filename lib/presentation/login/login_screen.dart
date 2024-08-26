import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/request/token_request.dart';
import 'login_controller.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //provider 상태 구독
    //위젯이 자동으로 렌더링된다
    final state = ref.watch(loginControllerProvider);
    final tokken = 'kakao'; //예시로 넣어둠
    final TokenRequest request = TokenRequest(token: tokken);
    return Scaffold(
      appBar: AppBar(title: const Text('login screen'),),
      body: Column(
        children: [
          if(state.isLoading)
            const CircularProgressIndicator(),
          ElevatedButton(
              onPressed: () async {
                //provider의 상태 읽는다
                //상태 변경에 대한 위젯 빌드는 하지 않는다
                await ref.read(loginControllerProvider.notifier).tokenData();
              },
              child: Text('login')
          )
        ],
      ),
    );
  }

}