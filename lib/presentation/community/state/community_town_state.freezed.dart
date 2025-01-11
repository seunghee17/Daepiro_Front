// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_town_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommunityTownState {
//---------------------------------------------------------
// 동네생활
//---------------------------------------------------------
//동네생활 게시글 상세조회
  ContentDetail get contentDetail =>
      throw _privateConstructorUsedError; //동네생활 댓글 상태
  List<CommentData> get townReplyList => throw _privateConstructorUsedError;
  int? get selectContentId => throw _privateConstructorUsedError; //동네생활 컨텐츠 리스트
  Set<Content> get contentList =>
      throw _privateConstructorUsedError; //동네생활 로딩 상태
  bool get isDongNaeLoading =>
      throw _privateConstructorUsedError; //동네생활 컨텐츠 더있는가
  bool get isDongNaeHasMore => throw _privateConstructorUsedError;
  bool get isDongNaeContentEmpty =>
      throw _privateConstructorUsedError; //동네생활 선택한 동네
  String get selectTown => throw _privateConstructorUsedError;
  String get selectLongTownAddress => throw _privateConstructorUsedError;
  List<String> get townLongAddressList => throw _privateConstructorUsedError;
  List<String> get townList => throw _privateConstructorUsedError;
  String get townCommunityType =>
      throw _privateConstructorUsedError; //동네생활 카테고리
  String get townCategory => throw _privateConstructorUsedError; //동네생활 댓글 상태
  List<CommentData> get TownReplyList =>
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
  String? get reportType => throw _privateConstructorUsedError; //위치 공개 여부 변수
  bool get isVisible => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError; //갤러리 관련 상태 변수
  List<AlbumModel> get albums => throw _privateConstructorUsedError;
  int get currentAlbumIndex => throw _privateConstructorUsedError;
  List<AlbumModel> get selectAlbums => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommunityTownStateCopyWith<CommunityTownState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityTownStateCopyWith<$Res> {
  factory $CommunityTownStateCopyWith(
          CommunityTownState value, $Res Function(CommunityTownState) then) =
      _$CommunityTownStateCopyWithImpl<$Res, CommunityTownState>;
  @useResult
  $Res call(
      {ContentDetail contentDetail,
      List<CommentData> townReplyList,
      int? selectContentId,
      Set<Content> contentList,
      bool isDongNaeLoading,
      bool isDongNaeHasMore,
      bool isDongNaeContentEmpty,
      String selectTown,
      String selectLongTownAddress,
      List<String> townLongAddressList,
      List<String> townList,
      String townCommunityType,
      String townCategory,
      List<CommentData> TownReplyList,
      int parentCommentId,
      dynamic isChildCommentState,
      int deleteChildCommentId,
      int editChildCommentId,
      bool isEditChildCommentState,
      int deleteCommentId,
      bool isEditState,
      int editCommentId,
      String? reportType,
      bool isVisible,
      double latitude,
      double longitude,
      List<AlbumModel> albums,
      int currentAlbumIndex,
      List<AlbumModel> selectAlbums});
}

