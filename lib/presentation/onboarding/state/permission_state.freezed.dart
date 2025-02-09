// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PermissionState {
//권한 모두 동의 활성화 상태
  bool get isAllPermissionGrant =>
      throw _privateConstructorUsedError; //체크박스의 활성화상태
  List<bool> get isPermissionCheckboxState =>
      throw _privateConstructorUsedError;
  bool get isModalShowing => throw _privateConstructorUsedError;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionStateCopyWith<PermissionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionStateCopyWith<$Res> {
  factory $PermissionStateCopyWith(
          PermissionState value, $Res Function(PermissionState) then) =
      _$PermissionStateCopyWithImpl<$Res, PermissionState>;
  @useResult
  $Res call(
      {bool isAllPermissionGrant,
      List<bool> isPermissionCheckboxState,
      bool isModalShowing});
}

/// @nodoc
class _$PermissionStateCopyWithImpl<$Res, $Val extends PermissionState>
    implements $PermissionStateCopyWith<$Res> {
  _$PermissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAllPermissionGrant = null,
    Object? isPermissionCheckboxState = null,
    Object? isModalShowing = null,
  }) {
    return _then(_value.copyWith(
      isAllPermissionGrant: null == isAllPermissionGrant
          ? _value.isAllPermissionGrant
          : isAllPermissionGrant // ignore: cast_nullable_to_non_nullable
              as bool,
      isPermissionCheckboxState: null == isPermissionCheckboxState
          ? _value.isPermissionCheckboxState
          : isPermissionCheckboxState // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isModalShowing: null == isModalShowing
          ? _value.isModalShowing
          : isModalShowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionStateImplCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$$PermissionStateImplCopyWith(_$PermissionStateImpl value,
          $Res Function(_$PermissionStateImpl) then) =
      __$$PermissionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAllPermissionGrant,
      List<bool> isPermissionCheckboxState,
      bool isModalShowing});
}

/// @nodoc
class __$$PermissionStateImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$PermissionStateImpl>
    implements _$$PermissionStateImplCopyWith<$Res> {
  __$$PermissionStateImplCopyWithImpl(
      _$PermissionStateImpl _value, $Res Function(_$PermissionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAllPermissionGrant = null,
    Object? isPermissionCheckboxState = null,
    Object? isModalShowing = null,
  }) {
    return _then(_$PermissionStateImpl(
      isAllPermissionGrant: null == isAllPermissionGrant
          ? _value.isAllPermissionGrant
          : isAllPermissionGrant // ignore: cast_nullable_to_non_nullable
              as bool,
      isPermissionCheckboxState: null == isPermissionCheckboxState
          ? _value._isPermissionCheckboxState
          : isPermissionCheckboxState // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isModalShowing: null == isModalShowing
          ? _value.isModalShowing
          : isModalShowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PermissionStateImpl implements _PermissionState {
  _$PermissionStateImpl(
      {this.isAllPermissionGrant = false,
      final List<bool> isPermissionCheckboxState = const [
        false,
        false,
        false,
        false
      ],
      this.isModalShowing = false})
      : _isPermissionCheckboxState = isPermissionCheckboxState;

//권한 모두 동의 활성화 상태
  @override
  @JsonKey()
  final bool isAllPermissionGrant;
//체크박스의 활성화상태
  final List<bool> _isPermissionCheckboxState;
//체크박스의 활성화상태
  @override
  @JsonKey()
  List<bool> get isPermissionCheckboxState {
    if (_isPermissionCheckboxState is EqualUnmodifiableListView)
      return _isPermissionCheckboxState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isPermissionCheckboxState);
  }

  @override
  @JsonKey()
  final bool isModalShowing;

  @override
  String toString() {
    return 'PermissionState(isAllPermissionGrant: $isAllPermissionGrant, isPermissionCheckboxState: $isPermissionCheckboxState, isModalShowing: $isModalShowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionStateImpl &&
            (identical(other.isAllPermissionGrant, isAllPermissionGrant) ||
                other.isAllPermissionGrant == isAllPermissionGrant) &&
            const DeepCollectionEquality().equals(
                other._isPermissionCheckboxState, _isPermissionCheckboxState) &&
            (identical(other.isModalShowing, isModalShowing) ||
                other.isModalShowing == isModalShowing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAllPermissionGrant,
      const DeepCollectionEquality().hash(_isPermissionCheckboxState),
      isModalShowing);

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionStateImplCopyWith<_$PermissionStateImpl> get copyWith =>
      __$$PermissionStateImplCopyWithImpl<_$PermissionStateImpl>(
          this, _$identity);
}

abstract class _PermissionState implements PermissionState {
  factory _PermissionState(
      {final bool isAllPermissionGrant,
      final List<bool> isPermissionCheckboxState,
      final bool isModalShowing}) = _$PermissionStateImpl;

//권한 모두 동의 활성화 상태
  @override
  bool get isAllPermissionGrant; //체크박스의 활성화상태
  @override
  List<bool> get isPermissionCheckboxState;
  @override
  bool get isModalShowing;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionStateImplCopyWith<_$PermissionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
