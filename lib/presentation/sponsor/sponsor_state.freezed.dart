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
  List<Comment> get cheerCommentList =>
      throw _privateConstructorUsedError; // 응원 메세지 목록
  List<String> get scrollCommentList1 =>
      throw _privateConstructorUsedError; // 배너 응원메시지 1
  List<String> get scrollCommentList2 =>
      throw _privateConstructorUsedError; // 배너 응원메시지 2
  String get reportType => throw _privateConstructorUsedError;
  List<String> get reportDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
      List<Comment> cheerCommentList,
      List<String> scrollCommentList1,
      List<String> scrollCommentList2,
      String reportType,
      List<String> reportDescription});
}

/// @nodoc
class _$SponsorStateCopyWithImpl<$Res, $Val extends SponsorState>
    implements $SponsorStateCopyWith<$Res> {
  _$SponsorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? sponsorList = null,
    Object? cheerCommentList = null,
    Object? scrollCommentList1 = null,
    Object? scrollCommentList2 = null,
    Object? reportType = null,
    Object? reportDescription = null,
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
      scrollCommentList1: null == scrollCommentList1
          ? _value.scrollCommentList1
          : scrollCommentList1 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scrollCommentList2: null == scrollCommentList2
          ? _value.scrollCommentList2
          : scrollCommentList2 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reportType: null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String,
      reportDescription: null == reportDescription
          ? _value.reportDescription
          : reportDescription // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      List<Comment> cheerCommentList,
      List<String> scrollCommentList1,
      List<String> scrollCommentList2,
      String reportType,
      List<String> reportDescription});
}

/// @nodoc
class __$$SponsorStateImplCopyWithImpl<$Res>
    extends _$SponsorStateCopyWithImpl<$Res, _$SponsorStateImpl>
    implements _$$SponsorStateImplCopyWith<$Res> {
  __$$SponsorStateImplCopyWithImpl(
      _$SponsorStateImpl _value, $Res Function(_$SponsorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? sponsorList = null,
    Object? cheerCommentList = null,
    Object? scrollCommentList1 = null,
    Object? scrollCommentList2 = null,
    Object? reportType = null,
    Object? reportDescription = null,
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
      scrollCommentList1: null == scrollCommentList1
          ? _value._scrollCommentList1
          : scrollCommentList1 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scrollCommentList2: null == scrollCommentList2
          ? _value._scrollCommentList2
          : scrollCommentList2 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reportType: null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String,
      reportDescription: null == reportDescription
          ? _value._reportDescription
          : reportDescription // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SponsorStateImpl implements _SponsorState {
  _$SponsorStateImpl(
      {this.isLoading = true,
      final List<Sponsor> sponsorList = const [],
      final List<Comment> cheerCommentList = const [],
      final List<String> scrollCommentList1 = const [],
      final List<String> scrollCommentList2 = const [],
      this.reportType = '',
      final List<String> reportDescription = const [
        '허위사실 유포',
        '욕설 및 비방',
        '상업적 광고 및 판매',
        '음란물 및 불건전한 내용',
        '기타'
      ]})
      : _sponsorList = sponsorList,
        _cheerCommentList = cheerCommentList,
        _scrollCommentList1 = scrollCommentList1,
        _scrollCommentList2 = scrollCommentList2,
        _reportDescription = reportDescription;

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

// 응원 메세지 목록
  final List<String> _scrollCommentList1;
// 응원 메세지 목록
  @override
  @JsonKey()
  List<String> get scrollCommentList1 {
    if (_scrollCommentList1 is EqualUnmodifiableListView)
      return _scrollCommentList1;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scrollCommentList1);
  }

// 배너 응원메시지 1
  final List<String> _scrollCommentList2;
// 배너 응원메시지 1
  @override
  @JsonKey()
  List<String> get scrollCommentList2 {
    if (_scrollCommentList2 is EqualUnmodifiableListView)
      return _scrollCommentList2;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scrollCommentList2);
  }

// 배너 응원메시지 2
  @override
  @JsonKey()
  final String reportType;
  final List<String> _reportDescription;
  @override
  @JsonKey()
  List<String> get reportDescription {
    if (_reportDescription is EqualUnmodifiableListView)
      return _reportDescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reportDescription);
  }

  @override
  String toString() {
    return 'SponsorState(isLoading: $isLoading, sponsorList: $sponsorList, cheerCommentList: $cheerCommentList, scrollCommentList1: $scrollCommentList1, scrollCommentList2: $scrollCommentList2, reportType: $reportType, reportDescription: $reportDescription)';
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
                .equals(other._cheerCommentList, _cheerCommentList) &&
            const DeepCollectionEquality()
                .equals(other._scrollCommentList1, _scrollCommentList1) &&
            const DeepCollectionEquality()
                .equals(other._scrollCommentList2, _scrollCommentList2) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            const DeepCollectionEquality()
                .equals(other._reportDescription, _reportDescription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_sponsorList),
      const DeepCollectionEquality().hash(_cheerCommentList),
      const DeepCollectionEquality().hash(_scrollCommentList1),
      const DeepCollectionEquality().hash(_scrollCommentList2),
      reportType,
      const DeepCollectionEquality().hash(_reportDescription));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SponsorStateImplCopyWith<_$SponsorStateImpl> get copyWith =>
      __$$SponsorStateImplCopyWithImpl<_$SponsorStateImpl>(this, _$identity);
}

abstract class _SponsorState implements SponsorState {
  factory _SponsorState(
      {final bool isLoading,
      final List<Sponsor> sponsorList,
      final List<Comment> cheerCommentList,
      final List<String> scrollCommentList1,
      final List<String> scrollCommentList2,
      final String reportType,
      final List<String> reportDescription}) = _$SponsorStateImpl;

  @override
  bool get isLoading;
  @override
  List<Sponsor> get sponsorList;
  @override // 후원 리스트
  List<Comment> get cheerCommentList;
  @override // 응원 메세지 목록
  List<String> get scrollCommentList1;
  @override // 배너 응원메시지 1
  List<String> get scrollCommentList2;
  @override // 배너 응원메시지 2
  String get reportType;
  @override
  List<String> get reportDescription;
  @override
  @JsonKey(ignore: true)
  _$$SponsorStateImplCopyWith<_$SponsorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
