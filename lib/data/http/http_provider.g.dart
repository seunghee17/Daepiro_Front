// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$httpHash() => r'04478ce44b7c270352abf3efd0734688a5790427';

/// See also [http].
@ProviderFor(http)
final httpProvider = AutoDisposeProvider<Dio>.internal(
  http,
  name: r'httpProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$httpHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HttpRef = AutoDisposeProviderRef<Dio>;
String _$httpInterceptorHash() => r'e8fe2f70a27a1d7f13e4b6088ee5f5efe325e84e';

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

/// See also [httpInterceptor].
@ProviderFor(httpInterceptor)
const httpInterceptorProvider = HttpInterceptorFamily();

/// See also [httpInterceptor].
class HttpInterceptorFamily extends Family<InterceptorsWrapper> {
  /// See also [httpInterceptor].
  const HttpInterceptorFamily();

  /// See also [httpInterceptor].
  HttpInterceptorProvider call(
    Dio dio,
  ) {
    return HttpInterceptorProvider(
      dio,
    );
  }

  @override
  HttpInterceptorProvider getProviderOverride(
    covariant HttpInterceptorProvider provider,
  ) {
    return call(
      provider.dio,
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
  String? get name => r'httpInterceptorProvider';
}

/// See also [httpInterceptor].
class HttpInterceptorProvider extends AutoDisposeProvider<InterceptorsWrapper> {
  /// See also [httpInterceptor].
  HttpInterceptorProvider(
    Dio dio,
  ) : this._internal(
          (ref) => httpInterceptor(
            ref as HttpRef,
            dio,
          ),
          from: httpInterceptorProvider,
          name: r'httpInterceptorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$httpInterceptorHash,
          dependencies: HttpInterceptorFamily._dependencies,
          allTransitiveDependencies:
              HttpInterceptorFamily._allTransitiveDependencies,
          dio: dio,
        );

  HttpInterceptorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dio,
  }) : super.internal();

  final Dio dio;

  @override
  Override overrideWith(
    InterceptorsWrapper Function(HttpInterceptorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HttpInterceptorProvider._internal(
        (ref) => create(ref as HttpInterceptorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dio: dio,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<InterceptorsWrapper> createElement() {
    return _HttpInterceptorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HttpInterceptorProvider && other.dio == dio;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dio.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HttpInterceptorRef on AutoDisposeProviderRef<InterceptorsWrapper> {
  /// The parameter `dio` of this provider.
  Dio get dio;
}

class _HttpInterceptorProviderElement
    extends AutoDisposeProviderElement<InterceptorsWrapper>
    with HttpInterceptorRef {
  _HttpInterceptorProviderElement(super.provider);

  @override
  Dio get dio => (origin as HttpInterceptorProvider).dio;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
