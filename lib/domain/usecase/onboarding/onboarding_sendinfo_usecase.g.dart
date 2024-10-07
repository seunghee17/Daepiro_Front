// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_sendinfo_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendOnboardingInfoUseCaseHash() =>
    r'9f8be38e7d14eef03784cdfa2cbfbb099679bf47';

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

/// See also [sendOnboardingInfoUseCase].
@ProviderFor(sendOnboardingInfoUseCase)
const sendOnboardingInfoUseCaseProvider = SendOnboardingInfoUseCaseFamily();

/// See also [sendOnboardingInfoUseCase].
class SendOnboardingInfoUseCaseFamily
    extends Family<AsyncValue<OnboardingInfoResponse>> {
  /// See also [sendOnboardingInfoUseCase].
  const SendOnboardingInfoUseCaseFamily();

  /// See also [sendOnboardingInfoUseCase].
  SendOnboardingInfoUseCaseProvider call({
    required OnboardingInfoRequest onboardingInfoRequest,
  }) {
    return SendOnboardingInfoUseCaseProvider(
      onboardingInfoRequest: onboardingInfoRequest,
    );
  }

  @override
  SendOnboardingInfoUseCaseProvider getProviderOverride(
    covariant SendOnboardingInfoUseCaseProvider provider,
  ) {
    return call(
      onboardingInfoRequest: provider.onboardingInfoRequest,
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
  String? get name => r'sendOnboardingInfoUseCaseProvider';
}

/// See also [sendOnboardingInfoUseCase].
class SendOnboardingInfoUseCaseProvider
    extends AutoDisposeFutureProvider<OnboardingInfoResponse> {
  /// See also [sendOnboardingInfoUseCase].
  SendOnboardingInfoUseCaseProvider({
    required OnboardingInfoRequest onboardingInfoRequest,
  }) : this._internal(
          (ref) => sendOnboardingInfoUseCase(
            ref as SendOnboardingInfoUseCaseRef,
            onboardingInfoRequest: onboardingInfoRequest,
          ),
          from: sendOnboardingInfoUseCaseProvider,
          name: r'sendOnboardingInfoUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendOnboardingInfoUseCaseHash,
          dependencies: SendOnboardingInfoUseCaseFamily._dependencies,
          allTransitiveDependencies:
              SendOnboardingInfoUseCaseFamily._allTransitiveDependencies,
          onboardingInfoRequest: onboardingInfoRequest,
        );

  SendOnboardingInfoUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.onboardingInfoRequest,
  }) : super.internal();

  final OnboardingInfoRequest onboardingInfoRequest;

  @override
  Override overrideWith(
    FutureOr<OnboardingInfoResponse> Function(
            SendOnboardingInfoUseCaseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendOnboardingInfoUseCaseProvider._internal(
        (ref) => create(ref as SendOnboardingInfoUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        onboardingInfoRequest: onboardingInfoRequest,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OnboardingInfoResponse> createElement() {
    return _SendOnboardingInfoUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendOnboardingInfoUseCaseProvider &&
        other.onboardingInfoRequest == onboardingInfoRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onboardingInfoRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendOnboardingInfoUseCaseRef
    on AutoDisposeFutureProviderRef<OnboardingInfoResponse> {
  /// The parameter `onboardingInfoRequest` of this provider.
  OnboardingInfoRequest get onboardingInfoRequest;
}

class _SendOnboardingInfoUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<OnboardingInfoResponse>
    with SendOnboardingInfoUseCaseRef {
  _SendOnboardingInfoUseCaseProviderElement(super.provider);

  @override
  OnboardingInfoRequest get onboardingInfoRequest =>
      (origin as SendOnboardingInfoUseCaseProvider).onboardingInfoRequest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
