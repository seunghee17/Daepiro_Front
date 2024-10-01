import 'package:daepiro/data/model/response/jusolist_response.dart';
import 'package:daepiro/data/repositoryimpl/juso_repository_impl.dart';
import 'package:daepiro/domain/usecase/onboarding/check_nickname_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecase/onboarding/juso_result_usecase.dart';
import 'onboarding_state.dart';
part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {

  @override
  FutureOr<OnboardingState> build() async {
    return OnboardingState(nameState: 'NONE', nicknameState: 'NONE');
  }

  Future<void> setNameState(String nameState) async {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(nameState: nameState));
    }
  }

  Future<void> setNickState(String nickState) async {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(nicknameState: nickState));
    }
  }

  Future<void> checkNickName(String nickname) async {
    final value = state.valueOrNull;
    if(value != null) {
      state = await AsyncValue.guard(() async {
        final result = await ref.read(checkNickNameProvider(nickName: nickname).future);
        bool? nickState = result.data?.isAvailable;
        return value.copyWith(
          nicknameState: nickState! ? 'SUCCESS' : 'SAME'
        );
      });
    }
  }

  Future<void> getJusoList(String inputJuso) async {
    state = await AsyncValue.guard(() async {
      final result = await ref.read(getjusoListProvider(inputJuso: inputJuso).future);
      return state.value?.copyWith(jusoListState: result) ?? OnboardingState();
    });
  }
}