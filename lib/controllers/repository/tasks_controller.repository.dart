import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample/utils/enums/controller_states.dart';

part 'tasks_controller.repository.freezed.dart';

@freezed
class TasksControllerState with _$TasksControllerState {
  const factory TasksControllerState({
    @Default(ControllerState()) ControllerState addTasksState,
    @Default(ControllerState()) ControllerState removeTaskState,
  }) = _TasksControllerState;
}

abstract interface class TasksController {
  Future<void> addTask(String title, String description);
  Future<void> removeTask(int id);
}
