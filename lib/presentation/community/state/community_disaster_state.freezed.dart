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
  int get deleteChildCommentId => throw _privateConstructorUsedError;
  int get editChildCommentId => throw _privateConstructorUsedError; //2
  bool get isEditChildCommentState => throw _privateConstructorUsedError; //1
//댓글 삭제를 위해 필요한 데이터
  int get deleteCommentId =>
      throw _privateConstructorUsedError; //댓글 수정을 위한 상태 데이터
  bool get isEditState => throw _privateConstructorUsedError;
  int get editCommentId => throw _privateConstructorUsedError;
  String? get reportType =>
      throw _privateConstructorUsedError; //커뮤니티 유형별 데이터 상태
  List<Data> get allDisasterResponse => throw _privateConstructorUsedError;
  List<Data> get receivedDisasterResponse => throw _privateConstructorUsedError;
  int get listLength => throw _privateConstructorUsedError; //재난상황 로드 상태
  bool get isLoading => throw _privateConstructorUsedError; //재난상황 댓글 로드 상태
  bool get isReplyLoading => throw _privateConstructorUsedError; //재난상황 커뮤니티 타입
  String get disasterCommunityType =>
      throw _privateConstructorUsedError; //재난상황 댓글 상태
  List<Reply> get disasterReplyList =>
      throw _privateConstructorUsedError; //신고 유형
  String get reporyType => throw _privateConstructorUsedError;

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
      int deleteChildCommentId,
      int editChildCommentId,
      bool isEditChildCommentState,
      int deleteCommentId,
      bool isEditState,
      int editCommentId,
      String? reportType,
      List<Data> allDisasterResponse,
      List<Data> receivedDisasterResponse,
      int listLength,
      bool isLoading,
      bool isReplyLoading,
      String disasterCommunityType,
      List<Reply> disasterReplyList,
      String reporyType});
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
    Object? deleteChildCommentId = null,
    Object? editChildCommentId = null,
    Object? isEditChildCommentState = null,
    Object? deleteCommentId = null,
    Object? isEditState = null,
    Object? editCommentId = null,
    Object? reportType = freezed,
    Object? allDisasterResponse = null,
    Object? receivedDisasterResponse = null,
    Object? listLength = null,
    Object? isLoading = null,
    Object? isReplyLoading = null,
    Object? disasterCommunityType = null,
    Object? disasterReplyList = null,
    Object? reporyType = null,
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
      deleteChildCommentId: null == deleteChildCommentId
          ? _value.deleteChildCommentId
          : deleteChildCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      editChildCommentId: null == editChildCommentId
          ? _value.editChildCommentId
          : editChildCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      isEditChildCommentState: null == isEditChildCommentState
          ? _value.isEditChildCommentState
          : isEditChildCommentState // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteCommentId: null == deleteCommentId
          ? _value.deleteCommentId
          : deleteCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      isEditState: null == isEditState
          ? _value.isEditState
          : isEditState // ignore: cast_nullable_to_non_nullable
              as bool,
      editCommentId: null == editCommentId
          ? _value.editCommentId
          : editCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      reportType: freezed == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String?,
      allDisasterResponse: null == allDisasterResponse
          ? _value.allDisasterResponse
          : allDisasterResponse // ignore: cast_nullable_to_non_nullable
              as List<Data>,
      receivedDisasterResponse: null == receivedDisasterResponse
          ? _value.receivedDisasterResponse
          : receivedDisasterResponse // ignore: cast_nullable_to_non_nullable
              as List<Data>,
      listLength: null == listLength
          ? _value.listLength
          : listLength // ignore: cast_nullable_to_non_nullable
              as int,
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
      reporyType: null == reporyType
          ? _value.reporyType
          : reporyType // ignore: cast_nullable_to_non_nullable
              as String,
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
      int deleteChildCommentId,
      int editChildCommentId,
      bool isEditChildCommentState,
      int deleteCommentId,
      bool isEditState,
      int editCommentId,
      String? reportType,
      List<Data> allDisasterResponse,
      List<Data> receivedDisasterResponse,
      int listLength,
      bool isLoading,
      bool isReplyLoading,
      String disasterCommunityType,
      List<Reply> disasterReplyList,
      String reporyType});
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
    Object? deleteChildCommentId = null,
    Object? editChildCommentId = null,
    Object? isEditChildCommentState = null,
    Object? deleteCommentId = null,
    Object? isEditState = null,
    Object? editCommentId = null,
    Object? reportType = freezed,
    Object? allDisasterResponse = null,
    Object? receivedDisasterResponse = null,
    Object? listLength = null,
    Object? isLoading = null,
    Object? isReplyLoading = null,
    Object? disasterCommunityType = null,
    Object? disasterReplyList = null,
    Object? reporyType = null,
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
      deleteChildCommentId: null == deleteChildCommentId
          ? _value.deleteChildCommentId
          : deleteChildCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      editChildCommentId: null == editChildCommentId
          ? _value.editChildCommentId
          : editChildCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      isEditChildCommentState: null == isEditChildCommentState
          ? _value.isEditChildCommentState
          : isEditChildCommentState // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteCommentId: null == deleteCommentId
          ? _value.deleteCommentId
          : deleteCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      isEditState: null == isEditState
          ? _value.isEditState
          : isEditState // ignore: cast_nullable_to_non_nullable
              as bool,
      editCommentId: null == editCommentId
          ? _value.editCommentId
          : editCommentId // ignore: cast_nullable_to_non_nullable
              as int,
      reportType: freezed == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String?,
      allDisasterResponse: null == allDisasterResponse
          ? _value._allDisasterResponse
          : allDisasterResponse // ignore: cast_nullable_to_non_nullable
              as List<Data>,
      receivedDisasterResponse: null == receivedDisasterResponse
          ? _value._receivedDisasterResponse
          : receivedDisasterResponse // ignore: cast_nullable_to_non_nullable
              as List<Data>,
      listLength: null == listLength
          ? _value.listLength
          : listLength // ignore: cast_nullable_to_non_nullable
              as int,
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
      reporyType: null == reporyType
          ? _value.reporyType
          : reporyType // ignore: cast_nullable_to_non_nullable
              as String,
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
      this.deleteChildCommentId = 0,
      this.editChildCommentId = 0,
      this.isEditChildCommentState = false,
      this.deleteCommentId = 0,
      this.isEditState = false,
      this.editCommentId = 0,
      this.reportType = null,
      final List<Data> allDisasterResponse = const [],
      final List<Data> receivedDisasterResponse = const [],
      this.listLength = 0,
      this.isLoading = true,
      this.isReplyLoading = true,
      this.disasterCommunityType = 'all',
      final List<Reply> disasterReplyList = const [],
      this.reporyType = ''})
      : _allDisasterResponse = allDisasterResponse,
        _receivedDisasterResponse = receivedDisasterResponse,
        _disasterReplyList = disasterReplyList;

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
  final int deleteChildCommentId;
  @override
  @JsonKey()
  final int editChildCommentId;
