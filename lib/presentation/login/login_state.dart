import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';
@freezed
//로그인 과정의 상태를 나타내기 위해 정의
sealed class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isCompletedOnboarding,
    @Default(false) bool isLoginSuccess,
  }) = _LoginState;
}