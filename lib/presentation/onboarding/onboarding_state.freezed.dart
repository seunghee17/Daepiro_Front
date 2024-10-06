// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingState {
  bool get isError => throw _privateConstructorUsedError;
  String get nameState => throw _privateConstructorUsedError;
  String get nicknameState => throw _privateConstructorUsedError;
  Set<String> get jusoListState => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  List<String> get inputJusoList => throw _privateConstructorUsedError;
  List<String> get inputJusoName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call(
      {bool isError,
      String nameState,
      String nicknameState,
      Set<String> jusoListState,
      String userName,
      List<String> inputJusoList,
      List<String> inputJusoName});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = null,
    Object? nameState = null,
    Object? nicknameState = null,
    Object? jusoListState = null,
    Object? userName = null,
    Object? inputJusoList = null,
    Object? inputJusoName = null,
  }) {
    return _then(_value.copyWith(
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      nameState: null == nameState
          ? _value.nameState
          : nameState // ignore: cast_nullable_to_non_nullable
              as String,
      nicknameState: null == nicknameState
          ? _value.nicknameState
          : nicknameState // ignore: cast_nullable_to_non_nullable
              as String,
      jusoListState: null == jusoListState
          ? _value.jusoListState
          : jusoListState // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      inputJusoList: null == inputJusoList
          ? _value.inputJusoList
          : inputJusoList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inputJusoName: null == inputJusoName
          ? _value.inputJusoName
          : inputJusoName // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isError,
      String nameState,
      String nicknameState,
      Set<String> jusoListState,
      String userName,
      List<String> inputJusoList,
      List<String> inputJusoName});
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = null,
    Object? nameState = null,
    Object? nicknameState = null,
    Object? jusoListState = null,
    Object? userName = null,
    Object? inputJusoList = null,
    Object? inputJusoName = null,
  }) {
    return _then(_$OnboardingStateImpl(
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      nameState: null == nameState
          ? _value.nameState
          : nameState // ignore: cast_nullable_to_non_nullable
              as String,
      nicknameState: null == nicknameState
          ? _value.nicknameState
          : nicknameState // ignore: cast_nullable_to_non_nullable
              as String,
      jusoListState: null == jusoListState
          ? _value._jusoListState
          : jusoListState // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      inputJusoList: null == inputJusoList
          ? _value._inputJusoList
          : inputJusoList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inputJusoName: null == inputJusoName
          ? _value._inputJusoName
          : inputJusoName // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$OnboardingStateImpl implements _OnboardingState {
  _$OnboardingStateImpl(
      {this.isError = false,
      this.nameState = 'NONE',
      this.nicknameState = 'NONE',
      final Set<String> jusoListState = const <String>{},
      this.userName = '',
      final List<String> inputJusoList = const [],
      final List<String> inputJusoName = const []})
      : _jusoListState = jusoListState,
        _inputJusoList = inputJusoList,
        _inputJusoName = inputJusoName;

  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final String nameState;
  @override
  @JsonKey()
  final String nicknameState;
  final Set<String> _jusoListState;
  @override
  @JsonKey()
  Set<String> get jusoListState {
    if (_jusoListState is EqualUnmodifiableSetView) return _jusoListState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_jusoListState);
  }

  @override
  @JsonKey()
  final String userName;
  final List<String> _inputJusoList;
  @override
  @JsonKey()
  List<String> get inputJusoList {
    if (_inputJusoList is EqualUnmodifiableListView) return _inputJusoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inputJusoList);
  }

  final List<String> _inputJusoName;
  @override
  @JsonKey()
  List<String> get inputJusoName {
    if (_inputJusoName is EqualUnmodifiableListView) return _inputJusoName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inputJusoName);
  }

  @override
  String toString() {
    return 'OnboardingState(isError: $isError, nameState: $nameState, nicknameState: $nicknameState, jusoListState: $jusoListState, userName: $userName, inputJusoList: $inputJusoList, inputJusoName: $inputJusoName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.nameState, nameState) ||
                other.nameState == nameState) &&
            (identical(other.nicknameState, nicknameState) ||
                other.nicknameState == nicknameState) &&
            const DeepCollectionEquality()
                .equals(other._jusoListState, _jusoListState) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            const DeepCollectionEquality()
                .equals(other._inputJusoList, _inputJusoList) &&
            const DeepCollectionEquality()
                .equals(other._inputJusoName, _inputJusoName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isError,
      nameState,
      nicknameState,
      const DeepCollectionEquality().hash(_jusoListState),
      userName,
      const DeepCollectionEquality().hash(_inputJusoList),
      const DeepCollectionEquality().hash(_inputJusoName));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
          this, _$identity);
}

abstract class _OnboardingState implements OnboardingState {
  factory _OnboardingState(
      {final bool isError,
      final String nameState,
      final String nicknameState,
      final Set<String> jusoListState,
      final String userName,
      final List<String> inputJusoList,
      final List<String> inputJusoName}) = _$OnboardingStateImpl;

  @override
  bool get isError;
  @override
  String get nameState;
  @override
  String get nicknameState;
  @override
  Set<String> get jusoListState;
  @override
  String get userName;
  @override
  List<String> get inputJusoList;
  @override
  List<String> get inputJusoName;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
