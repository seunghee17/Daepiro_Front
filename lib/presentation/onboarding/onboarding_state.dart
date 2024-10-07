import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_state.freezed.dart';
@freezed
sealed class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    @Default(false) bool isError,
    @Default('NONE') String nameState,
    @Default('NONE') String nicknameState,
    @Default(<String>{}) Set<String> jusoListState,
    @Default('') String userName,
    @Default([]) List<String> inputJusoList,
    @Default([]) List<String> inputJusoName,
    //권한 모두 동의 활성화 상태
    @Default(false) bool isAllPermissionGrant,
    //체크박스의 활성화상태
    @Default([false, false, false, false]) List<bool> isPermissionCheckboxState
}) = _OnboardingState;
}