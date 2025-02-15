// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_disaster_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommunityDisasterState {
//---------------------------------------------------------
// 재난상황
//---------------------------------------------------------
//현재 보여지는 상태
  bool get isDisasterScreen => throw _privateConstructorUsedError;
  int? get selectSituaionId =>
      throw _privateConstructorUsedError; //대댓글 작성시 필요한 부모 댓글 id
  int get parentCommentId =>
      throw _privateConstructorUsedError; //대댓글을 선택한지에 대한 여부
  dynamic get isChildCommentState =>
      throw _privateConstructorUsedError; //moreinfo를 누를때부터 true로 활성화됨
  int get editChildCommentId => throw _privateConstructorUsedError; //2
  bool get isEditChildCommentState => throw _privateConstructorUsedError; //1
//댓글 수정을 위한 상태 데이터
  bool get isEditState => throw _privateConstructorUsedError;
  int get editCommentId => throw _privateConstructorUsedError; //커뮤니티 유형별 데이터 상태
  List<Disaster> get allDisasterResponse => throw _privateConstructorUsedError;
  List<Disaster> get receivedDisasterResponse =>
      throw _privateConstructorUsedError; //재난상황 로드 상태
  bool get isLoading => throw _privateConstructorUsedError; //재난상황 댓글 로드 상태
  bool get isReplyLoading => throw _privateConstructorUsedError; //재난상황 커뮤니티 타입
  String get disasterCommunityType =>
      throw _privateConstructorUsedError; //재난상황 댓글 상태
  List<Reply> get disasterReplyList =>
      throw _privateConstructorUsedError; //신고 유형1
  String get reportType => throw _privateConstructorUsedError;
  List<String> get reportDescription => throw _privateConstructorUsedError;

  /// Create a copy of CommunityDisasterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityDisasterStateCopyWith<CommunityDisasterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityDisasterStateCopyWith<$Res> {
  factory $CommunityDisasterStateCopyWith(CommunityDisasterState value,
          $Res Function(CommunityDisasterState) then) =
      _$CommunityDisasterStateCopyWithImpl<$Res, CommunityDisasterState>;
  @useResult
  $Res call(
      {bool isDisasterScreen,
      int? selectSituaionId,
      int parentCommentId,
      dynamic isChildCommentState,
      int editChildCommentId,
      bool isEditChildCommentState,
      bool isEditState,
      int editCommentId,
      List<Disaster> allDisasterResponse,
      List<Disaster> receivedDisasterResponse,
      bool isLoading,
      bool isReplyLoading,
      String disasterCommunityType,
      List<Reply> disasterReplyList,
      String reportType,
      List<String> reportDescription});
}

