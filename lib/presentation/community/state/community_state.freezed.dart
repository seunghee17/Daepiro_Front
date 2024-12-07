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
//전체와 수신버튼 상태
// @Default(false) bool receiveButton,
// @Default(true) bool AllButton,
//현재 보여지는 상태
  bool get isDisasterScreen => throw _privateConstructorUsedError;
  bool get isDeleteComplete => throw _privateConstructorUsedError;
  String? get reportType => throw _privateConstructorUsedError; //갤러리 관련 상태 변수
  List<AlbumModel> get albums => throw _privateConstructorUsedError;
  int get currentAlbumIndex => throw _privateConstructorUsedError;
  List<AlbumModel> get selectAlbums =>
      throw _privateConstructorUsedError; //커뮤니티 유형별 데이터 상태
  List<Data> get allDisasterResponse => throw _privateConstructorUsedError;
  List<Data> get receivedDisasterResponse => throw _privateConstructorUsedError;
  int get listLength => throw _privateConstructorUsedError; //재난상황 로드 상태
  bool get isLoading => throw _privateConstructorUsedError; //재난상황 커뮤니티 타입
  String get disasterCommunityType => throw _privateConstructorUsedError;

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
      {bool isDisasterScreen,
      bool isDeleteComplete,
      String? reportType,
      List<AlbumModel> albums,
      int currentAlbumIndex,
      List<AlbumModel> selectAlbums,
      List<Data> allDisasterResponse,
      List<Data> receivedDisasterResponse,
      int listLength,
      bool isLoading,
      String disasterCommunityType});
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
    Object? isDisasterScreen = null,
    Object? isDeleteComplete = null,
    Object? reportType = freezed,
    Object? albums = null,
    Object? currentAlbumIndex = null,
    Object? selectAlbums = null,
    Object? allDisasterResponse = null,
    Object? receivedDisasterResponse = null,
    Object? listLength = null,
    Object? isLoading = null,
    Object? disasterCommunityType = null,
  }) {
    return _then(_value.copyWith(
      isDisasterScreen: null == isDisasterScreen
          ? _value.isDisasterScreen
          : isDisasterScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteComplete: null == isDeleteComplete
          ? _value.isDeleteComplete
          : isDeleteComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      reportType: freezed == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String?,
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
      disasterCommunityType: null == disasterCommunityType
          ? _value.disasterCommunityType
          : disasterCommunityType // ignore: cast_nullable_to_non_nullable
              as String,
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
      {bool isDisasterScreen,
      bool isDeleteComplete,
      String? reportType,
      List<AlbumModel> albums,
      int currentAlbumIndex,
      List<AlbumModel> selectAlbums,
      List<Data> allDisasterResponse,
      List<Data> receivedDisasterResponse,
      int listLength,
      bool isLoading,
      String disasterCommunityType});
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
    Object? isDisasterScreen = null,
    Object? isDeleteComplete = null,
    Object? reportType = freezed,
    Object? albums = null,
    Object? currentAlbumIndex = null,
    Object? selectAlbums = null,
    Object? allDisasterResponse = null,
    Object? receivedDisasterResponse = null,
    Object? listLength = null,
    Object? isLoading = null,
    Object? disasterCommunityType = null,
  }) {
    return _then(_$CommunityStateImpl(
      isDisasterScreen: null == isDisasterScreen
          ? _value.isDisasterScreen
          : isDisasterScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteComplete: null == isDeleteComplete
          ? _value.isDeleteComplete
          : isDeleteComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      reportType: freezed == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String?,
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
      disasterCommunityType: null == disasterCommunityType
          ? _value.disasterCommunityType
          : disasterCommunityType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CommunityStateImpl implements _CommunityState {
  _$CommunityStateImpl(
      {this.isDisasterScreen = true,
      this.isDeleteComplete = false,
      this.reportType = null,
      final List<AlbumModel> albums = const [],
      this.currentAlbumIndex = 0,
      final List<AlbumModel> selectAlbums = const [],
      final List<Data> allDisasterResponse = const [],
      final List<Data> receivedDisasterResponse = const [],
      this.listLength = 0,
      this.isLoading = true,
      this.disasterCommunityType = 'all'})
      : _albums = albums,
        _selectAlbums = selectAlbums,
        _allDisasterResponse = allDisasterResponse,
        _receivedDisasterResponse = receivedDisasterResponse;

//전체와 수신버튼 상태
// @Default(false) bool receiveButton,
// @Default(true) bool AllButton,
//현재 보여지는 상태
  @override
  @JsonKey()
  final bool isDisasterScreen;
  @override
  @JsonKey()
  final bool isDeleteComplete;
  @override
  @JsonKey()
  final String? reportType;
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
//재난상황 커뮤니티 타입
  @override
  @JsonKey()
  final String disasterCommunityType;

  @override
  String toString() {
    return 'CommunityState(isDisasterScreen: $isDisasterScreen, isDeleteComplete: $isDeleteComplete, reportType: $reportType, albums: $albums, currentAlbumIndex: $currentAlbumIndex, selectAlbums: $selectAlbums, allDisasterResponse: $allDisasterResponse, receivedDisasterResponse: $receivedDisasterResponse, listLength: $listLength, isLoading: $isLoading, disasterCommunityType: $disasterCommunityType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityStateImpl &&
            (identical(other.isDisasterScreen, isDisasterScreen) ||
                other.isDisasterScreen == isDisasterScreen) &&
            (identical(other.isDeleteComplete, isDeleteComplete) ||
                other.isDeleteComplete == isDeleteComplete) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            const DeepCollectionEquality().equals(other._albums, _albums) &&
            (identical(other.currentAlbumIndex, currentAlbumIndex) ||
                other.currentAlbumIndex == currentAlbumIndex) &&
            const DeepCollectionEquality()
                .equals(other._selectAlbums, _selectAlbums) &&
            const DeepCollectionEquality()
                .equals(other._allDisasterResponse, _allDisasterResponse) &&
            const DeepCollectionEquality().equals(
                other._receivedDisasterResponse, _receivedDisasterResponse) &&
            (identical(other.listLength, listLength) ||
                other.listLength == listLength) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.disasterCommunityType, disasterCommunityType) ||
                other.disasterCommunityType == disasterCommunityType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isDisasterScreen,
      isDeleteComplete,
      reportType,
      const DeepCollectionEquality().hash(_albums),
      currentAlbumIndex,
      const DeepCollectionEquality().hash(_selectAlbums),
      const DeepCollectionEquality().hash(_allDisasterResponse),
      const DeepCollectionEquality().hash(_receivedDisasterResponse),
      listLength,
      isLoading,
      disasterCommunityType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityStateImplCopyWith<_$CommunityStateImpl> get copyWith =>
      __$$CommunityStateImplCopyWithImpl<_$CommunityStateImpl>(
          this, _$identity);
}

abstract class _CommunityState implements CommunityState {
  factory _CommunityState(
      {final bool isDisasterScreen,
      final bool isDeleteComplete,
      final String? reportType,
      final List<AlbumModel> albums,
      final int currentAlbumIndex,
      final List<AlbumModel> selectAlbums,
      final List<Data> allDisasterResponse,
      final List<Data> receivedDisasterResponse,
      final int listLength,
      final bool isLoading,
      final String disasterCommunityType}) = _$CommunityStateImpl;

  @override //전체와 수신버튼 상태
// @Default(false) bool receiveButton,
// @Default(true) bool AllButton,
//현재 보여지는 상태
  bool get isDisasterScreen;
  @override
  bool get isDeleteComplete;
  @override
  String? get reportType;
  @override //갤러리 관련 상태 변수
  List<AlbumModel> get albums;
  @override
  int get currentAlbumIndex;
  @override
  List<AlbumModel> get selectAlbums;
  @override //커뮤니티 유형별 데이터 상태
  List<Data> get allDisasterResponse;
  @override
  List<Data> get receivedDisasterResponse;
  @override
  int get listLength;
  @override //재난상황 로드 상태
  bool get isLoading;
  @override //재난상황 커뮤니티 타입
  String get disasterCommunityType;
  @override
  @JsonKey(ignore: true)
  _$$CommunityStateImplCopyWith<_$CommunityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
