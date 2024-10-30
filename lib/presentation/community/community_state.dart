import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_state.freezed.dart';

@freezed
sealed class CommunityState with _$CommunityState {
  factory CommunityState({
    @Default(true) bool receiveButton,
    @Default(false) bool AllButton,
}) = _CommunityState;
}