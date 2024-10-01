import '../../data/model/response/nickname_check_response.dart';

abstract class OnboardingRepository {
  Future<NicknameCheckResponse> checkNickName({required String nickname});
}