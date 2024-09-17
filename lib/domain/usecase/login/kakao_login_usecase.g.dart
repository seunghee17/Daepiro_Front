// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_login_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getKakaoTokenResponseHash() =>
    r'ad57054726d17a1986d1f80e2081f92195fa1beb';

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

/// See also [getKakaoTokenResponse].
@ProviderFor(getKakaoTokenResponse)
const getKakaoTokenResponseProvider = GetKakaoTokenResponseFamily();

/// See also [getKakaoTokenResponse].
class GetKakaoTokenResponseFamily
    extends Family<AsyncValue<SocialLoginTokenResponse>> {
  /// See also [getKakaoTokenResponse].
  const GetKakaoTokenResponseFamily();

  /// See also [getKakaoTokenResponse].
  GetKakaoTokenResponseProvider call({
    required TokenRequest tokenRequest,
  }) {
    return GetKakaoTokenResponseProvider(
      tokenRequest: tokenRequest,
    );
  }

  @override
  GetKakaoTokenResponseProvider getProviderOverride(
    covariant GetKakaoTokenResponseProvider provider,
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
  String? get name => r'getKakaoTokenResponseProvider';
}

/// See also [getKakaoTokenResponse].
class GetKakaoTokenResponseProvider
    extends AutoDisposeFutureProvider<SocialLoginTokenResponse> {
  /// See also [getKakaoTokenResponse].
  GetKakaoTokenResponseProvider({
    required TokenRequest tokenRequest,
  }) : this._internal(
          (ref) => getKakaoTokenResponse(
            ref as GetKakaoTokenResponseRef,
            tokenRequest: tokenRequest,
          ),
          from: getKakaoTokenResponseProvider,
          name: r'getKakaoTokenResponseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getKakaoTokenResponseHash,
          dependencies: GetKakaoTokenResponseFamily._dependencies,
          allTransitiveDependencies:
              GetKakaoTokenResponseFamily._allTransitiveDependencies,
          tokenRequest: tokenRequest,
        );

  GetKakaoTokenResponseProvider._internal(
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
            GetKakaoTokenResponseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetKakaoTokenResponseProvider._internal(
        (ref) => create(ref as GetKakaoTokenResponseRef),
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
    return _GetKakaoTokenResponseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetKakaoTokenResponseProvider &&
        other.tokenRequest == tokenRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tokenRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetKakaoTokenResponseRef
    on AutoDisposeFutureProviderRef<SocialLoginTokenResponse> {
  /// The parameter `tokenRequest` of this provider.
  TokenRequest get tokenRequest;
}

class _GetKakaoTokenResponseProviderElement
    extends AutoDisposeFutureProviderElement<SocialLoginTokenResponse>
    with GetKakaoTokenResponseRef {
  _GetKakaoTokenResponseProviderElement(super.provider);

  @override
  TokenRequest get tokenRequest =>
      (origin as GetKakaoTokenResponseProvider).tokenRequest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
