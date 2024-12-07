
import 'package:daepiro/data/model/request/onboarding_info_request.dart';
import 'package:daepiro/presentation/onboarding/controller/onboarding_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/button/primary_filled_button.dart';

class OnboardingFinalScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(onboardingStateNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 48),
              Text(
                '이젠 대피로와 함께\n안전한 생활을 시작해보세요!',
                style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.g_900),
              ),
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: PrimaryFilledButton(
                    onPressed: () async {
                      await ref.read(onboardingStateNotifierProvider.notifier).sendUserInfo();
                      GoRouter.of(context).go('/home');
                    },
                    backgroundColor: DaepiroColorStyle.o_500,
                    pressedColor: DaepiroColorStyle.o_500,
                    borderRadius: 8,
                    child: Text(
                      '대피로 시작하기',
                      style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.white),
                    ),
                    verticalPadding: 12
                ),
              ),
              SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}