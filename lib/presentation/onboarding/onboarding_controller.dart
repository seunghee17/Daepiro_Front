import 'package:daepiro/domain/usecase/onboarding/check_nickname_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecase/onboarding/juso_result_usecase.dart';
import 'onboarding_state.dart';
part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  List<String> inputJusoList = [];

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

  Future<void> updateUserName(String name) async {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(userName: name));
    }
  }

  Future<void> setNickState(String nickState) async {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(nicknameState: nickState));
    }
  }

  Future<bool?> checkNickName(String nickname) async {
    final result = await ref.read(checkNickNameProvider(nickName: nickname).future);
    return result.data?.isAvailable;
  }

//검색결과 주소 리스트 반환
  Future<void> getJusoList(String inputJuso, int currentPage, bool append) async {
    state = await AsyncValue.guard(() async {
      try {
        final result = await ref
            .read(getjusoListProvider(inputJuso: inputJuso, currentPage: currentPage).future);
        final currentList = state.value?.jusoListState ?? <String>{};
        final updateList = append ? currentList.union(result.toSet()) : result.toSet();
        return state.value?.copyWith(
          jusoListState: updateList,
          isError: false,
        ) ?? OnboardingState(jusoListState: updateList);

      } catch (e) {
        return state.value?.copyWith(isError: true) ?? OnboardingState(isError: true);
      }
    });
  }

  Future<void> addJuso(String jusoString) async {
    final value = state.valueOrNull;
    if(value != null) {
      inputJusoList.add(jusoString);
      state =  state.whenData((value) => value.copyWith(inputJusoList: inputJusoList));
    }
  }

  Future<void> addFirstIdxJuso(String jusoString) async {
    var currentList = state.value!.inputJusoList ?? [];
    currentList.insert(0, jusoString);
    state = state.whenData((value) => value.copyWith(inputJusoList: currentList));
  }

  Future<List<String>> getInputJusoList() async {
    return state.value!.inputJusoList;
  }
  Future<void> initJusoList() async {
    state =  state.whenData((value) => value.copyWith(jusoListState: Set()));
  }
}