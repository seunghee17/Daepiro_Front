import '../../data/model/request/onboarding_info_request.dart';
import '../../data/model/response/nickname_check_response.dart';
import '../../data/model/response/onboarding_info_response.dart';

abstract class OnboardingRepository {
  Future<NicknameCheckResponse> checkNickName({required String nickname});
  Future<OnboardingInfoResponse> sendOnboardingInfoData({required OnboardingInfoRequest onboardingInfoRequest});
}