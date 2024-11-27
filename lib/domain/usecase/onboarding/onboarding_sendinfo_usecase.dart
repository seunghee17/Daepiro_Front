import 'package:daepiro/data/repositoryimpl/onboarding_repository_impl.dart';
import 'package:daepiro/domain/repository/onboarding_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/request/onboarding_info_request.dart';
import '../../../data/model/response/onboarding_info_response.dart';

//part 'onboarding_sendinfo_usecase.g.dart';
final onboardingInfoProvider = FutureProvider.family<OnboardingInfoResponse, OnboardingSendinfoUseCase>((ref, request) async {
  final repository = await ref.watch(onboardingRepositoryProvider);
  return await repository.sendOnboardingInfoData(onboardingInfoRequest: request.onboardingInfoRequest);
});

class OnboardingSendinfoUseCase {
  final OnboardingInfoRequest onboardingInfoRequest;
  OnboardingSendinfoUseCase({required this.onboardingInfoRequest});
}
