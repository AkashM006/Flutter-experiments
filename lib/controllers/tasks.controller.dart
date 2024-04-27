import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample/data/data_source/db/database.dart';
import 'package:sample/data/implementation/tasks_impl.repository.dart';
import 'package:sample/domain/task.model.dart';
import 'package:sample/locator.dart';

part 'tasks.controller.g.dart';

final taskRepository = getIt<TasksRepositoryImpl>();
final db = getIt<AppDatabase>();

@riverpod
class TasksController extends _$TasksController {
  @override
  FutureOr<void> build() {}

  Future<void> addNewTask(String title, String description) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => taskRepository.addTask(
        TaskModel(
          title: title,
          description: description,
        ),
      ),
    );
  }
}
