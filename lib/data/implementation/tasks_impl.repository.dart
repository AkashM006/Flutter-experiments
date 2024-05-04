import 'package:sample/data/repositories/tasks.repository.dart';
import 'package:sample/data/data_source/db/database.dart';
import 'package:sample/domain/task.model.dart';
import 'package:sample/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sample/utils/functions/safe_execute.dart';

part 'tasks_impl.repository.g.dart';

final db = getIt<AppDatabase>();
final tasksRepository = getIt<TasksRepositoryImpl>();

class TasksRepositoryImpl implements TasksRepository {
  @override
  Stream<List<TaskModel>> watchTasks() {
    return db.tasksDao.watchTasks().map(
          (event) => event
              .map(
                (e) => TaskModel(
                  id: e.id,
                  title: e.title,
                  description: e.description,
                ),
              )
              .toList(),
        );
  }

  @override
  Future<Either<String, void>> addTask(TaskModel task) async {
    return safeExecute<void>(() => db.tasksDao.addTask(task));
  }

  @override
  Future<int> removeTask(int id) async {
    return await db.tasksDao.removeTask(id);
  }
}

@riverpod
Stream<List<TaskModel>> tasks(TasksRef ref) {
  return tasksRepository.watchTasks();
}
