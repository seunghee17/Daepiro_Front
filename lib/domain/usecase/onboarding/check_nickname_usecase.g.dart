// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_nickname_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkNickNameHash() => r'439d32f190ad302298468e9e62564bebbe3f242b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [checkNickName].
@ProviderFor(checkNickName)
const checkNickNameProvider = CheckNickNameFamily();

/// See also [checkNickName].
class CheckNickNameFamily extends Family<AsyncValue<NicknameCheckResponse>> {
  /// See also [checkNickName].
  const CheckNickNameFamily();

  /// See also [checkNickName].
  CheckNickNameProvider call({
    required String nickName,
  }) {
    return CheckNickNameProvider(
      nickName: nickName,
    );
  }

  @override
  CheckNickNameProvider getProviderOverride(
    covariant CheckNickNameProvider provider,
  ) {
    return call(
      nickName: provider.nickName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'checkNickNameProvider';
}

/// See also [checkNickName].
class CheckNickNameProvider
    extends AutoDisposeFutureProvider<NicknameCheckResponse> {
  /// See also [checkNickName].
  CheckNickNameProvider({
    required String nickName,
  }) : this._internal(
          (ref) => checkNickName(
            ref as CheckNickNameRef,
            nickName: nickName,
          ),
          from: checkNickNameProvider,
          name: r'checkNickNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkNickNameHash,
          dependencies: CheckNickNameFamily._dependencies,
          allTransitiveDependencies:
              CheckNickNameFamily._allTransitiveDependencies,
          nickName: nickName,
        );

  CheckNickNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.nickName,
  }) : super.internal();

  final String nickName;

  @override
  Override overrideWith(
    FutureOr<NicknameCheckResponse> Function(CheckNickNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckNickNameProvider._internal(
        (ref) => create(ref as CheckNickNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        nickName: nickName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NicknameCheckResponse> createElement() {
    return _CheckNickNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckNickNameProvider && other.nickName == nickName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nickName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CheckNickNameRef on AutoDisposeFutureProviderRef<NicknameCheckResponse> {
  /// The parameter `nickName` of this provider.
  String get nickName;
}

class _CheckNickNameProviderElement
    extends AutoDisposeFutureProviderElement<NicknameCheckResponse>
    with CheckNickNameRef {
  _CheckNickNameProviderElement(super.provider);

  @override
  String get nickName => (origin as CheckNickNameProvider).nickName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