/// @nodoc
class _$CommunityTownStateCopyWithImpl<$Res, $Val extends CommunityTownState>
    implements $CommunityTownStateCopyWith<$Res> {
  _$CommunityTownStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentDetail = null,
    Object? townReplyList = null,
    Object? selectContentId = freezed,
    Object? contentList = null,
    Object? isDongNaeLoading = null,
    Object? isDongNaeHasMore = null,
    Object? isDongNaeContentEmpty = null,
    Object? selectTown = null,
    Object? selectLongTownAddress = null,
    Object? townLongAddressList = null,
    Object? townList = null,
    Object? townCommunityType = null,
    Object? townCategory = null,
    Object? TownReplyList = null,
    Object? parentCommentId = null,
    Object? isChildCommentState = freezed,
    Object? deleteChildCommentId = null,
    Object? editChildCommentId = null,
    Object? isEditChildCommentState = null,
    Object? deleteCommentId = null,
    Object? isEditState = null,
    Object? editCommentId = null,
    Object? reportType = freezed,
    Object? isVisible = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? albums = null,
    Object? currentAlbumIndex = null,
    Object? selectAlbums = null,
  }) {
    return _then(_value.copyWith(
      contentDetail: null == contentDetail
          ? _value.contentDetail
          : contentDetail // ignore: cast_nullable_to_non_nullable
              as ContentDetail,
      townReplyList: null == townReplyList
          ? _value.townReplyList
          : townReplyList // ignore: cast_nullable_to_non_nullable
              as List<CommentData>,
      selectContentId: freezed == selectContentId
          ? _value.selectContentId
          : selectContentId // ignore: cast_nullable_to_non_nullable
              as int?,
      contentList: null == contentList
          ? _value.contentList
          : contentList // ignore: cast_nullable_to_non_nullable
              as Set<Content>,
      isDongNaeLoading: null == isDongNaeLoading
          ? _value.isDongNaeLoading
          : isDongNaeLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDongNaeHasMore: null == isDongNaeHasMore
          ? _value.isDongNaeHasMore
          : isDongNaeHasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isDongNaeContentEmpty: null == isDongNaeContentEmpty
          ? _value.isDongNaeContentEmpty
          : isDongNaeContentEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
      selectTown: null == selectTown
          ? _value.selectTown
          : selectTown // ignore: cast_nullable_to_non_nullable
              as String,
      selectLongTownAddress: null == selectLongTownAddress
          ? _value.selectLongTownAddress
          : selectLongTownAddress // ignore: cast_nullable_to_non_nullable
              as String,
      townLongAddressList: null == townLongAddressList
          ? _value.townLongAddressList
          : townLongAddressList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      townList: null == townList
          ? _value.townList
          : townList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      townCommunityType: null == townCommunityType
          ? _value.townCommunityType
          : townCommunityType // ignore: cast_nullable_to_non_nullable
              as String,
      townCategory: null == townCategory
          ? _value.townCategory
          : townCategory // ignore: cast_nullable_to_non_nullable
              as String,
      TownReplyList: null == TownReplyList
          ? _value.TownReplyList
          : TownReplyList // ignore: cast_nullable_to_non_nullable
              as List<CommentData>,
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
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      albums: null == albums
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumModel>,
      currentAlbumIndex: null == currentAlbumIndex
          ? _value.currentAlbumIndex
          : currentAlbumIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectAlbums: null == selectAlbums
          ? _value.selectAlbums
          : selectAlbums // ignore: cast_nullable_to_non_nullable
              as List<AlbumModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityTownStateImplCopyWith<$Res>
    implements $CommunityTownStateCopyWith<$Res> {
  factory _$$CommunityTownStateImplCopyWith(_$CommunityTownStateImpl value,
          $Res Function(_$CommunityTownStateImpl) then) =
      __$$CommunityTownStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ContentDetail contentDetail,
      List<CommentData> townReplyList,
      int? selectContentId,
      Set<Content> contentList,
      bool isDongNaeLoading,
      bool isDongNaeHasMore,
      bool isDongNaeContentEmpty,
      String selectTown,
      String selectLongTownAddress,
      List<String> townLongAddressList,
      List<String> townList,
      String townCommunityType,
      String townCategory,
      List<CommentData> TownReplyList,
      int parentCommentId,
      dynamic isChildCommentState,
      int deleteChildCommentId,
      int editChildCommentId,
      bool isEditChildCommentState,
      int deleteCommentId,
      bool isEditState,
      int editCommentId,
      String? reportType,
      bool isVisible,
      double latitude,
      double longitude,
      List<AlbumModel> albums,
      int currentAlbumIndex,
      List<AlbumModel> selectAlbums});
}

/// @nodoc
class __$$CommunityTownStateImplCopyWithImpl<$Res>
    extends _$CommunityTownStateCopyWithImpl<$Res, _$CommunityTownStateImpl>
    implements _$$CommunityTownStateImplCopyWith<$Res> {
  __$$CommunityTownStateImplCopyWithImpl(_$CommunityTownStateImpl _value,
      $Res Function(_$CommunityTownStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentDetail = null,
    Object? townReplyList = null,
    Object? selectContentId = freezed,
    Object? contentList = null,
    Object? isDongNaeLoading = null,
    Object? isDongNaeHasMore = null,
    Object? isDongNaeContentEmpty = null,
    Object? selectTown = null,
    Object? selectLongTownAddress = null,
    Object? townLongAddressList = null,
    Object? townList = null,
    Object? townCommunityType = null,
    Object? townCategory = null,
    Object? TownReplyList = null,
    Object? parentCommentId = null,
    Object? isChildCommentState = freezed,
    Object? deleteChildCommentId = null,
    Object? editChildCommentId = null,
    Object? isEditChildCommentState = null,
    Object? deleteCommentId = null,
    Object? isEditState = null,
    Object? editCommentId = null,
    Object? reportType = freezed,
    Object? isVisible = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? albums = null,
    Object? currentAlbumIndex = null,
    Object? selectAlbums = null,
  }) {
    return _then(_$CommunityTownStateImpl(
      contentDetail: null == contentDetail
          ? _value.contentDetail
          : contentDetail // ignore: cast_nullable_to_non_nullable
              as ContentDetail,
      townReplyList: null == townReplyList
          ? _value._townReplyList
          : townReplyList // ignore: cast_nullable_to_non_nullable
              as List<CommentData>,
      selectContentId: freezed == selectContentId
          ? _value.selectContentId
          : selectContentId // ignore: cast_nullable_to_non_nullable
              as int?,
      contentList: null == contentList
          ? _value._contentList
          : contentList // ignore: cast_nullable_to_non_nullable
              as Set<Content>,
      isDongNaeLoading: null == isDongNaeLoading
          ? _value.isDongNaeLoading
          : isDongNaeLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDongNaeHasMore: null == isDongNaeHasMore
          ? _value.isDongNaeHasMore
          : isDongNaeHasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isDongNaeContentEmpty: null == isDongNaeContentEmpty
          ? _value.isDongNaeContentEmpty
          : isDongNaeContentEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
      selectTown: null == selectTown
          ? _value.selectTown
          : selectTown // ignore: cast_nullable_to_non_nullable
              as String,
      selectLongTownAddress: null == selectLongTownAddress
          ? _value.selectLongTownAddress
          : selectLongTownAddress // ignore: cast_nullable_to_non_nullable
              as String,
      townLongAddressList: null == townLongAddressList
          ? _value._townLongAddressList
          : townLongAddressList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      townList: null == townList
          ? _value._townList
          : townList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      townCommunityType: null == townCommunityType
          ? _value.townCommunityType
          : townCommunityType // ignore: cast_nullable_to_non_nullable
              as String,
      townCategory: null == townCategory
          ? _value.townCategory
          : townCategory // ignore: cast_nullable_to_non_nullable
              as String,
      TownReplyList: null == TownReplyList
          ? _value._TownReplyList
          : TownReplyList // ignore: cast_nullable_to_non_nullable
              as List<CommentData>,
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
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      albums: null == albums
          ? _value._albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumModel>,
      currentAlbumIndex: null == currentAlbumIndex
          ? _value.currentAlbumIndex
          : currentAlbumIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectAlbums: null == selectAlbums
          ? _value._selectAlbums
          : selectAlbums // ignore: cast_nullable_to_non_nullable
              as List<AlbumModel>,
    ));
  }
}

/// @nodoc

class _$CommunityTownStateImpl implements _CommunityTownState {
  _$CommunityTownStateImpl(
      {this.contentDetail = const ContentDetail(),
      final List<CommentData> townReplyList = const [],
      this.selectContentId = null,
      final Set<Content> contentList = const <Content>{},
      this.isDongNaeLoading = true,
      this.isDongNaeHasMore = true,
      this.isDongNaeContentEmpty = true,
      this.selectTown = '',
      this.selectLongTownAddress = '',
      final List<String> townLongAddressList = const [],
      final List<String> townList = const [],
      this.townCommunityType = 'ALL',
      this.townCategory = '전체',
      final List<CommentData> TownReplyList = const [],
      this.parentCommentId = 0,
      this.isChildCommentState = false,
      this.deleteChildCommentId = 0,
      this.editChildCommentId = 0,
      this.isEditChildCommentState = false,
      this.deleteCommentId = 0,
      this.isEditState = false,
      this.editCommentId = 0,
      this.reportType = null,
      this.isVisible = false,
      this.latitude = 0.0,
      this.longitude = 0.0,
      final List<AlbumModel> albums = const [],
      this.currentAlbumIndex = 0,
      final List<AlbumModel> selectAlbums = const []})
      : _townReplyList = townReplyList,
        _contentList = contentList,
        _townLongAddressList = townLongAddressList,
        _townList = townList,
        _TownReplyList = TownReplyList,
        _albums = albums,
        _selectAlbums = selectAlbums;

//---------------------------------------------------------
// 동네생활
//---------------------------------------------------------
//동네생활 게시글 상세조회
  @override
  @JsonKey()
  final ContentDetail contentDetail;
//동네생활 댓글 상태
  final List<CommentData> _townReplyList;
//동네생활 댓글 상태
  @override
  @JsonKey()
  List<CommentData> get townReplyList {
    if (_townReplyList is EqualUnmodifiableListView) return _townReplyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_townReplyList);
  }

  @override
  @JsonKey()
  final int? selectContentId;
//동네생활 컨텐츠 리스트
  final Set<Content> _contentList;
//동네생활 컨텐츠 리스트
  @override
  @JsonKey()
  Set<Content> get contentList {
    if (_contentList is EqualUnmodifiableSetView) return _contentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_contentList);
  }

