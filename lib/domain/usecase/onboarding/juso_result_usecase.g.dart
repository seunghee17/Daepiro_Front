// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juso_result_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getjusoListHash() => r'2eb1d695c7096be3cf01fca7fba9a1188ea64909';

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

/// See also [getjusoList].
@ProviderFor(getjusoList)
const getjusoListProvider = GetjusoListFamily();

/// See also [getjusoList].
class GetjusoListFamily extends Family<AsyncValue<List<Juso>>> {
  /// See also [getjusoList].
  const GetjusoListFamily();

  /// See also [getjusoList].
  GetjusoListProvider call({
    required String inputJuso,
  }) {
    return GetjusoListProvider(
      inputJuso: inputJuso,
    );
  }

  @override
  GetjusoListProvider getProviderOverride(
    covariant GetjusoListProvider provider,
  ) {
    return call(
      inputJuso: provider.inputJuso,
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
  String? get name => r'getjusoListProvider';
}

/// See also [getjusoList].
class GetjusoListProvider extends AutoDisposeFutureProvider<List<Juso>> {
  /// See also [getjusoList].
  GetjusoListProvider({
    required String inputJuso,
  }) : this._internal(
          (ref) => getjusoList(
            ref as GetjusoListRef,
            inputJuso: inputJuso,
          ),
          from: getjusoListProvider,
          name: r'getjusoListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getjusoListHash,
          dependencies: GetjusoListFamily._dependencies,
          allTransitiveDependencies:
              GetjusoListFamily._allTransitiveDependencies,
          inputJuso: inputJuso,
        );

  GetjusoListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.inputJuso,
  }) : super.internal();

  final String inputJuso;

  @override
  Override overrideWith(
    FutureOr<List<Juso>> Function(GetjusoListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetjusoListProvider._internal(
        (ref) => create(ref as GetjusoListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        inputJuso: inputJuso,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Juso>> createElement() {
    return _GetjusoListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetjusoListProvider && other.inputJuso == inputJuso;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inputJuso.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetjusoListRef on AutoDisposeFutureProviderRef<List<Juso>> {
  /// The parameter `inputJuso` of this provider.
  String get inputJuso;
}

class _GetjusoListProviderElement
    extends AutoDisposeFutureProviderElement<List<Juso>> with GetjusoListRef {
  _GetjusoListProviderElement(super.provider);

  @override
  String get inputJuso => (origin as GetjusoListProvider).inputJuso;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