//2
  @override
  @JsonKey()
  final bool isEditChildCommentState;
//1
//댓글 삭제를 위해 필요한 데이터
  @override
  @JsonKey()
  final int deleteCommentId;
//댓글 수정을 위한 상태 데이터
  @override
  @JsonKey()
  final bool isEditState;
  @override
  @JsonKey()
  final int editCommentId;
  @override
  @JsonKey()
  final String? reportType;
//커뮤니티 유형별 데이터 상태
  final List<Data> _allDisasterResponse;
//커뮤니티 유형별 데이터 상태
  @override
  @JsonKey()
  List<Data> get allDisasterResponse {
    if (_allDisasterResponse is EqualUnmodifiableListView)
      return _allDisasterResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allDisasterResponse);
  }

  final List<Data> _receivedDisasterResponse;
  @override
  @JsonKey()
  List<Data> get receivedDisasterResponse {
    if (_receivedDisasterResponse is EqualUnmodifiableListView)
      return _receivedDisasterResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receivedDisasterResponse);
  }

  @override
  @JsonKey()
  final int listLength;
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

//신고 유형
  @override
  @JsonKey()
  final String reporyType;

  @override
  String toString() {
    return 'CommunityDisasterState(isDisasterScreen: $isDisasterScreen, selectSituaionId: $selectSituaionId, parentCommentId: $parentCommentId, isChildCommentState: $isChildCommentState, deleteChildCommentId: $deleteChildCommentId, editChildCommentId: $editChildCommentId, isEditChildCommentState: $isEditChildCommentState, deleteCommentId: $deleteCommentId, isEditState: $isEditState, editCommentId: $editCommentId, reportType: $reportType, allDisasterResponse: $allDisasterResponse, receivedDisasterResponse: $receivedDisasterResponse, listLength: $listLength, isLoading: $isLoading, isReplyLoading: $isReplyLoading, disasterCommunityType: $disasterCommunityType, disasterReplyList: $disasterReplyList, reporyType: $reporyType)';
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
            (identical(other.deleteChildCommentId, deleteChildCommentId) ||
                other.deleteChildCommentId == deleteChildCommentId) &&
            (identical(other.editChildCommentId, editChildCommentId) ||
                other.editChildCommentId == editChildCommentId) &&
            (identical(
                    other.isEditChildCommentState, isEditChildCommentState) ||
                other.isEditChildCommentState == isEditChildCommentState) &&
            (identical(other.deleteCommentId, deleteCommentId) ||
                other.deleteCommentId == deleteCommentId) &&
            (identical(other.isEditState, isEditState) ||
                other.isEditState == isEditState) &&
            (identical(other.editCommentId, editCommentId) ||
                other.editCommentId == editCommentId) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            const DeepCollectionEquality()
                .equals(other._allDisasterResponse, _allDisasterResponse) &&
            const DeepCollectionEquality().equals(
                other._receivedDisasterResponse, _receivedDisasterResponse) &&
            (identical(other.listLength, listLength) ||
                other.listLength == listLength) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isReplyLoading, isReplyLoading) ||
                other.isReplyLoading == isReplyLoading) &&
            (identical(other.disasterCommunityType, disasterCommunityType) ||
                other.disasterCommunityType == disasterCommunityType) &&
            const DeepCollectionEquality()
                .equals(other._disasterReplyList, _disasterReplyList) &&
            (identical(other.reporyType, reporyType) ||
                other.reporyType == reporyType));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isDisasterScreen,
        selectSituaionId,
        parentCommentId,
        const DeepCollectionEquality().hash(isChildCommentState),
        deleteChildCommentId,
        editChildCommentId,
        isEditChildCommentState,
        deleteCommentId,
        isEditState,
        editCommentId,
        reportType,
        const DeepCollectionEquality().hash(_allDisasterResponse),
        const DeepCollectionEquality().hash(_receivedDisasterResponse),
        listLength,
        isLoading,
        isReplyLoading,
        disasterCommunityType,
        const DeepCollectionEquality().hash(_disasterReplyList),
        reporyType
      ]);

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
      final int deleteChildCommentId,
      final int editChildCommentId,
      final bool isEditChildCommentState,
      final int deleteCommentId,
      final bool isEditState,
      final int editCommentId,
      final String? reportType,
      final List<Data> allDisasterResponse,
      final List<Data> receivedDisasterResponse,
      final int listLength,
      final bool isLoading,
      final bool isReplyLoading,
      final String disasterCommunityType,
      final List<Reply> disasterReplyList,
      final String reporyType}) = _$CommunityDisasterStateImpl;

