// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_result_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTokenResponseHash() => r'51f78e45f53d72567d19753da5763baae7cb3a67';

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

/// See also [getTokenResponse].
@ProviderFor(getTokenResponse)
const getTokenResponseProvider = GetTokenResponseFamily();

/// See also [getTokenResponse].
class GetTokenResponseFamily extends Family<AsyncValue<RefreshTokenResponse>> {
  /// See also [getTokenResponse].
  const GetTokenResponseFamily();

  /// See also [getTokenResponse].
  GetTokenResponseProvider call({
    required RefreshTokenRequest tokenRequest,
  }) {
    return GetTokenResponseProvider(
      tokenRequest: tokenRequest,
    );
  }

  @override
  GetTokenResponseProvider getProviderOverride(
    covariant GetTokenResponseProvider provider,
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
  String? get name => r'getTokenResponseProvider';
}

/// See also [getTokenResponse].
class GetTokenResponseProvider
    extends AutoDisposeFutureProvider<RefreshTokenResponse> {
  /// See also [getTokenResponse].
  GetTokenResponseProvider({
    required RefreshTokenRequest tokenRequest,
  }) : this._internal(
          (ref) => getTokenResponse(
            ref as GetTokenResponseRef,
            tokenRequest: tokenRequest,
          ),
          from: getTokenResponseProvider,
          name: r'getTokenResponseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTokenResponseHash,
          dependencies: GetTokenResponseFamily._dependencies,
          allTransitiveDependencies:
              GetTokenResponseFamily._allTransitiveDependencies,
          tokenRequest: tokenRequest,
        );

  GetTokenResponseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tokenRequest,
  }) : super.internal();

  final RefreshTokenRequest tokenRequest;

  @override
  Override overrideWith(
    FutureOr<RefreshTokenResponse> Function(GetTokenResponseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTokenResponseProvider._internal(
        (ref) => create(ref as GetTokenResponseRef),
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
  AutoDisposeFutureProviderElement<RefreshTokenResponse> createElement() {
    return _GetTokenResponseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTokenResponseProvider &&
        other.tokenRequest == tokenRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tokenRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTokenResponseRef
    on AutoDisposeFutureProviderRef<RefreshTokenResponse> {
  /// The parameter `tokenRequest` of this provider.
  RefreshTokenRequest get tokenRequest;
}

class _GetTokenResponseProviderElement
    extends AutoDisposeFutureProviderElement<RefreshTokenResponse>
    with GetTokenResponseRef {
  _GetTokenResponseProviderElement(super.provider);

  @override
  RefreshTokenRequest get tokenRequest =>
      (origin as GetTokenResponseProvider).tokenRequest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
