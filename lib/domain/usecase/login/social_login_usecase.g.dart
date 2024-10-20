// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSocialTokenResponseHash() =>
    r'ba37a88c3772a11a6420d2e3c1e50c9c243c5c6b';

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

/// See also [getSocialTokenResponse].
@ProviderFor(getSocialTokenResponse)
const getSocialTokenResponseProvider = GetSocialTokenResponseFamily();

/// See also [getSocialTokenResponse].
class GetSocialTokenResponseFamily
    extends Family<AsyncValue<SocialLoginTokenResponse>> {
  /// See also [getSocialTokenResponse].
  const GetSocialTokenResponseFamily();

  /// See also [getSocialTokenResponse].
  GetSocialTokenResponseProvider call({
    required String platform,
    required SocialLoginRequest tokenRequest,
  }) {
    return GetSocialTokenResponseProvider(
      platform: platform,
      tokenRequest: tokenRequest,
    );
  }

  @override
  GetSocialTokenResponseProvider getProviderOverride(
    covariant GetSocialTokenResponseProvider provider,
  ) {
    return call(
      platform: provider.platform,
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
  String? get name => r'getSocialTokenResponseProvider';
}

/// See also [getSocialTokenResponse].
class GetSocialTokenResponseProvider
    extends AutoDisposeFutureProvider<SocialLoginTokenResponse> {
  /// See also [getSocialTokenResponse].
  GetSocialTokenResponseProvider({
    required String platform,
    required SocialLoginRequest tokenRequest,
  }) : this._internal(
          (ref) => getSocialTokenResponse(
            ref as GetSocialTokenResponseRef,
            platform: platform,
            tokenRequest: tokenRequest,
          ),
          from: getSocialTokenResponseProvider,
          name: r'getSocialTokenResponseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSocialTokenResponseHash,
          dependencies: GetSocialTokenResponseFamily._dependencies,
          allTransitiveDependencies:
              GetSocialTokenResponseFamily._allTransitiveDependencies,
          platform: platform,
          tokenRequest: tokenRequest,
        );

  GetSocialTokenResponseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.platform,
    required this.tokenRequest,
  }) : super.internal();

  final String platform;
  final SocialLoginRequest tokenRequest;

  @override
  Override overrideWith(
    FutureOr<SocialLoginTokenResponse> Function(
            GetSocialTokenResponseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSocialTokenResponseProvider._internal(
        (ref) => create(ref as GetSocialTokenResponseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        platform: platform,
        tokenRequest: tokenRequest,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SocialLoginTokenResponse> createElement() {
    return _GetSocialTokenResponseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSocialTokenResponseProvider &&
        other.platform == platform &&
        other.tokenRequest == tokenRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, platform.hashCode);
    hash = _SystemHash.combine(hash, tokenRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSocialTokenResponseRef
    on AutoDisposeFutureProviderRef<SocialLoginTokenResponse> {
  /// The parameter `platform` of this provider.
  String get platform;

  /// The parameter `tokenRequest` of this provider.
  SocialLoginRequest get tokenRequest;
}

class _GetSocialTokenResponseProviderElement
    extends AutoDisposeFutureProviderElement<SocialLoginTokenResponse>
    with GetSocialTokenResponseRef {
  _GetSocialTokenResponseProviderElement(super.provider);

  @override
  String get platform => (origin as GetSocialTokenResponseProvider).platform;
  @override
  SocialLoginRequest get tokenRequest =>
      (origin as GetSocialTokenResponseProvider).tokenRequest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
