import 'package:daepiro/data/repositoryimpl/onboarding_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/request/onboarding_info_request.dart';
import '../../../data/model/response/onboarding_info_response.dart';

part 'onboarding_sendinfo_usecase.g.dart';

@riverpod
Future<OnboardingInfoResponse> sendOnboardingInfoUseCase(SendOnboardingInfoUseCaseRef ref,
    {required OnboardingInfoRequest onboardingInfoRequest}) async {
  final repository = await ref.watch(onboardingRepositoryProvider);
  return await repository.sendOnboardingInfoData(onboardingInfoRequest: onboardingInfoRequest);
}