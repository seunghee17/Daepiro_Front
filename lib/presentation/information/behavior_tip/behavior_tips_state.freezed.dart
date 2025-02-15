// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'behavior_tips_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BehaviorTipsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Behavior> get emergencyBehaviorList =>
      throw _privateConstructorUsedError;
  List<Behavior> get commonBehaviorList => throw _privateConstructorUsedError;

  /// Create a copy of BehaviorTipsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BehaviorTipsStateCopyWith<BehaviorTipsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BehaviorTipsStateCopyWith<$Res> {
  factory $BehaviorTipsStateCopyWith(
          BehaviorTipsState value, $Res Function(BehaviorTipsState) then) =
      _$BehaviorTipsStateCopyWithImpl<$Res, BehaviorTipsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Behavior> emergencyBehaviorList,
      List<Behavior> commonBehaviorList});
}

/// @nodoc
class _$BehaviorTipsStateCopyWithImpl<$Res, $Val extends BehaviorTipsState>
    implements $BehaviorTipsStateCopyWith<$Res> {
  _$BehaviorTipsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BehaviorTipsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? emergencyBehaviorList = null,
    Object? commonBehaviorList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      emergencyBehaviorList: null == emergencyBehaviorList
          ? _value.emergencyBehaviorList
          : emergencyBehaviorList // ignore: cast_nullable_to_non_nullable
              as List<Behavior>,
      commonBehaviorList: null == commonBehaviorList
          ? _value.commonBehaviorList
          : commonBehaviorList // ignore: cast_nullable_to_non_nullable
              as List<Behavior>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BehaviorTipsStateImplCopyWith<$Res>
    implements $BehaviorTipsStateCopyWith<$Res> {
  factory _$$BehaviorTipsStateImplCopyWith(_$BehaviorTipsStateImpl value,
          $Res Function(_$BehaviorTipsStateImpl) then) =
      __$$BehaviorTipsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Behavior> emergencyBehaviorList,
      List<Behavior> commonBehaviorList});
}

/// @nodoc
class __$$BehaviorTipsStateImplCopyWithImpl<$Res>
    extends _$BehaviorTipsStateCopyWithImpl<$Res, _$BehaviorTipsStateImpl>
    implements _$$BehaviorTipsStateImplCopyWith<$Res> {
  __$$BehaviorTipsStateImplCopyWithImpl(_$BehaviorTipsStateImpl _value,
      $Res Function(_$BehaviorTipsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BehaviorTipsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? emergencyBehaviorList = null,
    Object? commonBehaviorList = null,
  }) {
    return _then(_$BehaviorTipsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      emergencyBehaviorList: null == emergencyBehaviorList
          ? _value._emergencyBehaviorList
          : emergencyBehaviorList // ignore: cast_nullable_to_non_nullable
              as List<Behavior>,
      commonBehaviorList: null == commonBehaviorList
          ? _value._commonBehaviorList
          : commonBehaviorList // ignore: cast_nullable_to_non_nullable
              as List<Behavior>,
    ));
  }
}

/// @nodoc

class _$BehaviorTipsStateImpl implements _BehaviorTipsState {
  _$BehaviorTipsStateImpl(
      {this.isLoading = false,
      final List<Behavior> emergencyBehaviorList = const [],
      final List<Behavior> commonBehaviorList = const []})
      : _emergencyBehaviorList = emergencyBehaviorList,
        _commonBehaviorList = commonBehaviorList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Behavior> _emergencyBehaviorList;
  @override
  @JsonKey()
  List<Behavior> get emergencyBehaviorList {
    if (_emergencyBehaviorList is EqualUnmodifiableListView)
      return _emergencyBehaviorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emergencyBehaviorList);
  }

  final List<Behavior> _commonBehaviorList;
  @override
  @JsonKey()
  List<Behavior> get commonBehaviorList {
    if (_commonBehaviorList is EqualUnmodifiableListView)
      return _commonBehaviorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonBehaviorList);
  }

  @override
  String toString() {
    return 'BehaviorTipsState(isLoading: $isLoading, emergencyBehaviorList: $emergencyBehaviorList, commonBehaviorList: $commonBehaviorList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BehaviorTipsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._emergencyBehaviorList, _emergencyBehaviorList) &&
            const DeepCollectionEquality()
                .equals(other._commonBehaviorList, _commonBehaviorList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_emergencyBehaviorList),
      const DeepCollectionEquality().hash(_commonBehaviorList));

  /// Create a copy of BehaviorTipsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BehaviorTipsStateImplCopyWith<_$BehaviorTipsStateImpl> get copyWith =>
      __$$BehaviorTipsStateImplCopyWithImpl<_$BehaviorTipsStateImpl>(
          this, _$identity);
}

abstract class _BehaviorTipsState implements BehaviorTipsState {
  factory _BehaviorTipsState(
      {final bool isLoading,
      final List<Behavior> emergencyBehaviorList,
      final List<Behavior> commonBehaviorList}) = _$BehaviorTipsStateImpl;

  @override
  bool get isLoading;
  @override
  List<Behavior> get emergencyBehaviorList;
  @override
  List<Behavior> get commonBehaviorList;

  /// Create a copy of BehaviorTipsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BehaviorTipsStateImplCopyWith<_$BehaviorTipsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
