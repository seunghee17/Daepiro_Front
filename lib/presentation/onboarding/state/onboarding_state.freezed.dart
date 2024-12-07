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
//주소 검색 오류 상태
  bool get isError => throw _privateConstructorUsedError;
  String get nameState => throw _privateConstructorUsedError;
  String get nicknameState => throw _privateConstructorUsedError;
  bool get completeSetName => throw _privateConstructorUsedError;
  bool get completeSetNickName =>
      throw _privateConstructorUsedError; //검색된 주소 목록의 중복을 제거하기 위함
  Set<String> get jusoListState => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userNickName => throw _privateConstructorUsedError; //입력한 주소값
  String get homeJuso => throw _privateConstructorUsedError;
  String get firstJuso => throw _privateConstructorUsedError;
  String get secondJuso => throw _privateConstructorUsedError; //입력한 주소 별명
  String get homeJusoNick => throw _privateConstructorUsedError;
  String get firstJusoNick => throw _privateConstructorUsedError;
  String get secondJusoNick =>
      throw _privateConstructorUsedError; //주소 별명 입력 오류 상태
  String get firstJusoState => throw _privateConstructorUsedError;
  String get secondJusoState =>
      throw _privateConstructorUsedError; //주소 입력 텍스트 필드 visible 상태
  bool get isJuso1Visible => throw _privateConstructorUsedError;
  bool get isJuso2Visible =>
      throw _privateConstructorUsedError; //권한 모두 동의 활성화 상태
  bool get isAllAppPermissionGrant =>
      throw _privateConstructorUsedError; //체크박스의 활성화상태
  List<bool> get isAppPermissionCheckboxState =>
      throw _privateConstructorUsedError;
  List<String> get disasterTypes => throw _privateConstructorUsedError;

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
      bool completeSetName,
      bool completeSetNickName,
      Set<String> jusoListState,
      String userName,
      String userNickName,
      String homeJuso,
      String firstJuso,
      String secondJuso,
      String homeJusoNick,
      String firstJusoNick,
      String secondJusoNick,
      String firstJusoState,
      String secondJusoState,
      bool isJuso1Visible,
      bool isJuso2Visible,
      bool isAllAppPermissionGrant,
      List<bool> isAppPermissionCheckboxState,
      List<String> disasterTypes});
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
    Object? completeSetName = null,
    Object? completeSetNickName = null,
    Object? jusoListState = null,
    Object? userName = null,
    Object? userNickName = null,
    Object? homeJuso = null,
    Object? firstJuso = null,
    Object? secondJuso = null,
    Object? homeJusoNick = null,
    Object? firstJusoNick = null,
    Object? secondJusoNick = null,
    Object? firstJusoState = null,
    Object? secondJusoState = null,
    Object? isJuso1Visible = null,
    Object? isJuso2Visible = null,
    Object? isAllAppPermissionGrant = null,
    Object? isAppPermissionCheckboxState = null,
    Object? disasterTypes = null,
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
      completeSetName: null == completeSetName
          ? _value.completeSetName
          : completeSetName // ignore: cast_nullable_to_non_nullable
              as bool,
      completeSetNickName: null == completeSetNickName
          ? _value.completeSetNickName
          : completeSetNickName // ignore: cast_nullable_to_non_nullable
              as bool,
      jusoListState: null == jusoListState
          ? _value.jusoListState
          : jusoListState // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userNickName: null == userNickName
          ? _value.userNickName
          : userNickName // ignore: cast_nullable_to_non_nullable
              as String,
      homeJuso: null == homeJuso
          ? _value.homeJuso
          : homeJuso // ignore: cast_nullable_to_non_nullable
              as String,
      firstJuso: null == firstJuso
          ? _value.firstJuso
          : firstJuso // ignore: cast_nullable_to_non_nullable
              as String,
      secondJuso: null == secondJuso
          ? _value.secondJuso
          : secondJuso // ignore: cast_nullable_to_non_nullable
              as String,
      homeJusoNick: null == homeJusoNick
          ? _value.homeJusoNick
          : homeJusoNick // ignore: cast_nullable_to_non_nullable
              as String,
      firstJusoNick: null == firstJusoNick
          ? _value.firstJusoNick
          : firstJusoNick // ignore: cast_nullable_to_non_nullable
              as String,
      secondJusoNick: null == secondJusoNick
          ? _value.secondJusoNick
          : secondJusoNick // ignore: cast_nullable_to_non_nullable
              as String,
      firstJusoState: null == firstJusoState
          ? _value.firstJusoState
          : firstJusoState // ignore: cast_nullable_to_non_nullable
              as String,
      secondJusoState: null == secondJusoState
          ? _value.secondJusoState
          : secondJusoState // ignore: cast_nullable_to_non_nullable
              as String,
      isJuso1Visible: null == isJuso1Visible
          ? _value.isJuso1Visible
          : isJuso1Visible // ignore: cast_nullable_to_non_nullable
              as bool,
      isJuso2Visible: null == isJuso2Visible
          ? _value.isJuso2Visible
          : isJuso2Visible // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllAppPermissionGrant: null == isAllAppPermissionGrant
          ? _value.isAllAppPermissionGrant
          : isAllAppPermissionGrant // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppPermissionCheckboxState: null == isAppPermissionCheckboxState
          ? _value.isAppPermissionCheckboxState
          : isAppPermissionCheckboxState // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      disasterTypes: null == disasterTypes
          ? _value.disasterTypes
          : disasterTypes // ignore: cast_nullable_to_non_nullable
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
      bool completeSetName,
      bool completeSetNickName,
      Set<String> jusoListState,
      String userName,
      String userNickName,
      String homeJuso,
      String firstJuso,
      String secondJuso,
      String homeJusoNick,
      String firstJusoNick,
      String secondJusoNick,
      String firstJusoState,
      String secondJusoState,
      bool isJuso1Visible,
      bool isJuso2Visible,
      bool isAllAppPermissionGrant,
      List<bool> isAppPermissionCheckboxState,
      List<String> disasterTypes});
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
    Object? completeSetName = null,
    Object? completeSetNickName = null,
    Object? jusoListState = null,
    Object? userName = null,
    Object? userNickName = null,
    Object? homeJuso = null,
    Object? firstJuso = null,
    Object? secondJuso = null,
    Object? homeJusoNick = null,
    Object? firstJusoNick = null,
    Object? secondJusoNick = null,
    Object? firstJusoState = null,
    Object? secondJusoState = null,
    Object? isJuso1Visible = null,
    Object? isJuso2Visible = null,
    Object? isAllAppPermissionGrant = null,
    Object? isAppPermissionCheckboxState = null,
    Object? disasterTypes = null,
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
      completeSetName: null == completeSetName
          ? _value.completeSetName
          : completeSetName // ignore: cast_nullable_to_non_nullable
              as bool,
      completeSetNickName: null == completeSetNickName
          ? _value.completeSetNickName
          : completeSetNickName // ignore: cast_nullable_to_non_nullable
              as bool,
      jusoListState: null == jusoListState
          ? _value._jusoListState
          : jusoListState // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userNickName: null == userNickName
          ? _value.userNickName
          : userNickName // ignore: cast_nullable_to_non_nullable
              as String,
      homeJuso: null == homeJuso
          ? _value.homeJuso
          : homeJuso // ignore: cast_nullable_to_non_nullable
              as String,
      firstJuso: null == firstJuso
          ? _value.firstJuso
          : firstJuso // ignore: cast_nullable_to_non_nullable
              as String,
      secondJuso: null == secondJuso
          ? _value.secondJuso
          : secondJuso // ignore: cast_nullable_to_non_nullable
              as String,
      homeJusoNick: null == homeJusoNick
          ? _value.homeJusoNick
          : homeJusoNick // ignore: cast_nullable_to_non_nullable
              as String,
      firstJusoNick: null == firstJusoNick
          ? _value.firstJusoNick
          : firstJusoNick // ignore: cast_nullable_to_non_nullable
              as String,
      secondJusoNick: null == secondJusoNick
          ? _value.secondJusoNick
          : secondJusoNick // ignore: cast_nullable_to_non_nullable
              as String,
      firstJusoState: null == firstJusoState
          ? _value.firstJusoState
          : firstJusoState // ignore: cast_nullable_to_non_nullable
              as String,
      secondJusoState: null == secondJusoState
          ? _value.secondJusoState
          : secondJusoState // ignore: cast_nullable_to_non_nullable
              as String,
      isJuso1Visible: null == isJuso1Visible
          ? _value.isJuso1Visible
          : isJuso1Visible // ignore: cast_nullable_to_non_nullable
              as bool,
      isJuso2Visible: null == isJuso2Visible
          ? _value.isJuso2Visible
          : isJuso2Visible // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllAppPermissionGrant: null == isAllAppPermissionGrant
          ? _value.isAllAppPermissionGrant
          : isAllAppPermissionGrant // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppPermissionCheckboxState: null == isAppPermissionCheckboxState
          ? _value._isAppPermissionCheckboxState
          : isAppPermissionCheckboxState // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      disasterTypes: null == disasterTypes
          ? _value._disasterTypes
          : disasterTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$OnboardingStateImpl implements _OnboardingState {
  _$OnboardingStateImpl(
      {this.isError = false,
      this.nameState = '',
      this.nicknameState = '',
      this.completeSetName = false,
      this.completeSetNickName = false,
      final Set<String> jusoListState = const <String>{},
      this.userName = '',
      this.userNickName = '',
      this.homeJuso = '',
      this.firstJuso = '',
      this.secondJuso = '',
      this.homeJusoNick = '집',
      this.firstJusoNick = '',
      this.secondJusoNick = '',
      this.firstJusoState = '*별명 설정은 필수입니다.',
      this.secondJusoState = '*별명 설정은 필수입니다.',
      this.isJuso1Visible = false,
      this.isJuso2Visible = false,
      this.isAllAppPermissionGrant = false,
      final List<bool> isAppPermissionCheckboxState = const [
        false,
        false,
        false,
        false,
        false
      ],
      final List<String> disasterTypes = const ['재난', '재난']})
      : _jusoListState = jusoListState,
        _isAppPermissionCheckboxState = isAppPermissionCheckboxState,
        _disasterTypes = disasterTypes;

//주소 검색 오류 상태
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final String nameState;
  @override
  @JsonKey()
  final String nicknameState;
  @override
  @JsonKey()
  final bool completeSetName;
  @override
  @JsonKey()
  final bool completeSetNickName;
//검색된 주소 목록의 중복을 제거하기 위함
  final Set<String> _jusoListState;
//검색된 주소 목록의 중복을 제거하기 위함
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
  @override
  @JsonKey()
  final String userNickName;
//입력한 주소값
  @override
  @JsonKey()
  final String homeJuso;
  @override
  @JsonKey()
  final String firstJuso;
  @override
  @JsonKey()
  final String secondJuso;
//입력한 주소 별명
  @override
  @JsonKey()
  final String homeJusoNick;
  @override
  @JsonKey()
  final String firstJusoNick;
  @override
  @JsonKey()
  final String secondJusoNick;
//주소 별명 입력 오류 상태
  @override
  @JsonKey()
  final String firstJusoState;
  @override
  @JsonKey()
  final String secondJusoState;
//주소 입력 텍스트 필드 visible 상태
  @override
  @JsonKey()
  final bool isJuso1Visible;
  @override
  @JsonKey()
  final bool isJuso2Visible;
//권한 모두 동의 활성화 상태
  @override
  @JsonKey()
  final bool isAllAppPermissionGrant;
//체크박스의 활성화상태
  final List<bool> _isAppPermissionCheckboxState;
//체크박스의 활성화상태
  @override
  @JsonKey()
  List<bool> get isAppPermissionCheckboxState {
    if (_isAppPermissionCheckboxState is EqualUnmodifiableListView)
      return _isAppPermissionCheckboxState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isAppPermissionCheckboxState);
  }

  final List<String> _disasterTypes;
  @override
  @JsonKey()
  List<String> get disasterTypes {
    if (_disasterTypes is EqualUnmodifiableListView) return _disasterTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disasterTypes);
  }

  @override
  String toString() {
    return 'OnboardingState(isError: $isError, nameState: $nameState, nicknameState: $nicknameState, completeSetName: $completeSetName, completeSetNickName: $completeSetNickName, jusoListState: $jusoListState, userName: $userName, userNickName: $userNickName, homeJuso: $homeJuso, firstJuso: $firstJuso, secondJuso: $secondJuso, homeJusoNick: $homeJusoNick, firstJusoNick: $firstJusoNick, secondJusoNick: $secondJusoNick, firstJusoState: $firstJusoState, secondJusoState: $secondJusoState, isJuso1Visible: $isJuso1Visible, isJuso2Visible: $isJuso2Visible, isAllAppPermissionGrant: $isAllAppPermissionGrant, isAppPermissionCheckboxState: $isAppPermissionCheckboxState, disasterTypes: $disasterTypes)';
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
            (identical(other.completeSetName, completeSetName) ||
                other.completeSetName == completeSetName) &&
            (identical(other.completeSetNickName, completeSetNickName) ||
                other.completeSetNickName == completeSetNickName) &&
            const DeepCollectionEquality()
                .equals(other._jusoListState, _jusoListState) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userNickName, userNickName) ||
                other.userNickName == userNickName) &&
            (identical(other.homeJuso, homeJuso) ||
                other.homeJuso == homeJuso) &&
            (identical(other.firstJuso, firstJuso) ||
                other.firstJuso == firstJuso) &&
            (identical(other.secondJuso, secondJuso) ||
                other.secondJuso == secondJuso) &&
            (identical(other.homeJusoNick, homeJusoNick) ||
                other.homeJusoNick == homeJusoNick) &&
            (identical(other.firstJusoNick, firstJusoNick) ||
                other.firstJusoNick == firstJusoNick) &&
            (identical(other.secondJusoNick, secondJusoNick) ||
                other.secondJusoNick == secondJusoNick) &&
            (identical(other.firstJusoState, firstJusoState) ||
                other.firstJusoState == firstJusoState) &&
            (identical(other.secondJusoState, secondJusoState) ||
                other.secondJusoState == secondJusoState) &&
            (identical(other.isJuso1Visible, isJuso1Visible) ||
                other.isJuso1Visible == isJuso1Visible) &&
            (identical(other.isJuso2Visible, isJuso2Visible) ||
                other.isJuso2Visible == isJuso2Visible) &&
            (identical(
                    other.isAllAppPermissionGrant, isAllAppPermissionGrant) ||
                other.isAllAppPermissionGrant == isAllAppPermissionGrant) &&
            const DeepCollectionEquality().equals(
                other._isAppPermissionCheckboxState,
                _isAppPermissionCheckboxState) &&
            const DeepCollectionEquality()
                .equals(other._disasterTypes, _disasterTypes));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isError,
        nameState,
        nicknameState,
        completeSetName,
        completeSetNickName,
        const DeepCollectionEquality().hash(_jusoListState),
        userName,
        userNickName,
        homeJuso,
        firstJuso,
        secondJuso,
        homeJusoNick,
        firstJusoNick,
        secondJusoNick,
        firstJusoState,
        secondJusoState,
        isJuso1Visible,
        isJuso2Visible,
        isAllAppPermissionGrant,
        const DeepCollectionEquality().hash(_isAppPermissionCheckboxState),
        const DeepCollectionEquality().hash(_disasterTypes)
      ]);

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
      final bool completeSetName,
      final bool completeSetNickName,
      final Set<String> jusoListState,
      final String userName,
      final String userNickName,
      final String homeJuso,
      final String firstJuso,
      final String secondJuso,
      final String homeJusoNick,
      final String firstJusoNick,
      final String secondJusoNick,
      final String firstJusoState,
      final String secondJusoState,
      final bool isJuso1Visible,
      final bool isJuso2Visible,
      final bool isAllAppPermissionGrant,
      final List<bool> isAppPermissionCheckboxState,
      final List<String> disasterTypes}) = _$OnboardingStateImpl;

  @override //주소 검색 오류 상태
  bool get isError;
  @override
  String get nameState;
  @override
  String get nicknameState;
  @override
  bool get completeSetName;
  @override
  bool get completeSetNickName;
  @override //검색된 주소 목록의 중복을 제거하기 위함
  Set<String> get jusoListState;
  @override
  String get userName;
  @override
  String get userNickName;
  @override //입력한 주소값
  String get homeJuso;
  @override
  String get firstJuso;
  @override
  String get secondJuso;
  @override //입력한 주소 별명
  String get homeJusoNick;
  @override
  String get firstJusoNick;
  @override
  String get secondJusoNick;
  @override //주소 별명 입력 오류 상태
  String get firstJusoState;
  @override
  String get secondJusoState;
  @override //주소 입력 텍스트 필드 visible 상태
  bool get isJuso1Visible;
  @override
  bool get isJuso2Visible;
  @override //권한 모두 동의 활성화 상태
  bool get isAllAppPermissionGrant;
  @override //체크박스의 활성화상태
  List<bool> get isAppPermissionCheckboxState;
  @override
  List<String> get disasterTypes;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
