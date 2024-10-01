import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/response/jusolist_response.dart';
part 'onboarding_state.freezed.dart';
@freezed
sealed class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    @Default('NONE') String nameState,
    @Default('NONE') String nicknameState,
    @Default([]) List<Juso> jusoListState
}) = _OnboardingState;
}