// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_controller.repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TasksControllerState {
  ControllerState get addTasksState => throw _privateConstructorUsedError;
  ControllerState get updateTaskState => throw _privateConstructorUsedError;
  ControllerState get removeTaskState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksControllerStateCopyWith<TasksControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksControllerStateCopyWith<$Res> {
  factory $TasksControllerStateCopyWith(TasksControllerState value,
          $Res Function(TasksControllerState) then) =
      _$TasksControllerStateCopyWithImpl<$Res, TasksControllerState>;
  @useResult
  $Res call(
      {ControllerState addTasksState,
      ControllerState updateTaskState,
      ControllerState removeTaskState});

  $ControllerStateCopyWith<$Res> get addTasksState;
  $ControllerStateCopyWith<$Res> get updateTaskState;
  $ControllerStateCopyWith<$Res> get removeTaskState;
}

/// @nodoc
class _$TasksControllerStateCopyWithImpl<$Res,
        $Val extends TasksControllerState>
    implements $TasksControllerStateCopyWith<$Res> {
  _$TasksControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addTasksState = null,
    Object? updateTaskState = null,
    Object? removeTaskState = null,
  }) {
    return _then(_value.copyWith(
      addTasksState: null == addTasksState
          ? _value.addTasksState
          : addTasksState // ignore: cast_nullable_to_non_nullable
              as ControllerState,
      updateTaskState: null == updateTaskState
          ? _value.updateTaskState
          : updateTaskState // ignore: cast_nullable_to_non_nullable
              as ControllerState,
      removeTaskState: null == removeTaskState
          ? _value.removeTaskState
          : removeTaskState // ignore: cast_nullable_to_non_nullable
              as ControllerState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ControllerStateCopyWith<$Res> get addTasksState {
    return $ControllerStateCopyWith<$Res>(_value.addTasksState, (value) {
      return _then(_value.copyWith(addTasksState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ControllerStateCopyWith<$Res> get updateTaskState {
    return $ControllerStateCopyWith<$Res>(_value.updateTaskState, (value) {
      return _then(_value.copyWith(updateTaskState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ControllerStateCopyWith<$Res> get removeTaskState {
    return $ControllerStateCopyWith<$Res>(_value.removeTaskState, (value) {
      return _then(_value.copyWith(removeTaskState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TasksControllerStateImplCopyWith<$Res>
    implements $TasksControllerStateCopyWith<$Res> {
  factory _$$TasksControllerStateImplCopyWith(_$TasksControllerStateImpl value,
          $Res Function(_$TasksControllerStateImpl) then) =
      __$$TasksControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ControllerState addTasksState,
      ControllerState updateTaskState,
      ControllerState removeTaskState});

  @override
  $ControllerStateCopyWith<$Res> get addTasksState;
  @override
  $ControllerStateCopyWith<$Res> get updateTaskState;
  @override
  $ControllerStateCopyWith<$Res> get removeTaskState;
}

/// @nodoc
class __$$TasksControllerStateImplCopyWithImpl<$Res>
    extends _$TasksControllerStateCopyWithImpl<$Res, _$TasksControllerStateImpl>
    implements _$$TasksControllerStateImplCopyWith<$Res> {
  __$$TasksControllerStateImplCopyWithImpl(_$TasksControllerStateImpl _value,
      $Res Function(_$TasksControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addTasksState = null,
    Object? updateTaskState = null,
    Object? removeTaskState = null,
  }) {
    return _then(_$TasksControllerStateImpl(
      addTasksState: null == addTasksState
          ? _value.addTasksState
          : addTasksState // ignore: cast_nullable_to_non_nullable
              as ControllerState,
      updateTaskState: null == updateTaskState
          ? _value.updateTaskState
          : updateTaskState // ignore: cast_nullable_to_non_nullable
              as ControllerState,
      removeTaskState: null == removeTaskState
          ? _value.removeTaskState
          : removeTaskState // ignore: cast_nullable_to_non_nullable
              as ControllerState,
    ));
  }
}

/// @nodoc

class _$TasksControllerStateImpl implements _TasksControllerState {
  const _$TasksControllerStateImpl(
      {this.addTasksState = const ControllerState(),
      this.updateTaskState = const ControllerState(),
      this.removeTaskState = const ControllerState()});

  @override
  @JsonKey()
  final ControllerState addTasksState;
  @override
  @JsonKey()
  final ControllerState updateTaskState;
  @override
  @JsonKey()
  final ControllerState removeTaskState;

  @override
  String toString() {
    return 'TasksControllerState(addTasksState: $addTasksState, updateTaskState: $updateTaskState, removeTaskState: $removeTaskState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksControllerStateImpl &&
            (identical(other.addTasksState, addTasksState) ||
                other.addTasksState == addTasksState) &&
            (identical(other.updateTaskState, updateTaskState) ||
                other.updateTaskState == updateTaskState) &&
            (identical(other.removeTaskState, removeTaskState) ||
                other.removeTaskState == removeTaskState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, addTasksState, updateTaskState, removeTaskState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksControllerStateImplCopyWith<_$TasksControllerStateImpl>
      get copyWith =>
          __$$TasksControllerStateImplCopyWithImpl<_$TasksControllerStateImpl>(
              this, _$identity);
}

abstract class _TasksControllerState implements TasksControllerState {
  const factory _TasksControllerState(
      {final ControllerState addTasksState,
      final ControllerState updateTaskState,
      final ControllerState removeTaskState}) = _$TasksControllerStateImpl;

  @override
  ControllerState get addTasksState;
  @override
  ControllerState get updateTaskState;
  @override
  ControllerState get removeTaskState;
  @override
  @JsonKey(ignore: true)
  _$$TasksControllerStateImplCopyWith<_$TasksControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
