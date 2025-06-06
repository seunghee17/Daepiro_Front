import 'package:daepiro/domain/repository/onboarding_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/response/onboarding/nickname_check_response.dart';

final checkNickNameUseCaseProvider =
    FutureProvider.family<NicknameCheckResponse, CheckNickNameUseCase>(
        (ref, request) async {
  final repository = ref.watch(onboardingRepositoryProvider);
  return await repository.checkNickName(nickname: request.nickName);
});

class CheckNickNameUseCase {
  final String nickName;

  CheckNickNameUseCase({required this.nickName});
}
