// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommunityState {
  bool get receiveButton => throw _privateConstructorUsedError;
  bool get AllButton => throw _privateConstructorUsedError;
  bool get isCertificateUser => throw _privateConstructorUsedError;
  bool get isDeleteComplete => throw _privateConstructorUsedError;
  String? get reportType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommunityStateCopyWith<CommunityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityStateCopyWith<$Res> {
  factory $CommunityStateCopyWith(
          CommunityState value, $Res Function(CommunityState) then) =
      _$CommunityStateCopyWithImpl<$Res, CommunityState>;
  @useResult
  $Res call(
      {bool receiveButton,
      bool AllButton,
      bool isCertificateUser,
      bool isDeleteComplete,
      String? reportType});
}

/// @nodoc
class _$CommunityStateCopyWithImpl<$Res, $Val extends CommunityState>
    implements $CommunityStateCopyWith<$Res> {
  _$CommunityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiveButton = null,
    Object? AllButton = null,
    Object? isCertificateUser = null,
    Object? isDeleteComplete = null,
    Object? reportType = freezed,
  }) {
    return _then(_value.copyWith(
      receiveButton: null == receiveButton
          ? _value.receiveButton
          : receiveButton // ignore: cast_nullable_to_non_nullable
              as bool,
      AllButton: null == AllButton
          ? _value.AllButton
          : AllButton // ignore: cast_nullable_to_non_nullable
              as bool,
      isCertificateUser: null == isCertificateUser
          ? _value.isCertificateUser
          : isCertificateUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteComplete: null == isDeleteComplete
          ? _value.isDeleteComplete
          : isDeleteComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      reportType: freezed == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityStateImplCopyWith<$Res>
    implements $CommunityStateCopyWith<$Res> {
  factory _$$CommunityStateImplCopyWith(_$CommunityStateImpl value,
          $Res Function(_$CommunityStateImpl) then) =
      __$$CommunityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool receiveButton,
      bool AllButton,
      bool isCertificateUser,
      bool isDeleteComplete,
      String? reportType});
}

/// @nodoc
class __$$CommunityStateImplCopyWithImpl<$Res>
    extends _$CommunityStateCopyWithImpl<$Res, _$CommunityStateImpl>
    implements _$$CommunityStateImplCopyWith<$Res> {
  __$$CommunityStateImplCopyWithImpl(
      _$CommunityStateImpl _value, $Res Function(_$CommunityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiveButton = null,
    Object? AllButton = null,
    Object? isCertificateUser = null,
    Object? isDeleteComplete = null,
    Object? reportType = freezed,
  }) {
    return _then(_$CommunityStateImpl(
      receiveButton: null == receiveButton
          ? _value.receiveButton
          : receiveButton // ignore: cast_nullable_to_non_nullable
              as bool,
      AllButton: null == AllButton
          ? _value.AllButton
          : AllButton // ignore: cast_nullable_to_non_nullable
              as bool,
      isCertificateUser: null == isCertificateUser
          ? _value.isCertificateUser
          : isCertificateUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteComplete: null == isDeleteComplete
          ? _value.isDeleteComplete
          : isDeleteComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      reportType: freezed == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CommunityStateImpl implements _CommunityState {
  _$CommunityStateImpl(
      {this.receiveButton = true,
      this.AllButton = false,
      this.isCertificateUser = false,
      this.isDeleteComplete = false,
      this.reportType = null});

  @override
  @JsonKey()
  final bool receiveButton;
  @override
  @JsonKey()
  final bool AllButton;
  @override
  @JsonKey()
  final bool isCertificateUser;
  @override
  @JsonKey()
  final bool isDeleteComplete;
  @override
  @JsonKey()
  final String? reportType;

  @override
  String toString() {
    return 'CommunityState(receiveButton: $receiveButton, AllButton: $AllButton, isCertificateUser: $isCertificateUser, isDeleteComplete: $isDeleteComplete, reportType: $reportType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityStateImpl &&
            (identical(other.receiveButton, receiveButton) ||
                other.receiveButton == receiveButton) &&
            (identical(other.AllButton, AllButton) ||
                other.AllButton == AllButton) &&
            (identical(other.isCertificateUser, isCertificateUser) ||
                other.isCertificateUser == isCertificateUser) &&
            (identical(other.isDeleteComplete, isDeleteComplete) ||
                other.isDeleteComplete == isDeleteComplete) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, receiveButton, AllButton,
      isCertificateUser, isDeleteComplete, reportType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityStateImplCopyWith<_$CommunityStateImpl> get copyWith =>
      __$$CommunityStateImplCopyWithImpl<_$CommunityStateImpl>(
          this, _$identity);
}

abstract class _CommunityState implements CommunityState {
  factory _CommunityState(
      {final bool receiveButton,
      final bool AllButton,
      final bool isCertificateUser,
      final bool isDeleteComplete,
      final String? reportType}) = _$CommunityStateImpl;

  @override
  bool get receiveButton;
  @override
  bool get AllButton;
  @override
  bool get isCertificateUser;
  @override
  bool get isDeleteComplete;
  @override
  String? get reportType;
  @override
  @JsonKey(ignore: true)
  _$$CommunityStateImplCopyWith<_$CommunityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