//동네생활 로딩 상태
  @override
  @JsonKey()
  final bool isDongNaeLoading;
//동네생활 컨텐츠 더있는가
  @override
  @JsonKey()
  final bool isDongNaeHasMore;
  @override
  @JsonKey()
  final bool isDongNaeContentEmpty;
//동네생활 선택한 동네
  @override
  @JsonKey()
  final String selectTown;
  @override
  @JsonKey()
  final String selectLongTownAddress;
  final List<String> _townLongAddressList;
  @override
  @JsonKey()
  List<String> get townLongAddressList {
    if (_townLongAddressList is EqualUnmodifiableListView)
      return _townLongAddressList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_townLongAddressList);
  }

  final List<String> _townList;
  @override
  @JsonKey()
  List<String> get townList {
    if (_townList is EqualUnmodifiableListView) return _townList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_townList);
  }

  @override
  @JsonKey()
  final String townCommunityType;
//동네생활 카테고리
  @override
  @JsonKey()
  final String townCategory;
//동네생활 댓글 상태
  final List<CommentData> _TownReplyList;
//동네생활 댓글 상태
  @override
  @JsonKey()
  List<CommentData> get TownReplyList {
    if (_TownReplyList is EqualUnmodifiableListView) return _TownReplyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_TownReplyList);
  }

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
//위치 공개 여부 변수
  @override
  @JsonKey()
  final bool isVisible;
  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;
