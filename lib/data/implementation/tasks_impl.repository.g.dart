// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_impl.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksHash() => r'02f57db64e4e51fecc136b58dfde050ac8323ede';

/// See also [tasks].
@ProviderFor(tasks)
final tasksProvider = AutoDisposeStreamProvider<List<TaskModel>>.internal(
  tasks,
  name: r'tasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TasksRef = AutoDisposeStreamProviderRef<List<TaskModel>>;
String _$singleTaskHash() => r'c7b6e8125a28e5a6198441e97a0064cc5f23ed52';

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

/// See also [singleTask].
@ProviderFor(singleTask)
const singleTaskProvider = SingleTaskFamily();

/// See also [singleTask].
class SingleTaskFamily extends Family<AsyncValue<TaskModel>> {
  /// See also [singleTask].
  const SingleTaskFamily();

  /// See also [singleTask].
  SingleTaskProvider call(
    int id,
  ) {
    return SingleTaskProvider(
      id,
    );
  }

  @override
  SingleTaskProvider getProviderOverride(
    covariant SingleTaskProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'singleTaskProvider';
}

/// See also [singleTask].
class SingleTaskProvider extends AutoDisposeFutureProvider<TaskModel> {
  /// See also [singleTask].
  SingleTaskProvider(
    int id,
  ) : this._internal(
          (ref) => singleTask(
            ref as SingleTaskRef,
            id,
          ),
          from: singleTaskProvider,
          name: r'singleTaskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleTaskHash,
          dependencies: SingleTaskFamily._dependencies,
          allTransitiveDependencies:
              SingleTaskFamily._allTransitiveDependencies,
          id: id,
        );

  SingleTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<TaskModel> Function(SingleTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SingleTaskProvider._internal(
        (ref) => create(ref as SingleTaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TaskModel> createElement() {
    return _SingleTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleTaskProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SingleTaskRef on AutoDisposeFutureProviderRef<TaskModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SingleTaskProviderElement
    extends AutoDisposeFutureProviderElement<TaskModel> with SingleTaskRef {
  _SingleTaskProviderElement(super.provider);

  @override
  int get id => (origin as SingleTaskProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
