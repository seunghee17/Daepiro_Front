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
//동네생활 게시글 상세조회
  ContentDetail get contentDetail =>
      throw _privateConstructorUsedError; //게시글 삭제상태
  bool get deleteArticle => throw _privateConstructorUsedError; //동네생활 댓글 상태
  List<CommentData> get townReplyList => throw _privateConstructorUsedError;
  int? get selectContentId => throw _privateConstructorUsedError; //동네생활 컨텐츠 리스트
  List<Content> get contentList =>
      throw _privateConstructorUsedError; //동네생활 로딩 상태
  bool get isDongNaeLoading =>
      throw _privateConstructorUsedError; //동네생활 컨텐츠 더있는가
  bool get isDongNaeHasMore => throw _privateConstructorUsedError; //동네생활 선택한 동네
  String get selectTown => throw _privateConstructorUsedError;
  String get selectLongTownAddress => throw _privateConstructorUsedError;
  List<String> get townLongAddressList => throw _privateConstructorUsedError;
  List<String> get townList =>
      throw _privateConstructorUsedError; //동네생활 선택 카테고리
  String get townCategory =>
      throw _privateConstructorUsedError; //동네생활 글쓰기 선택 카테고리
  String get writingTownCategory =>
      throw _privateConstructorUsedError; //대댓글 작성시 필요한 부모 댓글 id
  int get parentCommentId =>
      throw _privateConstructorUsedError; //대댓글을 선택한지에 대한 여부
  dynamic get isChildCommentState =>
      throw _privateConstructorUsedError; //moreinfo를 누를때부터 true로 활성화됨
  int get editChildCommentId => throw _privateConstructorUsedError; //2
  bool get isEditChildCommentState => throw _privateConstructorUsedError; //1
//댓글 수정을 위한 상태 데이터
  bool get isEditState => throw _privateConstructorUsedError;
  int get editCommentId => throw _privateConstructorUsedError; //신고하기
  String get reportType => throw _privateConstructorUsedError; //위치 공개 여부 변수
  bool get isVisible => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError; //갤러리
  List<SelectedImage> get selectedImages => throw _privateConstructorUsedError;

  /// Create a copy of CommunityTownState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      bool deleteArticle,
      List<CommentData> townReplyList,
      int? selectContentId,
      List<Content> contentList,
      bool isDongNaeLoading,
      bool isDongNaeHasMore,
      String selectTown,
      String selectLongTownAddress,
      List<String> townLongAddressList,
      List<String> townList,
      String townCategory,
      String writingTownCategory,
      int parentCommentId,
      dynamic isChildCommentState,
      int editChildCommentId,
      bool isEditChildCommentState,
      bool isEditState,
      int editCommentId,
      String reportType,
      bool isVisible,
      double latitude,
      double longitude,
      List<SelectedImage> selectedImages});
}

/// @nodoc
class _$CommunityTownStateCopyWithImpl<$Res, $Val extends CommunityTownState>
    implements $CommunityTownStateCopyWith<$Res> {
  _$CommunityTownStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityTownState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentDetail = null,
    Object? deleteArticle = null,
    Object? townReplyList = null,
    Object? selectContentId = freezed,
    Object? contentList = null,
    Object? isDongNaeLoading = null,
    Object? isDongNaeHasMore = null,
    Object? selectTown = null,
    Object? selectLongTownAddress = null,
    Object? townLongAddressList = null,
    Object? townList = null,
    Object? townCategory = null,
    Object? writingTownCategory = null,
    Object? parentCommentId = null,
    Object? isChildCommentState = freezed,
    Object? editChildCommentId = null,
    Object? isEditChildCommentState = null,
    Object? isEditState = null,
    Object? editCommentId = null,
    Object? reportType = null,
    Object? isVisible = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? selectedImages = null,
  }) {
    return _then(_value.copyWith(
      contentDetail: null == contentDetail
          ? _value.contentDetail
          : contentDetail // ignore: cast_nullable_to_non_nullable
              as ContentDetail,
      deleteArticle: null == deleteArticle
          ? _value.deleteArticle
          : deleteArticle // ignore: cast_nullable_to_non_nullable
              as bool,
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
              as List<Content>,
      isDongNaeLoading: null == isDongNaeLoading
          ? _value.isDongNaeLoading
          : isDongNaeLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDongNaeHasMore: null == isDongNaeHasMore
          ? _value.isDongNaeHasMore
          : isDongNaeHasMore // ignore: cast_nullable_to_non_nullable
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
      townCategory: null == townCategory
          ? _value.townCategory
          : townCategory // ignore: cast_nullable_to_non_nullable
              as String,
      writingTownCategory: null == writingTownCategory
          ? _value.writingTownCategory
          : writingTownCategory // ignore: cast_nullable_to_non_nullable
              as String,
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
      reportType: null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String,
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
      selectedImages: null == selectedImages
          ? _value.selectedImages
          : selectedImages // ignore: cast_nullable_to_non_nullable
              as List<SelectedImage>,
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
      bool deleteArticle,
      List<CommentData> townReplyList,
      int? selectContentId,
      List<Content> contentList,
      bool isDongNaeLoading,
      bool isDongNaeHasMore,
      String selectTown,
      String selectLongTownAddress,
      List<String> townLongAddressList,
      List<String> townList,
      String townCategory,
      String writingTownCategory,
      int parentCommentId,
      dynamic isChildCommentState,
      int editChildCommentId,
      bool isEditChildCommentState,
      bool isEditState,
      int editCommentId,
      String reportType,
      bool isVisible,
      double latitude,
      double longitude,
      List<SelectedImage> selectedImages});
}