//갤러리 관련 상태 변수
  final List<AlbumModel> _albums;
//갤러리 관련 상태 변수
  @override
  @JsonKey()
  List<AlbumModel> get albums {
    if (_albums is EqualUnmodifiableListView) return _albums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albums);
  }

  @override
  @JsonKey()
  final int currentAlbumIndex;
  final List<AlbumModel> _selectAlbums;
  @override
  @JsonKey()
  List<AlbumModel> get selectAlbums {
    if (_selectAlbums is EqualUnmodifiableListView) return _selectAlbums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectAlbums);
  }

  @override
  String toString() {
    return 'CommunityTownState(contentDetail: $contentDetail, townReplyList: $townReplyList, selectContentId: $selectContentId, contentList: $contentList, isDongNaeLoading: $isDongNaeLoading, isDongNaeHasMore: $isDongNaeHasMore, isDongNaeContentEmpty: $isDongNaeContentEmpty, selectTown: $selectTown, selectLongTownAddress: $selectLongTownAddress, townLongAddressList: $townLongAddressList, townList: $townList, townCommunityType: $townCommunityType, townCategory: $townCategory, TownReplyList: $TownReplyList, parentCommentId: $parentCommentId, isChildCommentState: $isChildCommentState, deleteChildCommentId: $deleteChildCommentId, editChildCommentId: $editChildCommentId, isEditChildCommentState: $isEditChildCommentState, deleteCommentId: $deleteCommentId, isEditState: $isEditState, editCommentId: $editCommentId, reportType: $reportType, isVisible: $isVisible, latitude: $latitude, longitude: $longitude, albums: $albums, currentAlbumIndex: $currentAlbumIndex, selectAlbums: $selectAlbums)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityTownStateImpl &&
            (identical(other.contentDetail, contentDetail) ||
                other.contentDetail == contentDetail) &&
            const DeepCollectionEquality()
                .equals(other._townReplyList, _townReplyList) &&
            (identical(other.selectContentId, selectContentId) ||
                other.selectContentId == selectContentId) &&
            const DeepCollectionEquality()
                .equals(other._contentList, _contentList) &&
            (identical(other.isDongNaeLoading, isDongNaeLoading) ||
                other.isDongNaeLoading == isDongNaeLoading) &&
            (identical(other.isDongNaeHasMore, isDongNaeHasMore) ||
                other.isDongNaeHasMore == isDongNaeHasMore) &&
            (identical(other.isDongNaeContentEmpty, isDongNaeContentEmpty) ||
                other.isDongNaeContentEmpty == isDongNaeContentEmpty) &&
            (identical(other.selectTown, selectTown) ||
                other.selectTown == selectTown) &&
            (identical(other.selectLongTownAddress, selectLongTownAddress) ||
                other.selectLongTownAddress == selectLongTownAddress) &&
            const DeepCollectionEquality()
                .equals(other._townLongAddressList, _townLongAddressList) &&
            const DeepCollectionEquality().equals(other._townList, _townList) &&
            (identical(other.townCommunityType, townCommunityType) ||
                other.townCommunityType == townCommunityType) &&
            (identical(other.townCategory, townCategory) ||
                other.townCategory == townCategory) &&
            const DeepCollectionEquality()
                .equals(other._TownReplyList, _TownReplyList) &&
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
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other._albums, _albums) &&
            (identical(other.currentAlbumIndex, currentAlbumIndex) ||
                other.currentAlbumIndex == currentAlbumIndex) &&
            const DeepCollectionEquality()
                .equals(other._selectAlbums, _selectAlbums));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        contentDetail,
        const DeepCollectionEquality().hash(_townReplyList),
        selectContentId,
        const DeepCollectionEquality().hash(_contentList),
        isDongNaeLoading,
        isDongNaeHasMore,
        isDongNaeContentEmpty,
        selectTown,
        selectLongTownAddress,
        const DeepCollectionEquality().hash(_townLongAddressList),
        const DeepCollectionEquality().hash(_townList),
        townCommunityType,
        townCategory,
        const DeepCollectionEquality().hash(_TownReplyList),
        parentCommentId,
        const DeepCollectionEquality().hash(isChildCommentState),
        deleteChildCommentId,
        editChildCommentId,
        isEditChildCommentState,
        deleteCommentId,
        isEditState,
        editCommentId,
        reportType,
        isVisible,
        latitude,
        longitude,
        const DeepCollectionEquality().hash(_albums),
        currentAlbumIndex,
        const DeepCollectionEquality().hash(_selectAlbums)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityTownStateImplCopyWith<_$CommunityTownStateImpl> get copyWith =>
      __$$CommunityTownStateImplCopyWithImpl<_$CommunityTownStateImpl>(
          this, _$identity);
}

