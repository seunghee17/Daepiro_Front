import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/model/response/information/behavior_list_response.dart';
part 'behavior_tips_state.freezed.dart';

@freezed
sealed class BehaviorTipsState with _$BehaviorTipsState {
  factory BehaviorTipsState({
    @Default(false) bool isLoading,
    @Default([]) List<Behavior> emergencyBehaviorList,
    @Default([]) List<Behavior> commonBehaviorList,

  }) = _BehaviorTipsState;
}
