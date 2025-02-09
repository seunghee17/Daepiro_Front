// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disaster_contents_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DisasterContentsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Contents> get contentsList => throw _privateConstructorUsedError;

  /// Create a copy of DisasterContentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisasterContentsStateCopyWith<DisasterContentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisasterContentsStateCopyWith<$Res> {
  factory $DisasterContentsStateCopyWith(DisasterContentsState value,
          $Res Function(DisasterContentsState) then) =
      _$DisasterContentsStateCopyWithImpl<$Res, DisasterContentsState>;
  @useResult
  $Res call({bool isLoading, List<Contents> contentsList});
}

/// @nodoc
class _$DisasterContentsStateCopyWithImpl<$Res,
        $Val extends DisasterContentsState>
    implements $DisasterContentsStateCopyWith<$Res> {
  _$DisasterContentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisasterContentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? contentsList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      contentsList: null == contentsList
          ? _value.contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisasterContentsStateImplCopyWith<$Res>
    implements $DisasterContentsStateCopyWith<$Res> {
  factory _$$DisasterContentsStateImplCopyWith(
          _$DisasterContentsStateImpl value,
          $Res Function(_$DisasterContentsStateImpl) then) =
      __$$DisasterContentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Contents> contentsList});
}

/// @nodoc
class __$$DisasterContentsStateImplCopyWithImpl<$Res>
    extends _$DisasterContentsStateCopyWithImpl<$Res,
        _$DisasterContentsStateImpl>
    implements _$$DisasterContentsStateImplCopyWith<$Res> {
  __$$DisasterContentsStateImplCopyWithImpl(_$DisasterContentsStateImpl _value,
      $Res Function(_$DisasterContentsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisasterContentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? contentsList = null,
  }) {
    return _then(_$DisasterContentsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      contentsList: null == contentsList
          ? _value._contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
    ));
  }
}

/// @nodoc

class _$DisasterContentsStateImpl implements _DisasterContentsState {
  _$DisasterContentsStateImpl(
      {this.isLoading = false, final List<Contents> contentsList = const []})
      : _contentsList = contentsList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Contents> _contentsList;
  @override
  @JsonKey()
  List<Contents> get contentsList {
    if (_contentsList is EqualUnmodifiableListView) return _contentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentsList);
  }

  @override
  String toString() {
    return 'DisasterContentsState(isLoading: $isLoading, contentsList: $contentsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisasterContentsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._contentsList, _contentsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_contentsList));

  /// Create a copy of DisasterContentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisasterContentsStateImplCopyWith<_$DisasterContentsStateImpl>
      get copyWith => __$$DisasterContentsStateImplCopyWithImpl<
          _$DisasterContentsStateImpl>(this, _$identity);
}

abstract class _DisasterContentsState implements DisasterContentsState {
  factory _DisasterContentsState(
      {final bool isLoading,
      final List<Contents> contentsList}) = _$DisasterContentsStateImpl;

  @override
  bool get isLoading;
  @override
  List<Contents> get contentsList;

  /// Create a copy of DisasterContentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisasterContentsStateImplCopyWith<_$DisasterContentsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