/// @nodoc
class __$$CommunityTownStateImplCopyWithImpl<$Res>
    extends _$CommunityTownStateCopyWithImpl<$Res, _$CommunityTownStateImpl>
    implements _$$CommunityTownStateImplCopyWith<$Res> {
  __$$CommunityTownStateImplCopyWithImpl(_$CommunityTownStateImpl _value,
      $Res Function(_$CommunityTownStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityTownState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentDetail = null,
    Object? deleteArticle = null,
    Object? townReplyList = null,
    Object? selectContentId = freezed,
    Object? contentList = null,
    Object? isDongNaeLoading = null,
    Object? isDongNaeHasMore = null,
    Object? selectTown = null,
    Object? selectLongTownAddress = null,
    Object? townLongAddressList = null,
    Object? townList = null,
    Object? townCategory = null,
    Object? writingTownCategory = null,
    Object? parentCommentId = null,
    Object? isChildCommentState = freezed,
    Object? editChildCommentId = null,
    Object? isEditChildCommentState = null,
    Object? isEditState = null,
    Object? editCommentId = null,
    Object? reportType = null,
    Object? isVisible = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? selectedImages = null,
  }) {
    return _then(_$CommunityTownStateImpl(
      contentDetail: null == contentDetail
          ? _value.contentDetail
          : contentDetail // ignore: cast_nullable_to_non_nullable
              as ContentDetail,
      deleteArticle: null == deleteArticle
          ? _value.deleteArticle
          : deleteArticle // ignore: cast_nullable_to_non_nullable
              as bool,
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
              as List<Content>,
      isDongNaeLoading: null == isDongNaeLoading
          ? _value.isDongNaeLoading
          : isDongNaeLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDongNaeHasMore: null == isDongNaeHasMore
          ? _value.isDongNaeHasMore
          : isDongNaeHasMore // ignore: cast_nullable_to_non_nullable
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
      townCategory: null == townCategory
          ? _value.townCategory
          : townCategory // ignore: cast_nullable_to_non_nullable
              as String,
      writingTownCategory: null == writingTownCategory
          ? _value.writingTownCategory
          : writingTownCategory // ignore: cast_nullable_to_non_nullable
              as String,
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
      reportType: null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String,
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
      selectedImages: null == selectedImages
          ? _value._selectedImages
          : selectedImages // ignore: cast_nullable_to_non_nullable
              as List<SelectedImage>,
    ));
  }
}

/// @nodoc

class _$CommunityTownStateImpl implements _CommunityTownState {
  _$CommunityTownStateImpl(
      {this.contentDetail = const ContentDetail(),
      this.deleteArticle = false,
      final List<CommentData> townReplyList = const [],
      this.selectContentId = null,
      final List<Content> contentList = const [],
      this.isDongNaeLoading = true,
      this.isDongNaeHasMore = true,
      this.selectTown = '',
      this.selectLongTownAddress = '',
      final List<String> townLongAddressList = const [],
      final List<String> townList = const [],
      this.townCategory = '전체',
      this.writingTownCategory = '',
      this.parentCommentId = 0,
      this.isChildCommentState = false,
      this.editChildCommentId = 0,
      this.isEditChildCommentState = false,
      this.isEditState = false,
      this.editCommentId = 0,
      this.reportType = '',
      this.isVisible = false,
      this.latitude = 0.0,
      this.longitude = 0.0,
      final List<SelectedImage> selectedImages = const []})
      : _townReplyList = townReplyList,
        _contentList = contentList,
        _townLongAddressList = townLongAddressList,
        _townList = townList,
        _selectedImages = selectedImages;

//동네생활 게시글 상세조회
  @override
  @JsonKey()
  final ContentDetail contentDetail;
//게시글 삭제상태
  @override
  @JsonKey()
  final bool deleteArticle;
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
  final List<Content> _contentList;
//동네생활 컨텐츠 리스트
  @override
  @JsonKey()
  List<Content> get contentList {
    if (_contentList is EqualUnmodifiableListView) return _contentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentList);
  }

//동네생활 로딩 상태
  @override
  @JsonKey()
  final bool isDongNaeLoading;
//동네생활 컨텐츠 더있는가
  @override
  @JsonKey()
  final bool isDongNaeHasMore;
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

//동네생활 선택 카테고리
  @override
  @JsonKey()
  final String townCategory;
//동네생활 글쓰기 선택 카테고리
  @override
  @JsonKey()
  final String writingTownCategory;
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
//신고하기
  @override
  @JsonKey()
  final String reportType;
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
//갤러리
  final List<SelectedImage> _selectedImages;
