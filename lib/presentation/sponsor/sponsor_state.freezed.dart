// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SponsorState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Sponsor> get sponsorList => throw _privateConstructorUsedError; // 후원 리스트
  List<Comment> get cheerCommentList => throw _privateConstructorUsedError;

  /// Create a copy of SponsorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SponsorStateCopyWith<SponsorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SponsorStateCopyWith<$Res> {
  factory $SponsorStateCopyWith(
          SponsorState value, $Res Function(SponsorState) then) =
      _$SponsorStateCopyWithImpl<$Res, SponsorState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Sponsor> sponsorList,
      List<Comment> cheerCommentList});
}

/// @nodoc
class _$SponsorStateCopyWithImpl<$Res, $Val extends SponsorState>
    implements $SponsorStateCopyWith<$Res> {
  _$SponsorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SponsorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? sponsorList = null,
    Object? cheerCommentList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      sponsorList: null == sponsorList
          ? _value.sponsorList
          : sponsorList // ignore: cast_nullable_to_non_nullable
              as List<Sponsor>,
      cheerCommentList: null == cheerCommentList
          ? _value.cheerCommentList
          : cheerCommentList // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SponsorStateImplCopyWith<$Res>
    implements $SponsorStateCopyWith<$Res> {
  factory _$$SponsorStateImplCopyWith(
          _$SponsorStateImpl value, $Res Function(_$SponsorStateImpl) then) =
      __$$SponsorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Sponsor> sponsorList,
      List<Comment> cheerCommentList});
}

/// @nodoc
class __$$SponsorStateImplCopyWithImpl<$Res>
    extends _$SponsorStateCopyWithImpl<$Res, _$SponsorStateImpl>
    implements _$$SponsorStateImplCopyWith<$Res> {
  __$$SponsorStateImplCopyWithImpl(
      _$SponsorStateImpl _value, $Res Function(_$SponsorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SponsorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? sponsorList = null,
    Object? cheerCommentList = null,
  }) {
    return _then(_$SponsorStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      sponsorList: null == sponsorList
          ? _value._sponsorList
          : sponsorList // ignore: cast_nullable_to_non_nullable
              as List<Sponsor>,
      cheerCommentList: null == cheerCommentList
          ? _value._cheerCommentList
          : cheerCommentList // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

/// @nodoc

class _$SponsorStateImpl implements _SponsorState {
  _$SponsorStateImpl(
      {this.isLoading = false,
      final List<Sponsor> sponsorList = const [],
      final List<Comment> cheerCommentList = const []})
      : _sponsorList = sponsorList,
        _cheerCommentList = cheerCommentList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Sponsor> _sponsorList;
  @override
  @JsonKey()
  List<Sponsor> get sponsorList {
    if (_sponsorList is EqualUnmodifiableListView) return _sponsorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sponsorList);
  }

// 후원 리스트
  final List<Comment> _cheerCommentList;
// 후원 리스트
  @override
  @JsonKey()
  List<Comment> get cheerCommentList {
    if (_cheerCommentList is EqualUnmodifiableListView)
      return _cheerCommentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cheerCommentList);
  }

  @override
  String toString() {
    return 'SponsorState(isLoading: $isLoading, sponsorList: $sponsorList, cheerCommentList: $cheerCommentList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SponsorStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._sponsorList, _sponsorList) &&
            const DeepCollectionEquality()
                .equals(other._cheerCommentList, _cheerCommentList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_sponsorList),
      const DeepCollectionEquality().hash(_cheerCommentList));

  /// Create a copy of SponsorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SponsorStateImplCopyWith<_$SponsorStateImpl> get copyWith =>
      __$$SponsorStateImplCopyWithImpl<_$SponsorStateImpl>(this, _$identity);
}

abstract class _SponsorState implements SponsorState {
  factory _SponsorState(
      {final bool isLoading,
      final List<Sponsor> sponsorList,
      final List<Comment> cheerCommentList}) = _$SponsorStateImpl;

  @override
  bool get isLoading;
  @override
  List<Sponsor> get sponsorList; // 후원 리스트
  @override
  List<Comment> get cheerCommentList;

  /// Create a copy of SponsorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SponsorStateImplCopyWith<_$SponsorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
