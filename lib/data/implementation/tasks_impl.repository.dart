import 'package:sample/data/repositories/tasks.repository.dart';
import 'package:sample/data/data_source/db/database.dart';
import 'package:sample/domain/task.model.dart';
import 'package:sample/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  Future<void> addTask(TaskModel task) async {
    // todo: probably throw error when something bad happens in tasksDao
    return await db.tasksDao.addTask(task);
  }
}

@riverpod
Stream<List<TaskModel>> tasks(TasksRef ref) {
  return tasksRepository.watchTasks();
}
