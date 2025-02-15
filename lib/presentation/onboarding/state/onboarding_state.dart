import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
sealed class OnboardingState with _$OnboardingState {
  factory OnboardingState(
      {
      //주소 검색 오류 상태
      @Default(false) bool isError,
      @Default('') String nameState,
      @Default('') String nicknameState,
      @Default(false) bool completeSetName,
      @Default(false) bool completeSetNickName,

      @Default('') String userName,
      @Default('') String userNickName,
      //입력한 주소값
      @Default('') String homeJuso,
      @Default('') String firstJuso,
      @Default('') String secondJuso,
      //입력한 주소 별명
      @Default('집') String homeJusoNick,
      @Default('') String firstJusoNick,
      @Default('') String secondJusoNick,

      //주소 별명 입력 오류 상태
      @Default('*별명 설정은 필수입니다.') String firstJusoState,
      @Default('*별명 설정은 필수입니다.') String secondJusoState,

      //주소 입력 텍스트 필드 visible 상태
      @Default(false) bool isJuso1Visible,
      @Default(false) bool isJuso2Visible,

      //권한 모두 동의 활성화 상태
      @Default(false) bool isAllAppPermissionGrant,
      //체크박스의 활성화상태
      @Default([false, false, false, false, false])
      List<bool> isAppPermissionCheckboxState,
      @Default([]) List<String> disasterTypes}) = _OnboardingState;
}
