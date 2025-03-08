import 'package:daepiro/domain/usecase/onboarding/check_nickname_usecase.dart';
import 'package:daepiro/domain/usecase/onboarding/onboarding_sendinfo_usecase.dart';
import 'package:daepiro/domain/usecase/onboarding/user_adresses_usecase.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../data/model/request/onboarding_info_request.dart';
import '../../../domain/usecase/onboarding/juso_result_usecase.dart';
import '../../const/utils.dart';
import '../state/onboarding_state.dart';

final onboardingStateNotifierProvider =
    StateNotifierProvider<OnboardingViewModel, OnboardingState>((ref) {
  return OnboardingViewModel(ref);
});

class OnboardingViewModel extends StateNotifier<OnboardingState> {
  final Ref ref;
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Set<String> get inputJusoList => _inputJusoList;
  Set<String> _inputJusoList = Set<String>();

  OnboardingViewModel(this.ref) : super(OnboardingState());

  void setNameState(String name) {
    if (checkForNameRule(name)) {
      state =
          state.copyWith(nameState: '*이름은 한글로 입력해주세요.', completeSetName: false);
    } else if (name.length > 6) {
      state = state.copyWith(
          nameState: '*최대 6자까지 작성 가능해주세요.', completeSetName: false);
    } else if (name.length <= 6 && !checkForNameRule(name) && name != '') {
      state = state.copyWith(nameState: '', completeSetName: true);
    } else if (name == '') {
      state = state.copyWith(nameState: '', completeSetName: false);
    }
    updateUserName(name);
  }

  Future<void> setNickNameState(String nickName) async {
    if (nickName.length > 10) {
      state = state.copyWith(nicknameState: '*최대 10자까지 작성해주세요.', completeSetNickName: false);
    }

    if (!checkForSpecialCharacter(nickName)) {
      state = state.copyWith(nicknameState: '*닉네임은 한글/영문/숫자로 입력해주세요.', completeSetNickName: false);
    }

    if(nickName.length <= 10 && checkForSpecialCharacter(nickName)) {
      bool isAvailable = await _checkNickName(nickName);
      if (!isAvailable) {
        state = state.copyWith(
            nicknameState: nickName.isNotEmpty ? '*이미 사용 중인 닉네임이에요.' : '',
            completeSetNickName: false);
      } else {
        state = state.copyWith(nicknameState: '*사용 가능한 닉네임 입니다.', completeSetNickName: true);
      }
    }
    updateNickName(nickName);
  }


  void updateUserName(String name) {
    state = state.copyWith(userName: name);
  }

  void updateNickName(String nickName) {
    state = state.copyWith(userNickName: nickName);
  }

  bool getProceedState() {
    if (state.completeSetName && state.completeSetNickName) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _checkNickName(String nickname) async {
    final result = await ref.read(
        checkNickNameUseCaseProvider(CheckNickNameUseCase(nickName: nickname))
            .future);
    return result.data?.isAvailable ?? false;
  }

  //재난리스트 아이템 추가
  void addDisasterType(String disasterType) {
    final mutableList = List<String>.from(state.disasterTypes);
    mutableList.add(disasterType);
    state = state.copyWith(disasterTypes: List.unmodifiable(mutableList));
  }

  void removeDisasterType(String disasterType) {
    final mutableList = List<String>.from(state.disasterTypes);
    mutableList.remove(disasterType);
    state = state.copyWith(disasterTypes: List.unmodifiable(mutableList));
  }

  void setDisasterTypeInit() {
    state = state.copyWith(disasterTypes: []);
  }

  Future<void> sendUserInfo() async {
    final address = parseAddress();
    final fcmToken = await getFcmToken();
    await ref.read(sendonboardingInfoUseCaseProvider(SendOnboardinginfoUseCase(
        onboardingInfoRequest: OnboardingInfoRequest(
      realname: state.userName,
      nickname: state.userNickName,
      addresses: address,
      disasterTypes: state.disasterTypes,
      fcmToken: fcmToken,
    ))).future);
  }

  //주소 저장과 이름 닉네임 저장
  Future<void> storeSecureStorage() async {
    try {
      final userAddresses = await ref
          .read(userAddressUseCaseProvider(UserAddressUseCase()).future);
      if (userAddresses.length > 0) {
        for (int i = 0; i < userAddresses.length; i++) {
          await storage.write(
              key: 'fullAddress_$i', value: userAddresses[i].fullAddress);
          await storage.write(
              key: 'shortAddress_$i', value: userAddresses[i].shortAddress);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getFcmToken() async {
    String? _fcmToken = await FirebaseMessaging.instance.getToken();
    return _fcmToken ?? '';
  }

  void controlJusoState(int index) {
    if(index == 1) {
      state = state.copyWith(
        firstJusoNick: '',
        firstJusoState: '',
        firstJuso: '',
        isJuso1Visible: false,
      );
    } else {
      state = state.copyWith(
        secondJusoNick: '',
        secondJusoState: '',
        secondJuso: '',
        isJuso2Visible: false,
      );
    }
  }

  void setJusoNick(String firstNick, String secondNick) {
    state =
        state.copyWith(firstJusoNick: firstNick, secondJusoNick: secondNick);
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
      String inputJuso, int currentPage, bool append) async {
    final result = await ref.read(getJusoListUseCaseProvider(
            GetJusoListUseCase(inputJuso: inputJuso, currentPage: currentPage))
        .future);
    final currentList = _inputJusoList;
    try {
      final updateList =
          append ? currentList.union(result.toSet()) : result.toSet();
      _inputJusoList = updateList;
      state = state.copyWith(isError: false);
    } catch (e) {
      state = state.copyWith(isError: true);
    }
  }

  void initErrorStateAddress() {
    state = state.copyWith(isError: false);
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
    state = state.copyWith(firstJuso: '', isJuso1Visible: false);
  }

  void deleteSecondJuso() {
    state = state.copyWith(secondJuso: '', isJuso2Visible: false);
  }

  //주소 검색 결과 초기화
  void initSearchHistory() {
    _inputJusoList = Set<String>();
  }

  void setVisibleState(int index, bool value) {
    if (index == 1) {
      state = state.copyWith(isJuso1Visible: value);
    } else {
      state = state.copyWith(isJuso2Visible: value);
    }
  }

  //주소 별명 오류검증
  void checklocationControllerState(
      TextEditingController nickController, int index) {
    if (nickController.text.isEmpty) {
      if (index == 1) {
        state = state.copyWith(firstJusoState: '*별명은 필수로 입력해주세요.');
      } else {
        state = state.copyWith(secondJusoState: '*별명은 필수로 입력해주세요.');
      }
    } else if (nickController.text.length > 8) {
      if (index == 1) {
        state = state.copyWith(firstJusoState: '*최대 8자까지 작성해주세요.');
      } else {
        state = state.copyWith(secondJusoState: '*별명은 한글/영문/숫자로 입력해주세요.');
      }
    } else if (!checkForSpecialCharacter(nickController.text)) {
      if (index == 1) {
        state = state.copyWith(firstJusoState: '*별명은 한글/영문/숫자로 입력해주세요.');
      } else {
        state = state.copyWith(secondJusoState: '*별명은 한글/영문/숫자로 입력해주세요.');
      }
    } else {
      if (index == 1) {
        state = state.copyWith(firstJusoState: 'Possible');
      } else {
        state = state.copyWith(secondJusoState: 'Possible');
      }
    }
    if(index == 1) {
      state = state.copyWith(firstJusoNick: nickController.text);
    } else {
      state = state.copyWith(secondJusoNick: nickController.text);
    }
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
