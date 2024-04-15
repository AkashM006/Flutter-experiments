import 'package:drift/drift.dart';
import 'package:sample/domain/database.dart';
import 'package:sample/domain/schema/tasks.schema.dart';

part 'tasks.dao.g.dart';

@DriftAccessor(tables: [Tasks]) // tables used in the current DAO
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin {
  TasksDao(super.db);

  Stream<List<Task>> watchTasks() {
    return (select(tasks)).watch();
  }
}

// @riverpod
// Stream<List<Task>> watchTasks(WatchTasksRef ref) {
//   final db = getIt<AppDatabase>();

//   return db.tasksRepository.watchTasks();
// }
