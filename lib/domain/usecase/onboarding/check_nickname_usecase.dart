import 'package:daepiro/data/repositoryimpl/onboarding_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/response/nickname_check_response.dart';

part 'check_nickname_usecase.g.dart';

@riverpod
Future<NicknameCheckResponse> checkNickName(CheckNickNameRef ref,
  {required String nickName}) async {
  final repository = ref.watch(onboardingRepositoryProvider);
  return await repository.checkNickName(nickname: nickName);
}