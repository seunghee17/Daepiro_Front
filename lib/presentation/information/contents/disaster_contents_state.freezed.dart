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
  List<Contents> get contentsList =>
      throw _privateConstructorUsedError; // 재난콘텐츠 목록
  String get nextCursor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DisasterContentsStateCopyWith<DisasterContentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisasterContentsStateCopyWith<$Res> {
  factory $DisasterContentsStateCopyWith(DisasterContentsState value,
          $Res Function(DisasterContentsState) then) =
      _$DisasterContentsStateCopyWithImpl<$Res, DisasterContentsState>;
  @useResult
  $Res call({bool isLoading, List<Contents> contentsList, String nextCursor});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? contentsList = null,
    Object? nextCursor = null,
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
      nextCursor: null == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({bool isLoading, List<Contents> contentsList, String nextCursor});
}

/// @nodoc
class __$$DisasterContentsStateImplCopyWithImpl<$Res>
    extends _$DisasterContentsStateCopyWithImpl<$Res,
        _$DisasterContentsStateImpl>
    implements _$$DisasterContentsStateImplCopyWith<$Res> {
  __$$DisasterContentsStateImplCopyWithImpl(_$DisasterContentsStateImpl _value,
      $Res Function(_$DisasterContentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? contentsList = null,
    Object? nextCursor = null,
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
      nextCursor: null == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DisasterContentsStateImpl implements _DisasterContentsState {
  _$DisasterContentsStateImpl(
      {this.isLoading = true,
      final List<Contents> contentsList = const [],
      this.nextCursor = ""})
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

// 재난콘텐츠 목록
  @override
  @JsonKey()
  final String nextCursor;

  @override
  String toString() {
    return 'DisasterContentsState(isLoading: $isLoading, contentsList: $contentsList, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisasterContentsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._contentsList, _contentsList) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_contentsList), nextCursor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisasterContentsStateImplCopyWith<_$DisasterContentsStateImpl>
      get copyWith => __$$DisasterContentsStateImplCopyWithImpl<
          _$DisasterContentsStateImpl>(this, _$identity);
}

abstract class _DisasterContentsState implements DisasterContentsState {
  factory _DisasterContentsState(
      {final bool isLoading,
      final List<Contents> contentsList,
      final String nextCursor}) = _$DisasterContentsStateImpl;

  @override
  bool get isLoading;
  @override
  List<Contents> get contentsList;
  @override // 재난콘텐츠 목록
  String get nextCursor;
  @override
  @JsonKey(ignore: true)
  _$$DisasterContentsStateImplCopyWith<_$DisasterContentsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