abstract class _CommunityTownState implements CommunityTownState {
  factory _CommunityTownState(
      {final ContentDetail contentDetail,
      final List<CommentData> townReplyList,
      final int? selectContentId,
      final Set<Content> contentList,
      final bool isDongNaeLoading,
      final bool isDongNaeHasMore,
      final bool isDongNaeContentEmpty,
      final String selectTown,
      final String selectLongTownAddress,
      final List<String> townLongAddressList,
      final List<String> townList,
      final String townCommunityType,
      final String townCategory,
      final List<CommentData> TownReplyList,
      final int parentCommentId,
      final dynamic isChildCommentState,
      final int deleteChildCommentId,
      final int editChildCommentId,
      final bool isEditChildCommentState,
      final int deleteCommentId,
      final bool isEditState,
      final int editCommentId,
      final String? reportType,
      final bool isVisible,
      final double latitude,
      final double longitude,
      final List<AlbumModel> albums,
      final int currentAlbumIndex,
      final List<AlbumModel> selectAlbums}) = _$CommunityTownStateImpl;

  @override //---------------------------------------------------------
// 동네생활
//---------------------------------------------------------
//동네생활 게시글 상세조회
  ContentDetail get contentDetail;
  @override //동네생활 댓글 상태
  List<CommentData> get townReplyList;
  @override
  int? get selectContentId;
  @override //동네생활 컨텐츠 리스트
  Set<Content> get contentList;
  @override //동네생활 로딩 상태
  bool get isDongNaeLoading;
  @override //동네생활 컨텐츠 더있는가
  bool get isDongNaeHasMore;
  @override
  bool get isDongNaeContentEmpty;
  @override //동네생활 선택한 동네
  String get selectTown;
  @override
  String get selectLongTownAddress;
  @override
  List<String> get townLongAddressList;
  @override
  List<String> get townList;
  @override
  String get townCommunityType;
  @override //동네생활 카테고리
  String get townCategory;
  @override //동네생활 댓글 상태
  List<CommentData> get TownReplyList;
  @override //대댓글 작성시 필요한 부모 댓글 id
  int get parentCommentId;
  @override //대댓글을 선택한지에 대한 여부
  dynamic get isChildCommentState;
  @override //moreinfo를 누를때부터 true로 활성화됨
  int get deleteChildCommentId;
  @override
  int get editChildCommentId;
  @override //2
  bool get isEditChildCommentState;
  @override //1
//댓글 삭제를 위해 필요한 데이터
  int get deleteCommentId;
  @override //댓글 수정을 위한 상태 데이터
  bool get isEditState;
  @override
  int get editCommentId;
  @override
  String? get reportType;
  @override //위치 공개 여부 변수
  bool get isVisible;
  @override
  double get latitude;
  @override
  double get longitude;
  @override //갤러리 관련 상태 변수
  List<AlbumModel> get albums;
  @override
  int get currentAlbumIndex;
  @override
  List<AlbumModel> get selectAlbums;
  @override
  @JsonKey(ignore: true)
  _$$CommunityTownStateImplCopyWith<_$CommunityTownStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
