import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_state.freezed.dart';

@freezed
sealed class PermissionState with _$PermissionState {
  factory PermissionState({
    //권한 모두 동의 활성화 상태
    @Default(false) bool isAllPermissionGrant,
    //체크박스의 활성화상태
    @Default([false, false, false, false]) List<bool> isPermissionCheckboxState,
}) = _PermissionState;
}