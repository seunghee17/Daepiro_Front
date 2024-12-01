import 'package:daepiro/data/http/http_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/request/onboarding_info_request.dart';
import '../../data/model/response/nickname_check_response.dart';
import '../../data/model/response/onboarding_info_response.dart';
import '../../data/repositoryimpl/onboarding_repository_impl.dart';
import '../../data/source/onboarding/onboarding_service.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  final http = ref.watch(dioProvider);
  return OnboardingRepositoryImpl(service: OnboardingService(http));
});

abstract class OnboardingRepository {
  Future<NicknameCheckResponse> checkNickName({required String nickname});
  Future<OnboardingInfoResponse> sendOnboardingInfoData({required OnboardingInfoRequest onboardingInfoRequest});
}