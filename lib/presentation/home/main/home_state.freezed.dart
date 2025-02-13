// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isOccurred => throw _privateConstructorUsedError;
  int get selectedPopularPostCategory => throw _privateConstructorUsedError;
  int get selectedContentsCategory => throw _privateConstructorUsedError;
  bool get isLoadingDisasterHistory => throw _privateConstructorUsedError;
  List<DisasterHistory> get disasterHistoryList =>
      throw _privateConstructorUsedError;
  List<PopularPost> get popularPostList =>
      throw _privateConstructorUsedError; // selected 인기게시글 카테고리
  List<List<PopularPost>> get allPopularPostList =>
      throw _privateConstructorUsedError; // 인기게시글 - 전체
// @Default([]) List<PopularPost> popularPostList0,   // 인기게시글 - 전체
// @Default([]) List<PopularPost> popularPostList1,   // 인기게시글 - 일상
// @Default([]) List<PopularPost> popularPostList2,   // 인기게시글 - 교통
// @Default([]) List<PopularPost> popularPostList3,   // 인기게시글 - 치안
// @Default([]) List<PopularPost> popularPostList4,   // 인기게시글 - 기타
  bool get isLoadingContents => throw _privateConstructorUsedError;
  List<Contents> get contentsList => throw _privateConstructorUsedError;
  int get isLoadingPopularPost => throw _privateConstructorUsedError;
  List<Sponsor> get sponsorList => throw _privateConstructorUsedError;
  int get selectedDisasterHistoryType => throw _privateConstructorUsedError;
  List<DisastersData> get disastersList => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isOccurred,
      int selectedPopularPostCategory,
      int selectedContentsCategory,
      bool isLoadingDisasterHistory,
      List<DisasterHistory> disasterHistoryList,
      List<PopularPost> popularPostList,
      List<List<PopularPost>> allPopularPostList,
      bool isLoadingContents,
      List<Contents> contentsList,
      int isLoadingPopularPost,
      List<Sponsor> sponsorList,
      int selectedDisasterHistoryType,
      List<DisastersData> disastersList});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isOccurred = null,
    Object? selectedPopularPostCategory = null,
    Object? selectedContentsCategory = null,
    Object? isLoadingDisasterHistory = null,
    Object? disasterHistoryList = null,
    Object? popularPostList = null,
    Object? allPopularPostList = null,
    Object? isLoadingContents = null,
    Object? contentsList = null,
    Object? isLoadingPopularPost = null,
    Object? sponsorList = null,
    Object? selectedDisasterHistoryType = null,
    Object? disastersList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOccurred: null == isOccurred
          ? _value.isOccurred
          : isOccurred // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPopularPostCategory: null == selectedPopularPostCategory
          ? _value.selectedPopularPostCategory
          : selectedPopularPostCategory // ignore: cast_nullable_to_non_nullable
              as int,
      selectedContentsCategory: null == selectedContentsCategory
          ? _value.selectedContentsCategory
          : selectedContentsCategory // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadingDisasterHistory: null == isLoadingDisasterHistory
          ? _value.isLoadingDisasterHistory
          : isLoadingDisasterHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      disasterHistoryList: null == disasterHistoryList
          ? _value.disasterHistoryList
          : disasterHistoryList // ignore: cast_nullable_to_non_nullable
              as List<DisasterHistory>,
      popularPostList: null == popularPostList
          ? _value.popularPostList
          : popularPostList // ignore: cast_nullable_to_non_nullable
              as List<PopularPost>,
      allPopularPostList: null == allPopularPostList
          ? _value.allPopularPostList
          : allPopularPostList // ignore: cast_nullable_to_non_nullable
              as List<List<PopularPost>>,
      isLoadingContents: null == isLoadingContents
          ? _value.isLoadingContents
          : isLoadingContents // ignore: cast_nullable_to_non_nullable
              as bool,
      contentsList: null == contentsList
          ? _value.contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
      isLoadingPopularPost: null == isLoadingPopularPost
          ? _value.isLoadingPopularPost
          : isLoadingPopularPost // ignore: cast_nullable_to_non_nullable
              as int,
      sponsorList: null == sponsorList
          ? _value.sponsorList
          : sponsorList // ignore: cast_nullable_to_non_nullable
              as List<Sponsor>,
      selectedDisasterHistoryType: null == selectedDisasterHistoryType
          ? _value.selectedDisasterHistoryType
          : selectedDisasterHistoryType // ignore: cast_nullable_to_non_nullable
              as int,
      disastersList: null == disastersList
          ? _value.disastersList
          : disastersList // ignore: cast_nullable_to_non_nullable
              as List<DisastersData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isOccurred,
      int selectedPopularPostCategory,
      int selectedContentsCategory,
      bool isLoadingDisasterHistory,
      List<DisasterHistory> disasterHistoryList,
      List<PopularPost> popularPostList,
      List<List<PopularPost>> allPopularPostList,
      bool isLoadingContents,
      List<Contents> contentsList,
      int isLoadingPopularPost,
      List<Sponsor> sponsorList,
      int selectedDisasterHistoryType,
      List<DisastersData> disastersList});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isOccurred = null,
    Object? selectedPopularPostCategory = null,
    Object? selectedContentsCategory = null,
    Object? isLoadingDisasterHistory = null,
    Object? disasterHistoryList = null,
    Object? popularPostList = null,
    Object? allPopularPostList = null,
    Object? isLoadingContents = null,
    Object? contentsList = null,
    Object? isLoadingPopularPost = null,
    Object? sponsorList = null,
    Object? selectedDisasterHistoryType = null,
    Object? disastersList = null,
  }) {
    return _then(_$HomeStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOccurred: null == isOccurred
          ? _value.isOccurred
          : isOccurred // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPopularPostCategory: null == selectedPopularPostCategory
          ? _value.selectedPopularPostCategory
          : selectedPopularPostCategory // ignore: cast_nullable_to_non_nullable
              as int,
      selectedContentsCategory: null == selectedContentsCategory
          ? _value.selectedContentsCategory
          : selectedContentsCategory // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadingDisasterHistory: null == isLoadingDisasterHistory
          ? _value.isLoadingDisasterHistory
          : isLoadingDisasterHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      disasterHistoryList: null == disasterHistoryList
          ? _value._disasterHistoryList
          : disasterHistoryList // ignore: cast_nullable_to_non_nullable
              as List<DisasterHistory>,
      popularPostList: null == popularPostList
          ? _value._popularPostList
          : popularPostList // ignore: cast_nullable_to_non_nullable
              as List<PopularPost>,
      allPopularPostList: null == allPopularPostList
          ? _value._allPopularPostList
          : allPopularPostList // ignore: cast_nullable_to_non_nullable
              as List<List<PopularPost>>,
      isLoadingContents: null == isLoadingContents
          ? _value.isLoadingContents
          : isLoadingContents // ignore: cast_nullable_to_non_nullable
              as bool,
      contentsList: null == contentsList
          ? _value._contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
      isLoadingPopularPost: null == isLoadingPopularPost
          ? _value.isLoadingPopularPost
          : isLoadingPopularPost // ignore: cast_nullable_to_non_nullable
              as int,
      sponsorList: null == sponsorList
          ? _value._sponsorList
          : sponsorList // ignore: cast_nullable_to_non_nullable
              as List<Sponsor>,
      selectedDisasterHistoryType: null == selectedDisasterHistoryType
          ? _value.selectedDisasterHistoryType
          : selectedDisasterHistoryType // ignore: cast_nullable_to_non_nullable
              as int,
      disastersList: null == disastersList
          ? _value._disastersList
          : disastersList // ignore: cast_nullable_to_non_nullable
              as List<DisastersData>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  _$HomeStateImpl(
      {this.isLoading = false,
      this.isOccurred = false,
      this.selectedPopularPostCategory = 0,
      this.selectedContentsCategory = 0,
      this.isLoadingDisasterHistory = true,
      final List<DisasterHistory> disasterHistoryList = const [],
      final List<PopularPost> popularPostList = const [],
      final List<List<PopularPost>> allPopularPostList = const [],
      this.isLoadingContents = true,
      final List<Contents> contentsList = const [],
      this.isLoadingPopularPost = 0,
      final List<Sponsor> sponsorList = const [],
      this.selectedDisasterHistoryType = 0,
      final List<DisastersData> disastersList = const []})
      : _disasterHistoryList = disasterHistoryList,
        _popularPostList = popularPostList,
        _allPopularPostList = allPopularPostList,
        _contentsList = contentsList,
        _sponsorList = sponsorList,
        _disastersList = disastersList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isOccurred;
  @override
  @JsonKey()
  final int selectedPopularPostCategory;
  @override
  @JsonKey()
  final int selectedContentsCategory;
  @override
  @JsonKey()
  final bool isLoadingDisasterHistory;
  final List<DisasterHistory> _disasterHistoryList;
  @override
  @JsonKey()
  List<DisasterHistory> get disasterHistoryList {
    if (_disasterHistoryList is EqualUnmodifiableListView)
      return _disasterHistoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disasterHistoryList);
  }

  final List<PopularPost> _popularPostList;
  @override
  @JsonKey()
  List<PopularPost> get popularPostList {
    if (_popularPostList is EqualUnmodifiableListView) return _popularPostList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularPostList);
  }

