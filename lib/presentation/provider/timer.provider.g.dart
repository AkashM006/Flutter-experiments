// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timerHash() => r'0c10d69e2151ea538900808b2a834de0f9cf5127';

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

/// See also [timer].
@ProviderFor(timer)
const timerProvider = TimerFamily();

/// See also [timer].
class TimerFamily extends Family<TimerEntity> {
  /// See also [timer].
  const TimerFamily();

  /// See also [timer].
  TimerProvider call(
    Duration time,
  ) {
    return TimerProvider(
      time,
    );
  }

  @override
  TimerProvider getProviderOverride(
    covariant TimerProvider provider,
  ) {
    return call(
      provider.time,
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
  String? get name => r'timerProvider';
}

/// See also [timer].
class TimerProvider extends AutoDisposeProvider<TimerEntity> {
  /// See also [timer].
  TimerProvider(
    Duration time,
  ) : this._internal(
          (ref) => timer(
            ref as TimerRef,
            time,
          ),
          from: timerProvider,
          name: r'timerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$timerHash,
          dependencies: TimerFamily._dependencies,
          allTransitiveDependencies: TimerFamily._allTransitiveDependencies,
          time: time,
        );

  TimerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.time,
  }) : super.internal();

  final Duration time;

  @override
  Override overrideWith(
    TimerEntity Function(TimerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TimerProvider._internal(
        (ref) => create(ref as TimerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        time: time,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<TimerEntity> createElement() {
    return _TimerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TimerProvider && other.time == time;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TimerRef on AutoDisposeProviderRef<TimerEntity> {
  /// The parameter `time` of this provider.
  Duration get time;
}

class _TimerProviderElement extends AutoDisposeProviderElement<TimerEntity>
    with TimerRef {
  _TimerProviderElement(super.provider);

  @override
  Duration get time => (origin as TimerProvider).time;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
