import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample/controllers/repository/tasks_controller.repository.dart';
import 'package:sample/data/data_source/db/database.dart';
import 'package:sample/data/implementation/tasks_impl.repository.dart';
import 'package:sample/domain/task.model.dart';
import 'package:sample/locator.dart';

part 'tasks_impl.controller.g.dart';

final taskRepository = getIt<TasksRepositoryImpl>();
final db = getIt<AppDatabase>();

@riverpod
class TasksControllerImpl extends _$TasksControllerImpl
    implements TasksController {
  @override
  TasksControllerState build() {
    return const TasksControllerState();
  }

  @override
  Future<void> addTask(String title, String description) async {
    state = state.copyWith(
      addTasksState: state.addTasksState.setLoading(),
    );

    final result = await taskRepository.addTask(
      TaskModel(
        title: title,
        description: description,
      ),
    );

    state = result.fold(
      (l) => state.copyWith(
        addTasksState: state.addTasksState.setFailure(l),
      ),
      (r) => state.copyWith(
        addTasksState: state.addTasksState.setSuccess(null),
      ),
    );
  }

  @override
  Future<void> removeTask(int id) async {
    state = state.copyWith(removeTaskState: state.removeTaskState.setLoading());

    final result = await tasksRepository.removeTask(id);

    state = result.fold(
      (l) => state.copyWith(
        removeTaskState: state.removeTaskState.setFailure(l),
      ),
      (r) => state.copyWith(
        removeTaskState: state.removeTaskState.setSuccess(null),
      ),
    );
  }
}