//---------------------------------------------------------
// 재난상황
//---------------------------------------------------------
//현재 보여지는 상태
  @override
  bool get isDisasterScreen;
  @override
  int? get selectSituaionId; //대댓글 작성시 필요한 부모 댓글 id
  @override
  int get parentCommentId; //대댓글을 선택한지에 대한 여부
  @override
  dynamic get isChildCommentState; //moreinfo를 누를때부터 true로 활성화됨
  @override
  int get deleteChildCommentId;
  @override
  int get editChildCommentId; //2
  @override
  bool get isEditChildCommentState; //1
//댓글 삭제를 위해 필요한 데이터
  @override
  int get deleteCommentId; //댓글 수정을 위한 상태 데이터
  @override
  bool get isEditState;
  @override
  int get editCommentId;
  @override
  String? get reportType; //커뮤니티 유형별 데이터 상태
  @override
  List<Data> get allDisasterResponse;
  @override
  List<Data> get receivedDisasterResponse;
  @override
  int get listLength; //재난상황 로드 상태
  @override
  bool get isLoading; //재난상황 댓글 로드 상태
  @override
  bool get isReplyLoading; //재난상황 커뮤니티 타입
  @override
  String get disasterCommunityType; //재난상황 댓글 상태
  @override
  List<Reply> get disasterReplyList; //신고 유형
  @override
  String get reporyType;

  /// Create a copy of CommunityDisasterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityDisasterStateImplCopyWith<_$CommunityDisasterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