/// @nodoc
class _$CommunityDisasterStateCopyWithImpl<$Res,
        $Val extends CommunityDisasterState>
    implements $CommunityDisasterStateCopyWith<$Res> {
  _$CommunityDisasterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityDisasterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDisasterScreen = null,
    Object? selectSituaionId = freezed,
    Object? parentCommentId = null,
    Object? isChildCommentState = freezed,
    Object? editChildCommentId = null,
    Object? isEditChildCommentState = null,
    Object? isEditState = null,
    Object? editCommentId = null,
    Object? allDisasterResponse = null,
    Object? receivedDisasterResponse = null,
    Object? isLoading = null,
    Object? isReplyLoading = null,
    Object? disasterCommunityType = null,
    Object? disasterReplyList = null,
    Object? reportType = null,
    Object? reportDescription = null,
  }) {
    return _then(_value.copyWith(
      isDisasterScreen: null == isDisasterScreen
          ? _value.isDisasterScreen
          : isDisasterScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      selectSituaionId: freezed == selectSituaionId
          ? _value.selectSituaionId
          : selectSituaionId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentCommentId: null == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      isChildCommentState: freezed == isChildCommentState
          ? _value.isChildCommentState
          : isChildCommentState // ignore: cast_nullable_to_non_nullable
              as dynamic,
      editChildCommentId: null == editChildCommentId
          ? _value.editChildCommentId
          : editChildCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      isEditChildCommentState: null == isEditChildCommentState
          ? _value.isEditChildCommentState
          : isEditChildCommentState // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditState: null == isEditState
          ? _value.isEditState
          : isEditState // ignore: cast_nullable_to_non_nullable
              as bool,
      editCommentId: null == editCommentId
          ? _value.editCommentId
          : editCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      allDisasterResponse: null == allDisasterResponse
          ? _value.allDisasterResponse
          : allDisasterResponse // ignore: cast_nullable_to_non_nullable
              as List<Disaster>,
      receivedDisasterResponse: null == receivedDisasterResponse
          ? _value.receivedDisasterResponse
          : receivedDisasterResponse // ignore: cast_nullable_to_non_nullable
              as List<Disaster>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReplyLoading: null == isReplyLoading
          ? _value.isReplyLoading
          : isReplyLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      disasterCommunityType: null == disasterCommunityType
          ? _value.disasterCommunityType
          : disasterCommunityType // ignore: cast_nullable_to_non_nullable
              as String,
      disasterReplyList: null == disasterReplyList
          ? _value.disasterReplyList
          : disasterReplyList // ignore: cast_nullable_to_non_nullable
              as List<Reply>,
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
abstract class _$$CommunityDisasterStateImplCopyWith<$Res>
    implements $CommunityDisasterStateCopyWith<$Res> {
  factory _$$CommunityDisasterStateImplCopyWith(
          _$CommunityDisasterStateImpl value,
          $Res Function(_$CommunityDisasterStateImpl) then) =
      __$$CommunityDisasterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isDisasterScreen,
      int? selectSituaionId,
      int parentCommentId,
      dynamic isChildCommentState,
      int editChildCommentId,
      bool isEditChildCommentState,
      bool isEditState,
      int editCommentId,
      List<Disaster> allDisasterResponse,
      List<Disaster> receivedDisasterResponse,
      bool isLoading,
      bool isReplyLoading,
      String disasterCommunityType,
      List<Reply> disasterReplyList,
      String reportType,
      List<String> reportDescription});
}

/// @nodoc
class __$$CommunityDisasterStateImplCopyWithImpl<$Res>
    extends _$CommunityDisasterStateCopyWithImpl<$Res,
        _$CommunityDisasterStateImpl>
    implements _$$CommunityDisasterStateImplCopyWith<$Res> {
  __$$CommunityDisasterStateImplCopyWithImpl(
      _$CommunityDisasterStateImpl _value,
      $Res Function(_$CommunityDisasterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityDisasterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDisasterScreen = null,
    Object? selectSituaionId = freezed,
    Object? parentCommentId = null,
    Object? isChildCommentState = freezed,
    Object? editChildCommentId = null,
    Object? isEditChildCommentState = null,
    Object? isEditState = null,
    Object? editCommentId = null,
    Object? allDisasterResponse = null,
    Object? receivedDisasterResponse = null,
    Object? isLoading = null,
    Object? isReplyLoading = null,
    Object? disasterCommunityType = null,
    Object? disasterReplyList = null,
    Object? reportType = null,
    Object? reportDescription = null,
  }) {
    return _then(_$CommunityDisasterStateImpl(
      isDisasterScreen: null == isDisasterScreen
          ? _value.isDisasterScreen
          : isDisasterScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      selectSituaionId: freezed == selectSituaionId
          ? _value.selectSituaionId
          : selectSituaionId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentCommentId: null == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      isChildCommentState: freezed == isChildCommentState
          ? _value.isChildCommentState!
          : isChildCommentState,
      editChildCommentId: null == editChildCommentId
          ? _value.editChildCommentId
          : editChildCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      isEditChildCommentState: null == isEditChildCommentState
          ? _value.isEditChildCommentState
          : isEditChildCommentState // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditState: null == isEditState
          ? _value.isEditState
          : isEditState // ignore: cast_nullable_to_non_nullable
              as bool,
      editCommentId: null == editCommentId
          ? _value.editCommentId
          : editCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      allDisasterResponse: null == allDisasterResponse
          ? _value._allDisasterResponse
          : allDisasterResponse // ignore: cast_nullable_to_non_nullable
              as List<Disaster>,
      receivedDisasterResponse: null == receivedDisasterResponse
          ? _value._receivedDisasterResponse
          : receivedDisasterResponse // ignore: cast_nullable_to_non_nullable
              as List<Disaster>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReplyLoading: null == isReplyLoading
          ? _value.isReplyLoading
          : isReplyLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      disasterCommunityType: null == disasterCommunityType
          ? _value.disasterCommunityType
          : disasterCommunityType // ignore: cast_nullable_to_non_nullable
              as String,
      disasterReplyList: null == disasterReplyList
          ? _value._disasterReplyList
          : disasterReplyList // ignore: cast_nullable_to_non_nullable
              as List<Reply>,
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

class _$CommunityDisasterStateImpl implements _CommunityDisasterState {
  _$CommunityDisasterStateImpl(
      {this.isDisasterScreen = true,
      this.selectSituaionId = null,
      this.parentCommentId = 0,
      this.isChildCommentState = false,
      this.editChildCommentId = 0,
      this.isEditChildCommentState = false,
      this.isEditState = false,
      this.editCommentId = 0,
      final List<Disaster> allDisasterResponse = const [],
      final List<Disaster> receivedDisasterResponse = const [],
      this.isLoading = true,
      this.isReplyLoading = true,
      this.disasterCommunityType = 'all',
      final List<Reply> disasterReplyList = const [],
      this.reportType = '',
      final List<String> reportDescription = const [
        '허위사실 유포',
        '욕설 및 비방',
        '상업적 광고 및 판매',
        '음란물 및 불건전한 내용',
        '기타'
      ]})
      : _allDisasterResponse = allDisasterResponse,
        _receivedDisasterResponse = receivedDisasterResponse,
        _disasterReplyList = disasterReplyList,
        _reportDescription = reportDescription;

//---------------------------------------------------------
// 재난상황
//---------------------------------------------------------
//현재 보여지는 상태
  @override
  @JsonKey()
  final bool isDisasterScreen;
  @override
  @JsonKey()
  final int? selectSituaionId;
//대댓글 작성시 필요한 부모 댓글 id
  @override
  @JsonKey()
  final int parentCommentId;
//대댓글을 선택한지에 대한 여부
  @override
  @JsonKey()
  final dynamic isChildCommentState;
//moreinfo를 누를때부터 true로 활성화됨
  @override
  @JsonKey()
  final int editChildCommentId;
//2
  @override
  @JsonKey()
  final bool isEditChildCommentState;
//1
//댓글 수정을 위한 상태 데이터
  @override
  @JsonKey()
  final bool isEditState;
  @override
  @JsonKey()
  final int editCommentId;
//커뮤니티 유형별 데이터 상태
  final List<Disaster> _allDisasterResponse;
//커뮤니티 유형별 데이터 상태
  @override
  @JsonKey()
  List<Disaster> get allDisasterResponse {
    if (_allDisasterResponse is EqualUnmodifiableListView)
      return _allDisasterResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allDisasterResponse);
  }

  final List<Disaster> _receivedDisasterResponse;
  @override
  @JsonKey()
  List<Disaster> get receivedDisasterResponse {
    if (_receivedDisasterResponse is EqualUnmodifiableListView)
      return _receivedDisasterResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receivedDisasterResponse);
  }

//재난상황 로드 상태
  @override
  @JsonKey()
  final bool isLoading;
//재난상황 댓글 로드 상태
  @override
  @JsonKey()
  final bool isReplyLoading;
//재난상황 커뮤니티 타입
  @override
  @JsonKey()
  final String disasterCommunityType;
//재난상황 댓글 상태
  final List<Reply> _disasterReplyList;
//재난상황 댓글 상태
  @override
  @JsonKey()
  List<Reply> get disasterReplyList {
    if (_disasterReplyList is EqualUnmodifiableListView)
      return _disasterReplyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disasterReplyList);
  }

//신고 유형1
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
    return 'CommunityDisasterState(isDisasterScreen: $isDisasterScreen, selectSituaionId: $selectSituaionId, parentCommentId: $parentCommentId, isChildCommentState: $isChildCommentState, editChildCommentId: $editChildCommentId, isEditChildCommentState: $isEditChildCommentState, isEditState: $isEditState, editCommentId: $editCommentId, allDisasterResponse: $allDisasterResponse, receivedDisasterResponse: $receivedDisasterResponse, isLoading: $isLoading, isReplyLoading: $isReplyLoading, disasterCommunityType: $disasterCommunityType, disasterReplyList: $disasterReplyList, reportType: $reportType, reportDescription: $reportDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityDisasterStateImpl &&
            (identical(other.isDisasterScreen, isDisasterScreen) ||
                other.isDisasterScreen == isDisasterScreen) &&
            (identical(other.selectSituaionId, selectSituaionId) ||
                other.selectSituaionId == selectSituaionId) &&
            (identical(other.parentCommentId, parentCommentId) ||
                other.parentCommentId == parentCommentId) &&
            const DeepCollectionEquality()
                .equals(other.isChildCommentState, isChildCommentState) &&
            (identical(other.editChildCommentId, editChildCommentId) ||
                other.editChildCommentId == editChildCommentId) &&
            (identical(
                    other.isEditChildCommentState, isEditChildCommentState) ||
                other.isEditChildCommentState == isEditChildCommentState) &&
            (identical(other.isEditState, isEditState) ||
                other.isEditState == isEditState) &&
            (identical(other.editCommentId, editCommentId) ||
                other.editCommentId == editCommentId) &&
            const DeepCollectionEquality()
                .equals(other._allDisasterResponse, _allDisasterResponse) &&
            const DeepCollectionEquality().equals(
                other._receivedDisasterResponse, _receivedDisasterResponse) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isReplyLoading, isReplyLoading) ||
                other.isReplyLoading == isReplyLoading) &&
            (identical(other.disasterCommunityType, disasterCommunityType) ||
                other.disasterCommunityType == disasterCommunityType) &&
            const DeepCollectionEquality()
                .equals(other._disasterReplyList, _disasterReplyList) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            const DeepCollectionEquality()
                .equals(other._reportDescription, _reportDescription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isDisasterScreen,
      selectSituaionId,
      parentCommentId,
      const DeepCollectionEquality().hash(isChildCommentState),
      editChildCommentId,
      isEditChildCommentState,
      isEditState,
      editCommentId,
      const DeepCollectionEquality().hash(_allDisasterResponse),
      const DeepCollectionEquality().hash(_receivedDisasterResponse),
      isLoading,
      isReplyLoading,
      disasterCommunityType,
      const DeepCollectionEquality().hash(_disasterReplyList),
      reportType,
      const DeepCollectionEquality().hash(_reportDescription));

  /// Create a copy of CommunityDisasterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityDisasterStateImplCopyWith<_$CommunityDisasterStateImpl>
      get copyWith => __$$CommunityDisasterStateImplCopyWithImpl<
          _$CommunityDisasterStateImpl>(this, _$identity);
}

