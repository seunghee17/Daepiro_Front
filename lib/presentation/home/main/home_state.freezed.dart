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
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isOccurred => throw _privateConstructorUsedError;
  int get selectedPopularPostCategory => throw _privateConstructorUsedError;
  int get selectedContentsCategory => throw _privateConstructorUsedError;
  bool get isLoadingDisasterHistory => throw _privateConstructorUsedError;
  List<DisasterHistory> get disasterHistoryList =>
      throw _privateConstructorUsedError;
  int get isLoadingPopularPost => throw _privateConstructorUsedError;
  List<PopularPost> get popularPostList =>
      throw _privateConstructorUsedError; // selected 인기게시글 카테고리
  List<List<PopularPost>> get allPopularPostList =>
      throw _privateConstructorUsedError; // 인기게시글 - 전체
  bool get isLoadingContents => throw _privateConstructorUsedError;
  List<Contents> get contentsList => throw _privateConstructorUsedError;
  bool get isLoadingSponsor => throw _privateConstructorUsedError;
  List<Sponsor> get sponsorList => throw _privateConstructorUsedError;
  int get selectedDisasterHistoryType => throw _privateConstructorUsedError;
  List<DisastersData> get disastersList => throw _privateConstructorUsedError;
  BehaviorData? get behaviorTip => throw _privateConstructorUsedError;
  List<Notification> get notificationList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String location,
      String nickname,
      bool isLoading,
      bool isOccurred,
      int selectedPopularPostCategory,
      int selectedContentsCategory,
      bool isLoadingDisasterHistory,
      List<DisasterHistory> disasterHistoryList,
      int isLoadingPopularPost,
      List<PopularPost> popularPostList,
      List<List<PopularPost>> allPopularPostList,
      bool isLoadingContents,
      List<Contents> contentsList,
      bool isLoadingSponsor,
      List<Sponsor> sponsorList,
      int selectedDisasterHistoryType,
      List<DisastersData> disastersList,
      BehaviorData? behaviorTip,
      List<Notification> notificationList});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? location = null,
    Object? nickname = null,
    Object? isLoading = null,
    Object? isOccurred = null,
    Object? selectedPopularPostCategory = null,
    Object? selectedContentsCategory = null,
    Object? isLoadingDisasterHistory = null,
    Object? disasterHistoryList = null,
    Object? isLoadingPopularPost = null,
    Object? popularPostList = null,
    Object? allPopularPostList = null,
    Object? isLoadingContents = null,
    Object? contentsList = null,
    Object? isLoadingSponsor = null,
    Object? sponsorList = null,
    Object? selectedDisasterHistoryType = null,
    Object? disastersList = null,
    Object? behaviorTip = freezed,
    Object? notificationList = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
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
      isLoadingPopularPost: null == isLoadingPopularPost
          ? _value.isLoadingPopularPost
          : isLoadingPopularPost // ignore: cast_nullable_to_non_nullable
              as int,
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
      isLoadingSponsor: null == isLoadingSponsor
          ? _value.isLoadingSponsor
          : isLoadingSponsor // ignore: cast_nullable_to_non_nullable
              as bool,
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
      behaviorTip: freezed == behaviorTip
          ? _value.behaviorTip
          : behaviorTip // ignore: cast_nullable_to_non_nullable
              as BehaviorData?,
      notificationList: null == notificationList
          ? _value.notificationList
          : notificationList // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
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
      {double latitude,
      double longitude,
      String location,
      String nickname,
      bool isLoading,
      bool isOccurred,
      int selectedPopularPostCategory,
      int selectedContentsCategory,
      bool isLoadingDisasterHistory,
      List<DisasterHistory> disasterHistoryList,
      int isLoadingPopularPost,
      List<PopularPost> popularPostList,
      List<List<PopularPost>> allPopularPostList,
      bool isLoadingContents,
      List<Contents> contentsList,
      bool isLoadingSponsor,
      List<Sponsor> sponsorList,
      int selectedDisasterHistoryType,
      List<DisastersData> disastersList,
      BehaviorData? behaviorTip,
      List<Notification> notificationList});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? location = null,
    Object? nickname = null,
    Object? isLoading = null,
    Object? isOccurred = null,
    Object? selectedPopularPostCategory = null,
    Object? selectedContentsCategory = null,
    Object? isLoadingDisasterHistory = null,
    Object? disasterHistoryList = null,
    Object? isLoadingPopularPost = null,
    Object? popularPostList = null,
    Object? allPopularPostList = null,
    Object? isLoadingContents = null,
    Object? contentsList = null,
    Object? isLoadingSponsor = null,
    Object? sponsorList = null,
    Object? selectedDisasterHistoryType = null,
    Object? disastersList = null,
    Object? behaviorTip = freezed,
    Object? notificationList = null,
  }) {
    return _then(_$HomeStateImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
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
      isLoadingPopularPost: null == isLoadingPopularPost
          ? _value.isLoadingPopularPost
          : isLoadingPopularPost // ignore: cast_nullable_to_non_nullable
              as int,
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
      isLoadingSponsor: null == isLoadingSponsor
          ? _value.isLoadingSponsor
          : isLoadingSponsor // ignore: cast_nullable_to_non_nullable
              as bool,
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
      behaviorTip: freezed == behaviorTip
          ? _value.behaviorTip
          : behaviorTip // ignore: cast_nullable_to_non_nullable
              as BehaviorData?,
      notificationList: null == notificationList
          ? _value._notificationList
          : notificationList // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  _$HomeStateImpl(
      {this.latitude = 0,
      this.longitude = 0,
      this.location = "",
      this.nickname = "",
      this.isLoading = true,
      this.isOccurred = false,
      this.selectedPopularPostCategory = 0,
      this.selectedContentsCategory = 0,
      this.isLoadingDisasterHistory = true,
      final List<DisasterHistory> disasterHistoryList = const [],
      this.isLoadingPopularPost = 0,
      final List<PopularPost> popularPostList = const [],
      final List<List<PopularPost>> allPopularPostList = const [],
      this.isLoadingContents = true,
      final List<Contents> contentsList = const [],
      this.isLoadingSponsor = true,
      final List<Sponsor> sponsorList = const [],
      this.selectedDisasterHistoryType = 0,
      final List<DisastersData> disastersList = const [],
      this.behaviorTip = null,
      final List<Notification> notificationList = const []})
      : _disasterHistoryList = disasterHistoryList,
        _popularPostList = popularPostList,
        _allPopularPostList = allPopularPostList,
        _contentsList = contentsList,
        _sponsorList = sponsorList,
        _disastersList = disastersList,
        _notificationList = notificationList;

  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final String nickname;
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

  @override
  @JsonKey()
  final int isLoadingPopularPost;
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
  final bool isLoadingSponsor;
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
  @JsonKey()
  final BehaviorData? behaviorTip;
  final List<Notification> _notificationList;
  @override
  @JsonKey()
  List<Notification> get notificationList {
    if (_notificationList is EqualUnmodifiableListView)
      return _notificationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationList);
  }

  @override
  String toString() {
    return 'HomeState(latitude: $latitude, longitude: $longitude, location: $location, nickname: $nickname, isLoading: $isLoading, isOccurred: $isOccurred, selectedPopularPostCategory: $selectedPopularPostCategory, selectedContentsCategory: $selectedContentsCategory, isLoadingDisasterHistory: $isLoadingDisasterHistory, disasterHistoryList: $disasterHistoryList, isLoadingPopularPost: $isLoadingPopularPost, popularPostList: $popularPostList, allPopularPostList: $allPopularPostList, isLoadingContents: $isLoadingContents, contentsList: $contentsList, isLoadingSponsor: $isLoadingSponsor, sponsorList: $sponsorList, selectedDisasterHistoryType: $selectedDisasterHistoryType, disastersList: $disastersList, behaviorTip: $behaviorTip, notificationList: $notificationList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOccurred, isOccurred) ||
                other.isOccurred == isOccurred) &&
            (identical(other.selectedPopularPostCategory, selectedPopularPostCategory) ||
                other.selectedPopularPostCategory ==
                    selectedPopularPostCategory) &&
            (identical(other.selectedContentsCategory, selectedContentsCategory) ||
                other.selectedContentsCategory == selectedContentsCategory) &&
            (identical(other.isLoadingDisasterHistory, isLoadingDisasterHistory) ||
                other.isLoadingDisasterHistory == isLoadingDisasterHistory) &&
            const DeepCollectionEquality()
                .equals(other._disasterHistoryList, _disasterHistoryList) &&
            (identical(other.isLoadingPopularPost, isLoadingPopularPost) ||
                other.isLoadingPopularPost == isLoadingPopularPost) &&
            const DeepCollectionEquality()
                .equals(other._popularPostList, _popularPostList) &&
            const DeepCollectionEquality()
                .equals(other._allPopularPostList, _allPopularPostList) &&
            (identical(other.isLoadingContents, isLoadingContents) ||
                other.isLoadingContents == isLoadingContents) &&
            const DeepCollectionEquality()
                .equals(other._contentsList, _contentsList) &&
            (identical(other.isLoadingSponsor, isLoadingSponsor) ||
                other.isLoadingSponsor == isLoadingSponsor) &&
            const DeepCollectionEquality()
                .equals(other._sponsorList, _sponsorList) &&
            (identical(other.selectedDisasterHistoryType,
                    selectedDisasterHistoryType) ||
                other.selectedDisasterHistoryType ==
                    selectedDisasterHistoryType) &&
            const DeepCollectionEquality()
                .equals(other._disastersList, _disastersList) &&
            (identical(other.behaviorTip, behaviorTip) ||
                other.behaviorTip == behaviorTip) &&
            const DeepCollectionEquality()
                .equals(other._notificationList, _notificationList));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        latitude,
        longitude,
        location,
        nickname,
        isLoading,
        isOccurred,
        selectedPopularPostCategory,
        selectedContentsCategory,
        isLoadingDisasterHistory,
        const DeepCollectionEquality().hash(_disasterHistoryList),
        isLoadingPopularPost,
        const DeepCollectionEquality().hash(_popularPostList),
        const DeepCollectionEquality().hash(_allPopularPostList),
        isLoadingContents,
        const DeepCollectionEquality().hash(_contentsList),
        isLoadingSponsor,
        const DeepCollectionEquality().hash(_sponsorList),
        selectedDisasterHistoryType,
        const DeepCollectionEquality().hash(_disastersList),
        behaviorTip,
        const DeepCollectionEquality().hash(_notificationList)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final double latitude,
      final double longitude,
      final String location,
      final String nickname,
      final bool isLoading,
      final bool isOccurred,
      final int selectedPopularPostCategory,
      final int selectedContentsCategory,
      final bool isLoadingDisasterHistory,
      final List<DisasterHistory> disasterHistoryList,
      final int isLoadingPopularPost,
      final List<PopularPost> popularPostList,
      final List<List<PopularPost>> allPopularPostList,
      final bool isLoadingContents,
      final List<Contents> contentsList,
      final bool isLoadingSponsor,
      final List<Sponsor> sponsorList,
      final int selectedDisasterHistoryType,
      final List<DisastersData> disastersList,
      final BehaviorData? behaviorTip,
      final List<Notification> notificationList}) = _$HomeStateImpl;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get location;
  @override
  String get nickname;
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
  int get isLoadingPopularPost;
  @override
  List<PopularPost> get popularPostList;
  @override // selected 인기게시글 카테고리
  List<List<PopularPost>> get allPopularPostList;
  @override // 인기게시글 - 전체
  bool get isLoadingContents;
  @override
  List<Contents> get contentsList;
  @override
  bool get isLoadingSponsor;
  @override
  List<Sponsor> get sponsorList;
  @override
  int get selectedDisasterHistoryType;
  @override
  List<DisastersData> get disastersList;
  @override
  BehaviorData? get behaviorTip;
  @override
  List<Notification> get notificationList;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
