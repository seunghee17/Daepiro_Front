import 'package:daepiro/data/model/request/onboarding_info_request.dart';
import 'package:daepiro/data/model/response/onboarding_info_response.dart';
import 'package:daepiro/data/source/onboarding/onboarding_service.dart';
import 'package:daepiro/domain/repository/onboarding_repository.dart';
import '../model/response/nickname_check_response.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl({required OnboardingService service}) : _service = service;
  final OnboardingService _service;

  @override
  Future<NicknameCheckResponse> checkNickName({required String nickname}) async {
    final isNotSame = await _service.checkNickName(nickname: nickname);
    return isNotSame;
  }

  @override
  Future<OnboardingInfoResponse> sendOnboardingInfoData({required OnboardingInfoRequest onboardingInfoRequest}) async {
    try {
      final OnboardingSendresult = await _service.sendOnboardingInfo(onboardingInfoRequest: onboardingInfoRequest);
      return OnboardingSendresult;
    } catch(e) {
      rethrow;
    }
  }
}

