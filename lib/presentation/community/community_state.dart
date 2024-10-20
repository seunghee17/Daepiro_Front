import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_state.freezed.dart';

@freezed
sealed class CommunityState with _$CommunityState {
  factory CommunityState({
    @Default(false) bool isError,
}) = _CommunityState;
}