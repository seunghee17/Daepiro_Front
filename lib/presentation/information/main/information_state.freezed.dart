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
  bool get isLoading => throw _privateConstructorUsedError;
  List<Contents> get contentsList =>
      throw _privateConstructorUsedError; // 메인 재난콘텐츠 목록
  int get selectedAroundShelterType => throw _privateConstructorUsedError;
  List<Shelters> get shelterList => throw _privateConstructorUsedError;

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
      {bool isLoading,
      List<Contents> contentsList,
      int selectedAroundShelterType,
      List<Shelters> shelterList});
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
    Object? isLoading = null,
    Object? contentsList = null,
    Object? selectedAroundShelterType = null,
    Object? shelterList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      contentsList: null == contentsList
          ? _value.contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
      selectedAroundShelterType: null == selectedAroundShelterType
          ? _value.selectedAroundShelterType
          : selectedAroundShelterType // ignore: cast_nullable_to_non_nullable
              as int,
      shelterList: null == shelterList
          ? _value.shelterList
          : shelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
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
      {bool isLoading,
      List<Contents> contentsList,
      int selectedAroundShelterType,
      List<Shelters> shelterList});
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
    Object? isLoading = null,
    Object? contentsList = null,
    Object? selectedAroundShelterType = null,
    Object? shelterList = null,
  }) {
    return _then(_$InformationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      contentsList: null == contentsList
          ? _value._contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
      selectedAroundShelterType: null == selectedAroundShelterType
          ? _value.selectedAroundShelterType
          : selectedAroundShelterType // ignore: cast_nullable_to_non_nullable
              as int,
      shelterList: null == shelterList
          ? _value._shelterList
          : shelterList // ignore: cast_nullable_to_non_nullable
              as List<Shelters>,
    ));
  }
}

/// @nodoc

class _$InformationStateImpl implements _InformationState {
  _$InformationStateImpl(
      {this.isLoading = false,
      final List<Contents> contentsList = const [],
      this.selectedAroundShelterType = 0,
      final List<Shelters> shelterList = const []})
      : _contentsList = contentsList,
        _shelterList = shelterList;

  @override
  @JsonKey()
  final bool isLoading;
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
  final List<Shelters> _shelterList;
  @override
  @JsonKey()
  List<Shelters> get shelterList {
    if (_shelterList is EqualUnmodifiableListView) return _shelterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shelterList);
  }

  @override
  String toString() {
    return 'InformationState(isLoading: $isLoading, contentsList: $contentsList, selectedAroundShelterType: $selectedAroundShelterType, shelterList: $shelterList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InformationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._contentsList, _contentsList) &&
            (identical(other.selectedAroundShelterType,
                    selectedAroundShelterType) ||
                other.selectedAroundShelterType == selectedAroundShelterType) &&
            const DeepCollectionEquality()
                .equals(other._shelterList, _shelterList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_contentsList),
      selectedAroundShelterType,
      const DeepCollectionEquality().hash(_shelterList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InformationStateImplCopyWith<_$InformationStateImpl> get copyWith =>
      __$$InformationStateImplCopyWithImpl<_$InformationStateImpl>(
          this, _$identity);
}

abstract class _InformationState implements InformationState {
  factory _InformationState(
      {final bool isLoading,
      final List<Contents> contentsList,
      final int selectedAroundShelterType,
      final List<Shelters> shelterList}) = _$InformationStateImpl;

  @override
  bool get isLoading;
  @override
  List<Contents> get contentsList;
  @override // 메인 재난콘텐츠 목록
  int get selectedAroundShelterType;
  @override
  List<Shelters> get shelterList;
  @override
  @JsonKey(ignore: true)
  _$$InformationStateImplCopyWith<_$InformationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
