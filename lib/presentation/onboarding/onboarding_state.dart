import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_state.freezed.dart';
@freezed
sealed class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    @Default('NONE') String nameState,
    @Default('NONE') String nicknameState
}) = _OnboardingState;
}