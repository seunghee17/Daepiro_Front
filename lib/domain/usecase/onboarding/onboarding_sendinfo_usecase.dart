import 'package:daepiro/domain/repository/onboarding_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/request/onboarding_info_request.dart';
import '../../../data/model/response/onboarding/onboarding_info_response.dart';

final sendonboardingInfoUseCaseProvider = FutureProvider.family<OnboardingInfoResponse, SendOnboardinginfoUseCase>((ref, request) async {
  final repository = ref.watch(onboardingRepositoryProvider);
  return await repository.sendOnboardingInfoData(onboardingInfoRequest: request.onboardingInfoRequest);
});

class SendOnboardinginfoUseCase {
  final OnboardingInfoRequest onboardingInfoRequest;
  SendOnboardinginfoUseCase({required this.onboardingInfoRequest});
}
