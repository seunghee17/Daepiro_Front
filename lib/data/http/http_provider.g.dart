// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$httpHash() => r'01fc8b1c5b186fa4b734348f776f574dbafdafd1';

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
String _$httpInterceptorHash() => r'809832b68a573d956f7217076c89c01e945a4e21';

/// See also [httpInterceptor].
@ProviderFor(httpInterceptor)
final httpInterceptorProvider =
    AutoDisposeProvider<InterceptorsWrapper>.internal(
  httpInterceptor,
  name: r'httpInterceptorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$httpInterceptorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HttpInterceptorRef = AutoDisposeProviderRef<InterceptorsWrapper>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