abstract class _CommunityDisasterState implements CommunityDisasterState {
  factory _CommunityDisasterState(
      {final bool isDisasterScreen,
      final int? selectSituaionId,
      final int parentCommentId,
      final dynamic isChildCommentState,
      final int editChildCommentId,
      final bool isEditChildCommentState,
      final bool isEditState,
      final int editCommentId,
      final List<Disaster> allDisasterResponse,
      final List<Disaster> receivedDisasterResponse,
      final bool isLoading,
      final bool isReplyLoading,
      final String disasterCommunityType,
      final List<Reply> disasterReplyList,
      final String reportType,
      final List<String> reportDescription}) = _$CommunityDisasterStateImpl;

//---------------------------------------------------------
// 재난상황
//---------------------------------------------------------
//현재 보여지는 상태
  @override
  bool get isDisasterScreen;
  @override
  int? get selectSituaionId;
  @override //대댓글 작성시 필요한 부모 댓글 id
  int get parentCommentId;
  @override //대댓글을 선택한지에 대한 여부
  dynamic get isChildCommentState;
  @override //moreinfo를 누를때부터 true로 활성화됨
  int get editChildCommentId;
  @override //2
  bool get isEditChildCommentState;
  @override //1
//댓글 수정을 위한 상태 데이터
  bool get isEditState;
  @override
  int get editCommentId;
  @override //커뮤니티 유형별 데이터 상태
  List<Disaster> get allDisasterResponse;
  @override
  List<Disaster> get receivedDisasterResponse;
  @override //재난상황 로드 상태
  bool get isLoading;
  @override //재난상황 댓글 로드 상태
  bool get isReplyLoading;
  @override //재난상황 커뮤니티 타입
  String get disasterCommunityType;
  @override //재난상황 댓글 상태
  List<Reply> get disasterReplyList;
  @override //신고 유형1
  String get reportType;
  @override
  List<String> get reportDescription;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityDisasterStateImplCopyWith<_$CommunityDisasterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
