// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_login_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNaverTokenResponseHash() =>
    r'a4759640e79e4ee33a615ba9495c8aefa4cb1f9e';

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

/// See also [getNaverTokenResponse].
@ProviderFor(getNaverTokenResponse)
const getNaverTokenResponseProvider = GetNaverTokenResponseFamily();

/// See also [getNaverTokenResponse].
class GetNaverTokenResponseFamily
    extends Family<AsyncValue<SocialLoginTokenResponse>> {
  /// See also [getNaverTokenResponse].
  const GetNaverTokenResponseFamily();

  /// See also [getNaverTokenResponse].
  GetNaverTokenResponseProvider call({
    required TokenRequest tokenRequest,
  }) {
    return GetNaverTokenResponseProvider(
      tokenRequest: tokenRequest,
    );
  }

  @override
  GetNaverTokenResponseProvider getProviderOverride(
    covariant GetNaverTokenResponseProvider provider,
  ) {
    return call(
      tokenRequest: provider.tokenRequest,
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
  String? get name => r'getNaverTokenResponseProvider';
}

/// See also [getNaverTokenResponse].
class GetNaverTokenResponseProvider
    extends AutoDisposeFutureProvider<SocialLoginTokenResponse> {
  /// See also [getNaverTokenResponse].
  GetNaverTokenResponseProvider({
    required TokenRequest tokenRequest,
  }) : this._internal(
          (ref) => getNaverTokenResponse(
            ref as GetNaverTokenResponseRef,
            tokenRequest: tokenRequest,
          ),
          from: getNaverTokenResponseProvider,
          name: r'getNaverTokenResponseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNaverTokenResponseHash,
          dependencies: GetNaverTokenResponseFamily._dependencies,
          allTransitiveDependencies:
              GetNaverTokenResponseFamily._allTransitiveDependencies,
          tokenRequest: tokenRequest,
        );

  GetNaverTokenResponseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tokenRequest,
  }) : super.internal();

  final TokenRequest tokenRequest;

  @override
  Override overrideWith(
    FutureOr<SocialLoginTokenResponse> Function(
            GetNaverTokenResponseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNaverTokenResponseProvider._internal(
        (ref) => create(ref as GetNaverTokenResponseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tokenRequest: tokenRequest,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SocialLoginTokenResponse> createElement() {
    return _GetNaverTokenResponseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNaverTokenResponseProvider &&
        other.tokenRequest == tokenRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tokenRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetNaverTokenResponseRef
    on AutoDisposeFutureProviderRef<SocialLoginTokenResponse> {
  /// The parameter `tokenRequest` of this provider.
  TokenRequest get tokenRequest;
}

class _GetNaverTokenResponseProviderElement
    extends AutoDisposeFutureProviderElement<SocialLoginTokenResponse>
    with GetNaverTokenResponseRef {
  _GetNaverTokenResponseProviderElement(super.provider);

  @override
  TokenRequest get tokenRequest =>
      (origin as GetNaverTokenResponseProvider).tokenRequest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
