// import 'package:sample/domain/database.dart';
// import 'package:sample/locator.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'tasks.repository.g.dart';

// final db = getIt<AppDatabase>();
// final tasksRepository = getIt<TasksRepository>();

// class TasksRepository {
//   Stream<List<Task>> watchTasks() {
//     return db.tasksDao.watchTasks();
//   }
// }

// @riverpod
// Stream<List<Task>> watchTasks(WatchTasksRef ref) {
//   return tasksRepository.watchTasks();
// }

import 'package:sample/domain/database.dart';

abstract class TasksRepository {
  Stream<List<Task>> watchTasks();
}