// selected 인기게시글 카테고리
  final List<List<PopularPost>> _allPopularPostList;
// selected 인기게시글 카테고리
  @override
  @JsonKey()
  List<List<PopularPost>> get allPopularPostList {
    if (_allPopularPostList is EqualUnmodifiableListView)
      return _allPopularPostList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allPopularPostList);
  }

// 인기게시글 - 전체
// @Default([]) List<PopularPost> popularPostList0,   // 인기게시글 - 전체
// @Default([]) List<PopularPost> popularPostList1,   // 인기게시글 - 일상
// @Default([]) List<PopularPost> popularPostList2,   // 인기게시글 - 교통
// @Default([]) List<PopularPost> popularPostList3,   // 인기게시글 - 치안
// @Default([]) List<PopularPost> popularPostList4,   // 인기게시글 - 기타
  @override
  @JsonKey()
  final bool isLoadingContents;
  final List<Contents> _contentsList;
  @override
  @JsonKey()
  List<Contents> get contentsList {
    if (_contentsList is EqualUnmodifiableListView) return _contentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentsList);
  }

  @override
  @JsonKey()
  final int isLoadingPopularPost;
  final List<Sponsor> _sponsorList;
  @override
  @JsonKey()
  List<Sponsor> get sponsorList {
    if (_sponsorList is EqualUnmodifiableListView) return _sponsorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sponsorList);
  }

  @override
  @JsonKey()
  final int selectedDisasterHistoryType;
  final List<DisastersData> _disastersList;
  @override
  @JsonKey()
  List<DisastersData> get disastersList {
    if (_disastersList is EqualUnmodifiableListView) return _disastersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disastersList);
  }

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, isOccurred: $isOccurred, selectedPopularPostCategory: $selectedPopularPostCategory, selectedContentsCategory: $selectedContentsCategory, isLoadingDisasterHistory: $isLoadingDisasterHistory, disasterHistoryList: $disasterHistoryList, popularPostList: $popularPostList, allPopularPostList: $allPopularPostList, isLoadingContents: $isLoadingContents, contentsList: $contentsList, isLoadingPopularPost: $isLoadingPopularPost, sponsorList: $sponsorList, selectedDisasterHistoryType: $selectedDisasterHistoryType, disastersList: $disastersList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOccurred, isOccurred) ||
                other.isOccurred == isOccurred) &&
            (identical(other.selectedPopularPostCategory,
                    selectedPopularPostCategory) ||
                other.selectedPopularPostCategory ==
                    selectedPopularPostCategory) &&
            (identical(
                    other.selectedContentsCategory, selectedContentsCategory) ||
                other.selectedContentsCategory == selectedContentsCategory) &&
            (identical(
                    other.isLoadingDisasterHistory, isLoadingDisasterHistory) ||
                other.isLoadingDisasterHistory == isLoadingDisasterHistory) &&
            const DeepCollectionEquality()
                .equals(other._disasterHistoryList, _disasterHistoryList) &&
            const DeepCollectionEquality()
                .equals(other._popularPostList, _popularPostList) &&
            const DeepCollectionEquality()
                .equals(other._allPopularPostList, _allPopularPostList) &&
            (identical(other.isLoadingContents, isLoadingContents) ||
                other.isLoadingContents == isLoadingContents) &&
            const DeepCollectionEquality()
                .equals(other._contentsList, _contentsList) &&
            (identical(other.isLoadingPopularPost, isLoadingPopularPost) ||
                other.isLoadingPopularPost == isLoadingPopularPost) &&
            const DeepCollectionEquality()
                .equals(other._sponsorList, _sponsorList) &&
            (identical(other.selectedDisasterHistoryType,
                    selectedDisasterHistoryType) ||
                other.selectedDisasterHistoryType ==
                    selectedDisasterHistoryType) &&
            const DeepCollectionEquality()
                .equals(other._disastersList, _disastersList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isOccurred,
      selectedPopularPostCategory,
      selectedContentsCategory,
      isLoadingDisasterHistory,
      const DeepCollectionEquality().hash(_disasterHistoryList),
      const DeepCollectionEquality().hash(_popularPostList),
      const DeepCollectionEquality().hash(_allPopularPostList),
      isLoadingContents,
      const DeepCollectionEquality().hash(_contentsList),
      isLoadingPopularPost,
      const DeepCollectionEquality().hash(_sponsorList),
      selectedDisasterHistoryType,
      const DeepCollectionEquality().hash(_disastersList));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final bool isLoading,
      final bool isOccurred,
      final int selectedPopularPostCategory,
      final int selectedContentsCategory,
      final bool isLoadingDisasterHistory,
      final List<DisasterHistory> disasterHistoryList,
      final List<PopularPost> popularPostList,
      final List<List<PopularPost>> allPopularPostList,
      final bool isLoadingContents,
      final List<Contents> contentsList,
      final int isLoadingPopularPost,
      final List<Sponsor> sponsorList,
      final int selectedDisasterHistoryType,
      final List<DisastersData> disastersList}) = _$HomeStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isOccurred;
  @override
  int get selectedPopularPostCategory;
  @override
  int get selectedContentsCategory;
  @override
  bool get isLoadingDisasterHistory;
  @override
  List<DisasterHistory> get disasterHistoryList;
  @override
  List<PopularPost> get popularPostList; // selected 인기게시글 카테고리
  @override
  List<List<PopularPost>> get allPopularPostList; // 인기게시글 - 전체
// @Default([]) List<PopularPost> popularPostList0,   // 인기게시글 - 전체
// @Default([]) List<PopularPost> popularPostList1,   // 인기게시글 - 일상
// @Default([]) List<PopularPost> popularPostList2,   // 인기게시글 - 교통
// @Default([]) List<PopularPost> popularPostList3,   // 인기게시글 - 치안
// @Default([]) List<PopularPost> popularPostList4,   // 인기게시글 - 기타
  @override
  bool get isLoadingContents;
  @override
  List<Contents> get contentsList;
  @override
  int get isLoadingPopularPost;
  @override
  List<Sponsor> get sponsorList;
  @override
  int get selectedDisasterHistoryType;
  @override
  List<DisastersData> get disastersList;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
