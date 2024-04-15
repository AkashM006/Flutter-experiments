import 'package:sample/data/repositories/tasks.repository.dart';
import 'package:sample/domain/database.dart';
import 'package:sample/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tasks_impl.repository.g.dart';

final db = getIt<AppDatabase>();
final tasksRepository = getIt<TasksRepositoryImpl>();

class TasksRepositoryImpl implements TasksRepository {
  @override
  Stream<List<Task>> watchTasks() {
    return db.tasksDao.watchTasks();
  }
}

@riverpod
Stream<List<Task>> watchTasks(WatchTasksRef ref) {
  return tasksRepository.watchTasks();
}
