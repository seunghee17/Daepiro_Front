// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_disaster_contents_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchDisasterContentsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Contents> get searchedContentsList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchDisasterContentsStateCopyWith<SearchDisasterContentsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDisasterContentsStateCopyWith<$Res> {
  factory $SearchDisasterContentsStateCopyWith(
          SearchDisasterContentsState value,
          $Res Function(SearchDisasterContentsState) then) =
      _$SearchDisasterContentsStateCopyWithImpl<$Res,
          SearchDisasterContentsState>;
  @useResult
  $Res call({bool isLoading, List<Contents> searchedContentsList});
}

/// @nodoc
class _$SearchDisasterContentsStateCopyWithImpl<$Res,
        $Val extends SearchDisasterContentsState>
    implements $SearchDisasterContentsStateCopyWith<$Res> {
  _$SearchDisasterContentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? searchedContentsList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedContentsList: null == searchedContentsList
          ? _value.searchedContentsList
          : searchedContentsList // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchDisasterContentsStateImplCopyWith<$Res>
    implements $SearchDisasterContentsStateCopyWith<$Res> {
  factory _$$SearchDisasterContentsStateImplCopyWith(
          _$SearchDisasterContentsStateImpl value,
          $Res Function(_$SearchDisasterContentsStateImpl) then) =
      __$$SearchDisasterContentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Contents> searchedContentsList});
}

/// @nodoc
class __$$SearchDisasterContentsStateImplCopyWithImpl<$Res>
    extends _$SearchDisasterContentsStateCopyWithImpl<$Res,
        _$SearchDisasterContentsStateImpl>
    implements _$$SearchDisasterContentsStateImplCopyWith<$Res> {
  __$$SearchDisasterContentsStateImplCopyWithImpl(
      _$SearchDisasterContentsStateImpl _value,
      $Res Function(_$SearchDisasterContentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? searchedContentsList = null,
  }) {
    return _then(_$SearchDisasterContentsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedContentsList: null == searchedContentsList
          ? _value._searchedContentsList
          : searchedContentsList // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
    ));
  }
}

/// @nodoc

class _$SearchDisasterContentsStateImpl
    implements _SearchDisasterContentsState {
  _$SearchDisasterContentsStateImpl(
      {this.isLoading = false,
      final List<Contents> searchedContentsList = const []})
      : _searchedContentsList = searchedContentsList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Contents> _searchedContentsList;
  @override
  @JsonKey()
  List<Contents> get searchedContentsList {
    if (_searchedContentsList is EqualUnmodifiableListView)
      return _searchedContentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedContentsList);
  }

  @override
  String toString() {
    return 'SearchDisasterContentsState(isLoading: $isLoading, searchedContentsList: $searchedContentsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDisasterContentsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._searchedContentsList, _searchedContentsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_searchedContentsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDisasterContentsStateImplCopyWith<_$SearchDisasterContentsStateImpl>
      get copyWith => __$$SearchDisasterContentsStateImplCopyWithImpl<
          _$SearchDisasterContentsStateImpl>(this, _$identity);
}

abstract class _SearchDisasterContentsState
    implements SearchDisasterContentsState {
  factory _SearchDisasterContentsState(
          {final bool isLoading, final List<Contents> searchedContentsList}) =
      _$SearchDisasterContentsStateImpl;

  @override
  bool get isLoading;
  @override
  List<Contents> get searchedContentsList;
  @override
  @JsonKey(ignore: true)
  _$$SearchDisasterContentsStateImplCopyWith<_$SearchDisasterContentsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
