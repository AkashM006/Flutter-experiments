// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'controller_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ControllerState {
  String get message => throw _privateConstructorUsedError;
  ControllerStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ControllerStateCopyWith<ControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControllerStateCopyWith<$Res> {
  factory $ControllerStateCopyWith(
          ControllerState value, $Res Function(ControllerState) then) =
      _$ControllerStateCopyWithImpl<$Res, ControllerState>;
  @useResult
  $Res call({String message, ControllerStatus status});
}

/// @nodoc
class _$ControllerStateCopyWithImpl<$Res, $Val extends ControllerState>
    implements $ControllerStateCopyWith<$Res> {
  _$ControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ControllerStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ControllerStateImplCopyWith<$Res>
    implements $ControllerStateCopyWith<$Res> {
  factory _$$ControllerStateImplCopyWith(_$ControllerStateImpl value,
          $Res Function(_$ControllerStateImpl) then) =
      __$$ControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, ControllerStatus status});
}

/// @nodoc
class __$$ControllerStateImplCopyWithImpl<$Res>
    extends _$ControllerStateCopyWithImpl<$Res, _$ControllerStateImpl>
    implements _$$ControllerStateImplCopyWith<$Res> {
  __$$ControllerStateImplCopyWithImpl(
      _$ControllerStateImpl _value, $Res Function(_$ControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$ControllerStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ControllerStatus,
    ));
  }
}

/// @nodoc

class _$ControllerStateImpl extends _ControllerState {
  const _$ControllerStateImpl(
      {this.message = '', this.status = ControllerStatus.init})
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final ControllerStatus status;

  @override
  String toString() {
    return 'ControllerState(message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ControllerStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ControllerStateImplCopyWith<_$ControllerStateImpl> get copyWith =>
      __$$ControllerStateImplCopyWithImpl<_$ControllerStateImpl>(
          this, _$identity);
}

abstract class _ControllerState extends ControllerState {
  const factory _ControllerState(
      {final String message,
      final ControllerStatus status}) = _$ControllerStateImpl;
  const _ControllerState._() : super._();

  @override
  String get message;
  @override
  ControllerStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$ControllerStateImplCopyWith<_$ControllerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
