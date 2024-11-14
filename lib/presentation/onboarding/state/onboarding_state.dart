import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_state.freezed.dart';
@freezed
sealed class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    @Default(false) bool isError,
    @Default('NONE') String nameState,
    @Default('NONE') String nicknameState,
    //검색된 주소 목록의 중복을 제거하기 위함
    @Default(<String>{}) Set<String> jusoListState,
    @Default('') String userName,
    //TODO 입력한 실주소 지워질 예정
    @Default(['', '', '']) List<String> inputJusoList,
    @Default('') String homeJuso,
    @Default('') String? firstJuso,
    @Default('') String? secondJuso,
    //입력한 주소 별명
    @Default([]) List<String> inputJusoName,
    //권한 모두 동의 활성화 상태
    @Default(false) bool isAllAppPermissionGrant,
    //체크박스의 활성화상태
    @Default([false, false, false, false, false]) List<bool> isAppPermissionCheckboxState,
    @Default([]) List<String> disasterTypes
}) = _OnboardingState;
}