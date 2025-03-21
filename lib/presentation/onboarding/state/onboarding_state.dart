import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
sealed class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    //주소 검색 오류 상태
    @Default(false) bool isError,
    @Default('') String nicknameState,
    @Default(false) bool completeSetNickName,
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
    @Default([]) List<String> disasterTypes,
    @Default([
      '(필수) 만 14세 이상입니다.',
      '(필수) 서비스 이용약관 동의',
      '(필수) 개인 정보 수집 ・ 이용 동의',
      '(필수) 위치정보 이용 동의'
    ])
    List<String> termList,
  }) = _OnboardingState;
}
