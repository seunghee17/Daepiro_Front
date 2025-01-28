// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'information_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InformationState {
  bool get isLoadingContents => throw _privateConstructorUsedError;
  bool get isLoadingShelters => throw _privateConstructorUsedError;
  List<Contents> get contentsList =>
      throw _privateConstructorUsedError; // 메인 재난콘텐츠 목록
  int get selectedAroundShelterType => throw _privateConstructorUsedError;
  String get myLocation => throw _privateConstructorUsedError;
  List<Shelters> get shelterList =>
      throw _privateConstructorUsedError; // 주변 대피소 리스트
  List<Shelters> get temperatureShelterList =>
      throw _privateConstructorUsedError; // 주변 대피소 리스트(전체)
  List<Shelters> get earthquakeShelterList =>
      throw _privateConstructorUsedError; // 주변 대피소 리스트(지진)
  List<Shelters> get tsunamiShelterList =>
      throw _privateConstructorUsedError; // 주변 대피소 리스트(수해)
  List<Shelters> get civilShelterList =>
      throw _privateConstructorUsedError; // 주변 대피소 리스트(전쟁)
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InformationStateCopyWith<InformationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformationStateCopyWith<$Res> {
  factory $InformationStateCopyWith(
          InformationState value, $Res Function(InformationState) then) =
      _$InformationStateCopyWithImpl<$Res, InformationState>;
  @useResult
  $Res call(
      {bool isLoadingContents,
      bool isLoadingShelters,
      List<Contents> contentsList,
      int selectedAroundShelterType,
      String myLocation,
      List<Shelters> shelterList,
      List<Shelters> temperatureShelterList,
      List<Shelters> earthquakeShelterList,
      List<Shelters> tsunamiShelterList,
      List<Shelters> civilShelterList,
      double latitude,
      double longitude});
}

