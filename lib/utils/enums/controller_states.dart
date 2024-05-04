import 'package:freezed_annotation/freezed_annotation.dart';

part 'controller_states.freezed.dart';

@freezed
class ControllerState with _$ControllerState {
  const ControllerState._();

  const factory ControllerState({
    @Default('') String message,
    @Default(ControllerStatus.init) ControllerStatus status,
  }) = _ControllerState;

  bool get isLoading => status == ControllerStatus.loading;
  bool get isSuccess => status == ControllerStatus.success;
  bool get isFailure => status == ControllerStatus.failure;

  ControllerState setFailure(String message) {
    return ControllerState(
      message: message,
      status: ControllerStatus.failure,
    );
  }

  ControllerState setLoading() {
    return const ControllerState(
      message: '',
      status: ControllerStatus.loading,
    );
  }

  ControllerState setSuccess(String? message) {
    return ControllerState(
      message: message ?? '',
      status: ControllerStatus.success,
    );
  }
}

enum ControllerStatus {
  init,
  success,
  loading,
  failure,
}
