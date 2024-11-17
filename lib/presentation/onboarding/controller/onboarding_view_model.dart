import 'package:daepiro/domain/usecase/onboarding/check_nickname_usecase.dart';
import 'package:daepiro/domain/usecase/onboarding/onboarding_sendinfo_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/model/request/onboarding_info_request.dart';
import '../../../domain/usecase/onboarding/juso_result_usecase.dart';
import '../state/onboarding_state.dart';
part 'onboarding_view_model.g.dart';

@riverpod
class OnboardingViewModel extends _$OnboardingViewModel {
  List<String> inputJusoList = [];

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

  Future<void> updateNickName(String nickName) async {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(userNickName: nickName));
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

  Future<void> sendUserInfo(OnboardingInfoRequest request) async {
    await ref.read(sendOnboardingInfoUseCaseProvider(onboardingInfoRequest: request).future);
  }

  void setJusoNick(String firstNick, String secondNick) {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(firstJusoNick: firstNick, secondJusoNick: secondNick));
    }
  }

  List<Addresses> parseAddress() {
    List<String> name = [state.value!.homeJusoNick, state.value!.firstJusoNick, state.value!.secondJusoNick];
    List<String> address = [state.value!.homeJuso, state.value!.firstJuso, state.value!.secondJuso];
    List<Addresses> result = [];
    for(int i=0; i<3; i++) {
      result.add(Addresses(name: name[i], address: address[i]));
    }
    return result;
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

  void addHomeJuso(String homeJuso) {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(homeJuso: homeJuso));
    }
  }

  void addFirstJuso(String firstJuso) {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(firstJuso: firstJuso));
    }
  }

  void addSecondJuso(String secondJuso) {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(secondJuso: secondJuso));
    }
  }

  //지역 추가 칩 상태 업데이트를 위해
  bool checkPlusChipState(
      TextEditingController homecontroller,
      TextEditingController jusoController1,
      TextEditingController jusoController2,
      bool juso1visible,
      bool juso2visible
  ) {
    bool result = false;
    if(!juso1visible && !juso2visible && homecontroller.text.length>1) {
      result = true;
    } else if(juso1visible && jusoController1.text.length>1) {
      result = true;
    } else if(juso2visible && jusoController2.text.length>1) {
      result = true;
    } else {
      result = false;
    }
    return result;
  }

  void deleteHomeJuso(TextEditingController controller) {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(homeJuso: ''));
    }
  }

  void deleteFirstJuso(TextEditingController controller) {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(firstJuso: ''));
    }
  }

  void deleteSecondJuso(TextEditingController controller) {
    final value = state.valueOrNull;
    if(value != null) {
      state =  state.whenData((value) => value.copyWith(secondJuso: ''));
    }
  }

  //검색 결과 초기화
  Future<void> initSearchHistory() async {
    state = state.whenData((value) => value.copyWith(jusoListState: Set<String>()));
  }

  //집 주소 입력 여부 검증
  String checkHomeControllerState(TextEditingController homeController, bool juso1visible, bool juso2visible) {
    if((juso1visible || juso2visible) && homeController.text.isEmpty) {
      return 'LENGTH_ERROR';
    } else {
      return 'AVAILABLE';
    }
  }

  //주소 별명 오류검증
  String checklocationControllerState(TextEditingController nickController) {
    if(nickController.text.isEmpty) {
      return 'LENGTH_ERROR';
    } else if(nickController.text.length>8) {
      return 'OVERFLOW_ERROR';
    } else if(!checkForSpecialCharacter(nickController.text)) {
      return 'NOT_TYPE';
    } else {
      return 'AVAILABLE';
    }
  }

  //특수문자 검증용 정규식
  bool checkForSpecialCharacter(String text) {
    final regex = RegExp(r'[^가-힣a-zA-Z0-9]');
    return !regex.hasMatch(text);
  }

  //필수 권한 모두 동의
  void updateAllAgreeState() {
    bool current = state.value!.isAllAppPermissionGrant;
    List<bool> updateList = [false, false, false, false, false];
    for(int i=0; i<5; i++) {
      updateList[i] = !current;
    }
    state =  state.whenData((value) => value.copyWith(
        isAllAppPermissionGrant: !current,
        isAppPermissionCheckboxState: updateList
    ));
  }

  //개별 권한 동의
  void updateEachPermissionState(int index) {
    var current = List<bool>.from(state.value!.isAppPermissionCheckboxState);
    current[index] = !current[index];
    state =  state.whenData((value) => value.copyWith(
        isAppPermissionCheckboxState: current
    ));
    bool allChecked = current.every((checked) => checked);
    state =  state.whenData((value) => value.copyWith(
        isAllAppPermissionGrant: allChecked
    ));
  }


}