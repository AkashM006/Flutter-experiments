import 'package:sample/database/database.dart';
import 'package:sample/database/schema/task.schema.dart';
import 'package:drift/drift.dart';

part 'task.dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin {
  TasksDao(super.db);

  Future<List<Task>> getTasks() async {
    return await select(tasks).get();
  }

  Future<Task> insertTask(TasksCompanion task) async {
    return await into(tasks).insertReturning(task);
  }
}
