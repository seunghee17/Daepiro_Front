import 'package:daepiro/domain/usecase/onboarding/check_nickname_usecase.dart';
import 'package:daepiro/domain/usecase/onboarding/onboarding_sendinfo_usecase.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/request/onboarding_info_request.dart';
import '../../../domain/usecase/onboarding/juso_result_usecase.dart';
import '../state/onboarding_state.dart';

final onboardingStateNotifierProvider = StateNotifierProvider<OnboardingViewModel, OnboardingState>((ref) {
  return OnboardingViewModel(OnboardingState());
});

class OnboardingViewModel extends StateNotifier<OnboardingState> {
  List<String> inputJusoList = [];

  OnboardingViewModel(super.state);

  void setNameState(String nameState) {
    state = state.copyWith(nameState: nameState);
  }

  void updateUserName(String name) {
    state = state.copyWith(userName: name);
  }

  void updateNickName(String nickName) {
    state = state.copyWith(userNickName: nickName);
  }

  void setNickState(String nickState) {
    state = state.copyWith(nicknameState: nickState);
  }

  Future<bool> checkNickName(String nickname, WidgetRef ref) async {
    final result = await ref.read(checkNickNameProvider(CheckNickNameUseCase(nickName: nickname)).future);
    return result.data?.isAvailable ?? false;
  }

  Future<void> sendUserInfo(WidgetRef ref) async {
    final address = parseAddress();
    final fcmToken = await getFcmToken();
    await ref.read(onboardingInfoProvider(
        OnboardingSendinfoUseCase(onboardingInfoRequest: OnboardingInfoRequest(
            realname: state.userName,
            nickname: state.userNickName,
            addresses: address,
            disasterTypes: state.disasterTypes,
            fcmToken: fcmToken,
        ))).future);
  }

  Future<String> getFcmToken() async {
    String? _fcmToken = await FirebaseMessaging.instance.getToken();
    return _fcmToken ?? '';
  }

  void setJusoNick(String firstNick, String secondNick) {
    state = state.copyWith(firstJusoNick: firstNick, secondJusoNick: secondNick);
  }

  List<Addresses> parseAddress() {
    List<Addresses> result = [];
    List<String> jusoNickName = [
      state.homeJusoNick,
      state.firstJusoNick,
      state.secondJusoNick
    ];
    List<String> address = [state.homeJuso, state.firstJuso, state.secondJuso];
    for (int i = 0; i < 3; i++) {
      if (jusoNickName[i] != '' && address[i] != '') {
        result.add(Addresses(name: jusoNickName[i], address: address[i]));
      }
    }
    return result;
  }

//검색결과 주소 리스트 반환
  Future<void> getJusoList(
      String inputJuso, int currentPage, bool append, WidgetRef ref) async {
    final result = await ref.read(jusoResultProvider(JusoListUseCase(inputJuso: inputJuso, currentPage: currentPage)).future);
    final currentList = state.jusoListState;
    try {
      final updateList = append ? currentList.union(result.toSet()) : result.toSet();
      state = state.copyWith(jusoListState: updateList, isError: false);
    } catch(e) {
      state = state.copyWith(isError: true);
    }
  }

  void addHomeJuso(String homeJuso) {
    state = state.copyWith(homeJuso: homeJuso);
  }

  void addFirstJuso(String firstJuso) {
    state = state.copyWith(firstJuso: firstJuso);
  }

  void addSecondJuso(String secondJuso) {
    state = state.copyWith(secondJuso: secondJuso);
  }

  //지역 추가 칩 상태 업데이트를 위해
  bool checkPlusChipState(
      TextEditingController homecontroller,
      TextEditingController jusoController1,
      TextEditingController jusoController2,
      bool juso1visible,
      bool juso2visible) {
    bool result = false;
    if (!juso1visible && !juso2visible && homecontroller.text.length > 1) {
      result = true;
    } else if (juso1visible && jusoController1.text.length > 1) {
      result = true;
    } else if (juso2visible && jusoController2.text.length > 1) {
      result = true;
    } else {
      result = false;
    }
    return result;
  }

  void deleteHomeJuso() {
    state = state.copyWith(homeJuso: '');
  }

  void deleteFirstJuso() {
    state = state.copyWith(firstJuso: '');
  }

  void deleteSecondJuso() {
    state = state.copyWith(secondJuso: '');
  }

  //검색 결과 초기화
  void initSearchHistory() {
    state = state.copyWith(jusoListState: Set<String>());
  }

  //집 주소 입력 여부 검증
  String checkHomeControllerState(TextEditingController homeController,
      bool juso1visible, bool juso2visible) {
    if ((juso1visible || juso2visible) && homeController.text.isEmpty) {
      return 'LENGTH_ERROR';
    } else {
      return 'AVAILABLE';
    }
  }

  //주소 별명 오류검증
  String checklocationControllerState(TextEditingController nickController) {
    if (nickController.text.isEmpty) {
      return 'LENGTH_ERROR';
    } else if (nickController.text.length > 8) {
      return 'OVERFLOW_ERROR';
    } else if (!checkForSpecialCharacter(nickController.text)) {
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
    bool currentGrantState = state.isAllAppPermissionGrant;
    List<bool> updateGrantList = [false, false, false, false, false];
    for (int i = 0; i < 5; i++) {
      updateGrantList[i] = !currentGrantState;
    }
    state = state.copyWith(
        isAllAppPermissionGrant: !currentGrantState,
        isAppPermissionCheckboxState: updateGrantList);
  }

  //개별 권한 동의
  void updateEachPermissionState(int index) {
    var permissionState = List<bool>.from(state.isAppPermissionCheckboxState);
    permissionState[index] = !permissionState[index];
    state = state.copyWith(isAppPermissionCheckboxState: permissionState);
    bool allChecked = permissionState.every((checked) => checked);
    state = state.copyWith(isAllAppPermissionGrant: allChecked);
  }
}
