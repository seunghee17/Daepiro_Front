import 'package:daepiro/data/http/http_provider.dart';
import 'package:daepiro/data/source/onboarding/onboarding_service.dart';
import 'package:daepiro/domain/repository/onboarding_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/response/nickname_check_response.dart';
part 'onboarding_repository_impl.g.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl({required OnboardingService service}) : _service = service;
  final OnboardingService _service;

  @override
  Future<NicknameCheckResponse> checkNickName({required String nickname}) async {
    final isNotSame = await _service.checkNickName(nickname: nickname);
    return isNotSame;
  }

}

@riverpod
OnboardingRepository onboardingRepository(OnboardingRepositoryRef ref) {
  final http = ref.watch(httpProvider);
  return OnboardingRepositoryImpl(service: OnboardingService(http));
}