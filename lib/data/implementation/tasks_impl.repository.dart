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
  Future<Either<String, void>> removeTask(int id) async {
    return safeExecute(() => db.tasksDao.removeTask(id));
  }

  @override
  Future<TaskModel> getTask(int id) async {
    final task = await db.tasksDao.getTask(id);
    return TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
    );
  }

  @override
  Future<Either<String, void>> updateTask(TaskModel newTask) {
    return safeExecute(() => db.tasksDao.updateTask(newTask));
  }
}

@riverpod
Stream<List<TaskModel>> tasks(TasksRef ref) {
  return tasksRepository.watchTasks();
}

@riverpod
Future<TaskModel> singleTask(SingleTaskRef ref, int id) {
  return tasksRepository.getTask(id);
}
