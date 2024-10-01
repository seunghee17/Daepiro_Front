import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
//이 화면 혹은 기능에서 발생할 수 있는 모든 상태 정의
//이 코드에서는 로그인 과정의 다양한 상태를 나타내기 위해 정의
sealed class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLoading,
    @Default('') String accessToken,
    @Default('') String refreshToken,
    @Default(false) bool isCompletedOnboarding,
  }) = _LoginState;
}