//갤러리
  @override
  @JsonKey()
  List<SelectedImage> get selectedImages {
    if (_selectedImages is EqualUnmodifiableListView) return _selectedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedImages);
  }

  @override
  String toString() {
    return 'CommunityTownState(contentDetail: $contentDetail, deleteArticle: $deleteArticle, townReplyList: $townReplyList, selectContentId: $selectContentId, contentList: $contentList, isDongNaeLoading: $isDongNaeLoading, isDongNaeHasMore: $isDongNaeHasMore, selectTown: $selectTown, selectLongTownAddress: $selectLongTownAddress, townLongAddressList: $townLongAddressList, townList: $townList, townCategory: $townCategory, writingTownCategory: $writingTownCategory, parentCommentId: $parentCommentId, isChildCommentState: $isChildCommentState, editChildCommentId: $editChildCommentId, isEditChildCommentState: $isEditChildCommentState, isEditState: $isEditState, editCommentId: $editCommentId, reportType: $reportType, isVisible: $isVisible, latitude: $latitude, longitude: $longitude, selectedImages: $selectedImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityTownStateImpl &&
            (identical(other.contentDetail, contentDetail) ||
                other.contentDetail == contentDetail) &&
            (identical(other.deleteArticle, deleteArticle) ||
                other.deleteArticle == deleteArticle) &&
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
            (identical(other.selectTown, selectTown) ||
                other.selectTown == selectTown) &&
            (identical(other.selectLongTownAddress, selectLongTownAddress) ||
                other.selectLongTownAddress == selectLongTownAddress) &&
            const DeepCollectionEquality()
                .equals(other._townLongAddressList, _townLongAddressList) &&
            const DeepCollectionEquality().equals(other._townList, _townList) &&
            (identical(other.townCategory, townCategory) ||
                other.townCategory == townCategory) &&
            (identical(other.writingTownCategory, writingTownCategory) ||
                other.writingTownCategory == writingTownCategory) &&
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
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality()
                .equals(other._selectedImages, _selectedImages));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        contentDetail,
        deleteArticle,
        const DeepCollectionEquality().hash(_townReplyList),
        selectContentId,
        const DeepCollectionEquality().hash(_contentList),
        isDongNaeLoading,
        isDongNaeHasMore,
        selectTown,
        selectLongTownAddress,
        const DeepCollectionEquality().hash(_townLongAddressList),
        const DeepCollectionEquality().hash(_townList),
        townCategory,
        writingTownCategory,
        parentCommentId,
        const DeepCollectionEquality().hash(isChildCommentState),
        editChildCommentId,
        isEditChildCommentState,
        isEditState,
        editCommentId,
        reportType,
        isVisible,
        latitude,
        longitude,
        const DeepCollectionEquality().hash(_selectedImages)
      ]);

  /// Create a copy of CommunityTownState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityTownStateImplCopyWith<_$CommunityTownStateImpl> get copyWith =>
      __$$CommunityTownStateImplCopyWithImpl<_$CommunityTownStateImpl>(
          this, _$identity);
}

abstract class _CommunityTownState implements CommunityTownState {
  factory _CommunityTownState(
      {final ContentDetail contentDetail,
      final bool deleteArticle,
      final List<CommentData> townReplyList,
      final int? selectContentId,
      final List<Content> contentList,
      final bool isDongNaeLoading,
      final bool isDongNaeHasMore,
      final String selectTown,
      final String selectLongTownAddress,
      final List<String> townLongAddressList,
      final List<String> townList,
      final String townCategory,
      final String writingTownCategory,
      final int parentCommentId,
      final dynamic isChildCommentState,
      final int editChildCommentId,
      final bool isEditChildCommentState,
      final bool isEditState,
      final int editCommentId,
      final String reportType,
      final bool isVisible,
      final double latitude,
      final double longitude,
      final List<SelectedImage> selectedImages}) = _$CommunityTownStateImpl;

  @override //동네생활 게시글 상세조회
  ContentDetail get contentDetail;
  @override //게시글 삭제상태
  bool get deleteArticle;
  @override //동네생활 댓글 상태
  List<CommentData> get townReplyList;
  @override
  int? get selectContentId;
  @override //동네생활 컨텐츠 리스트
  List<Content> get contentList;
  @override //동네생활 로딩 상태
  bool get isDongNaeLoading;
  @override //동네생활 컨텐츠 더있는가
  bool get isDongNaeHasMore;
  @override //동네생활 선택한 동네
  String get selectTown;
  @override
  String get selectLongTownAddress;
  @override
  List<String> get townLongAddressList;
  @override
  List<String> get townList;
  @override //동네생활 선택 카테고리
  String get townCategory;
  @override //동네생활 글쓰기 선택 카테고리
  String get writingTownCategory;
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
  @override //신고하기
  String get reportType;
  @override //위치 공개 여부 변수
  bool get isVisible;
  @override
  double get latitude;
  @override
  double get longitude;
  @override //갤러리
  List<SelectedImage> get selectedImages;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityTownStateImplCopyWith<_$CommunityTownStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