/// @nodoc
class _$InformationStateCopyWithImpl<$Res, $Val extends InformationState>
    implements $InformationStateCopyWith<$Res> {
  _$InformationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingContents = null,
    Object? isLoadingShelters = null,
    Object? contentsList = null,
    Object? selectedAroundShelterType = null,
    Object? myLocation = null,
    Object? shelterList = null,
    Object? temperatureShelterList = null,
    Object? earthquakeShelterList = null,
    Object? tsunamiShelterList = null,
    Object? civilShelterList = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      isLoadingContents: null == isLoadingContents
          ? _value.isLoadingContents
          : isLoadingContents // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingShelters: null == isLoadingShelters
          ? _value.isLoadingShelters
          : isLoadingShelters // ignore: cast_nullable_to_non_nullable
              as bool,
      contentsList: null == contentsList
          ? _value.contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
      selectedAroundShelterType: null == selectedAroundShelterType
          ? _value.selectedAroundShelterType
          : selectedAroundShelterType // ignore: cast_nullable_to_non_nullable
              as int,
      myLocation: null == myLocation
          ? _value.myLocation
          : myLocation // ignore: cast_nullable_to_non_nullable
              as String,
      shelterList: null == shelterList
          ? _value.shelterList
          : shelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
      temperatureShelterList: null == temperatureShelterList
          ? _value.temperatureShelterList
          : temperatureShelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
      earthquakeShelterList: null == earthquakeShelterList
          ? _value.earthquakeShelterList
          : earthquakeShelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
      tsunamiShelterList: null == tsunamiShelterList
          ? _value.tsunamiShelterList
          : tsunamiShelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
      civilShelterList: null == civilShelterList
          ? _value.civilShelterList
          : civilShelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InformationStateImplCopyWith<$Res>
    implements $InformationStateCopyWith<$Res> {
  factory _$$InformationStateImplCopyWith(_$InformationStateImpl value,
          $Res Function(_$InformationStateImpl) then) =
      __$$InformationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingContents,
      bool isLoadingShelters,
      List<Contents> contentsList,
      int selectedAroundShelterType,
      String myLocation,
      List<Shelters> shelterList,
      List<Shelters> temperatureShelterList,
      List<Shelters> earthquakeShelterList,
      List<Shelters> tsunamiShelterList,
      List<Shelters> civilShelterList,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$InformationStateImplCopyWithImpl<$Res>
    extends _$InformationStateCopyWithImpl<$Res, _$InformationStateImpl>
    implements _$$InformationStateImplCopyWith<$Res> {
  __$$InformationStateImplCopyWithImpl(_$InformationStateImpl _value,
      $Res Function(_$InformationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingContents = null,
    Object? isLoadingShelters = null,
    Object? contentsList = null,
    Object? selectedAroundShelterType = null,
    Object? myLocation = null,
    Object? shelterList = null,
    Object? temperatureShelterList = null,
    Object? earthquakeShelterList = null,
    Object? tsunamiShelterList = null,
    Object? civilShelterList = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$InformationStateImpl(
      isLoadingContents: null == isLoadingContents
          ? _value.isLoadingContents
          : isLoadingContents // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingShelters: null == isLoadingShelters
          ? _value.isLoadingShelters
          : isLoadingShelters // ignore: cast_nullable_to_non_nullable
              as bool,
      contentsList: null == contentsList
          ? _value._contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
      selectedAroundShelterType: null == selectedAroundShelterType
          ? _value.selectedAroundShelterType
          : selectedAroundShelterType // ignore: cast_nullable_to_non_nullable
              as int,
      myLocation: null == myLocation
          ? _value.myLocation
          : myLocation // ignore: cast_nullable_to_non_nullable
              as String,
      shelterList: null == shelterList
          ? _value._shelterList
          : shelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
      temperatureShelterList: null == temperatureShelterList
          ? _value._temperatureShelterList
          : temperatureShelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
      earthquakeShelterList: null == earthquakeShelterList
          ? _value._earthquakeShelterList
          : earthquakeShelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
      tsunamiShelterList: null == tsunamiShelterList
          ? _value._tsunamiShelterList
          : tsunamiShelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
      civilShelterList: null == civilShelterList
          ? _value._civilShelterList
          : civilShelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$InformationStateImpl implements _InformationState {
  _$InformationStateImpl(
      {this.isLoadingContents = true,
      this.isLoadingShelters = true,
      final List<Contents> contentsList = const [],
      this.selectedAroundShelterType = 0,
      this.myLocation = "",
      final List<Shelters> shelterList = const [],
      final List<Shelters> temperatureShelterList = const [],
      final List<Shelters> earthquakeShelterList = const [],
      final List<Shelters> tsunamiShelterList = const [],
      final List<Shelters> civilShelterList = const [],
      this.latitude = 0,
      this.longitude = 0})
      : _contentsList = contentsList,
        _shelterList = shelterList,
        _temperatureShelterList = temperatureShelterList,
        _earthquakeShelterList = earthquakeShelterList,
        _tsunamiShelterList = tsunamiShelterList,
        _civilShelterList = civilShelterList;

  @override
  @JsonKey()
  final bool isLoadingContents;
  @override
  @JsonKey()
  final bool isLoadingShelters;
  final List<Contents> _contentsList;
  @override
  @JsonKey()
  List<Contents> get contentsList {
    if (_contentsList is EqualUnmodifiableListView) return _contentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentsList);
  }

// 메인 재난콘텐츠 목록
  @override
  @JsonKey()
  final int selectedAroundShelterType;
  @override
  @JsonKey()
  final String myLocation;
  final List<Shelters> _shelterList;
  @override
  @JsonKey()
  List<Shelters> get shelterList {
    if (_shelterList is EqualUnmodifiableListView) return _shelterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shelterList);
  }

// 주변 대피소 리스트
  final List<Shelters> _temperatureShelterList;
// 주변 대피소 리스트
  @override
  @JsonKey()
  List<Shelters> get temperatureShelterList {
    if (_temperatureShelterList is EqualUnmodifiableListView)
      return _temperatureShelterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_temperatureShelterList);
  }

// 주변 대피소 리스트(전체)
  final List<Shelters> _earthquakeShelterList;
// 주변 대피소 리스트(전체)
  @override
  @JsonKey()
  List<Shelters> get earthquakeShelterList {
    if (_earthquakeShelterList is EqualUnmodifiableListView)
      return _earthquakeShelterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_earthquakeShelterList);
  }

// 주변 대피소 리스트(지진)
  final List<Shelters> _tsunamiShelterList;
// 주변 대피소 리스트(지진)
  @override
  @JsonKey()
  List<Shelters> get tsunamiShelterList {
    if (_tsunamiShelterList is EqualUnmodifiableListView)
      return _tsunamiShelterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tsunamiShelterList);
  }

// 주변 대피소 리스트(수해)
  final List<Shelters> _civilShelterList;
// 주변 대피소 리스트(수해)
  @override
  @JsonKey()
  List<Shelters> get civilShelterList {
    if (_civilShelterList is EqualUnmodifiableListView)
      return _civilShelterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_civilShelterList);
  }

// 주변 대피소 리스트(전쟁)
  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;

  @override
  String toString() {
    return 'InformationState(isLoadingContents: $isLoadingContents, isLoadingShelters: $isLoadingShelters, contentsList: $contentsList, selectedAroundShelterType: $selectedAroundShelterType, myLocation: $myLocation, shelterList: $shelterList, temperatureShelterList: $temperatureShelterList, earthquakeShelterList: $earthquakeShelterList, tsunamiShelterList: $tsunamiShelterList, civilShelterList: $civilShelterList, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InformationStateImpl &&
            (identical(other.isLoadingContents, isLoadingContents) ||
                other.isLoadingContents == isLoadingContents) &&
            (identical(other.isLoadingShelters, isLoadingShelters) ||
                other.isLoadingShelters == isLoadingShelters) &&
            const DeepCollectionEquality()
                .equals(other._contentsList, _contentsList) &&
            (identical(other.selectedAroundShelterType,
                    selectedAroundShelterType) ||
                other.selectedAroundShelterType == selectedAroundShelterType) &&
            (identical(other.myLocation, myLocation) ||
                other.myLocation == myLocation) &&
            const DeepCollectionEquality()
                .equals(other._shelterList, _shelterList) &&
            const DeepCollectionEquality().equals(
                other._temperatureShelterList, _temperatureShelterList) &&
            const DeepCollectionEquality()
                .equals(other._earthquakeShelterList, _earthquakeShelterList) &&
            const DeepCollectionEquality()
                .equals(other._tsunamiShelterList, _tsunamiShelterList) &&
            const DeepCollectionEquality()
                .equals(other._civilShelterList, _civilShelterList) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingContents,
      isLoadingShelters,
      const DeepCollectionEquality().hash(_contentsList),
      selectedAroundShelterType,
      myLocation,
      const DeepCollectionEquality().hash(_shelterList),
      const DeepCollectionEquality().hash(_temperatureShelterList),
      const DeepCollectionEquality().hash(_earthquakeShelterList),
      const DeepCollectionEquality().hash(_tsunamiShelterList),
      const DeepCollectionEquality().hash(_civilShelterList),
      latitude,
      longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InformationStateImplCopyWith<_$InformationStateImpl> get copyWith =>
      __$$InformationStateImplCopyWithImpl<_$InformationStateImpl>(
          this, _$identity);
}

abstract class _InformationState implements InformationState {
  factory _InformationState(
      {final bool isLoadingContents,
      final bool isLoadingShelters,
      final List<Contents> contentsList,
      final int selectedAroundShelterType,
      final String myLocation,
      final List<Shelters> shelterList,
      final List<Shelters> temperatureShelterList,
      final List<Shelters> earthquakeShelterList,
      final List<Shelters> tsunamiShelterList,
      final List<Shelters> civilShelterList,
      final double latitude,
      final double longitude}) = _$InformationStateImpl;

  @override
  bool get isLoadingContents;
  @override
  bool get isLoadingShelters;
  @override
  List<Contents> get contentsList;
  @override // 메인 재난콘텐츠 목록
  int get selectedAroundShelterType;
  @override
  String get myLocation;
  @override
  List<Shelters> get shelterList;
  @override // 주변 대피소 리스트
  List<Shelters> get temperatureShelterList;
  @override // 주변 대피소 리스트(전체)
  List<Shelters> get earthquakeShelterList;
  @override // 주변 대피소 리스트(지진)
  List<Shelters> get tsunamiShelterList;
  @override // 주변 대피소 리스트(수해)
  List<Shelters> get civilShelterList;
  @override // 주변 대피소 리스트(전쟁)
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$InformationStateImplCopyWith<_$InformationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
