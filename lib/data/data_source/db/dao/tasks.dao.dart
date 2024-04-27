import 'package:drift/drift.dart';
import 'package:sample/data/data_source/db/database.dart';
import 'package:sample/data/data_source/db/schema/tasks.schema.dart';
import 'package:sample/domain/task.model.dart';
import 'package:sample/utils/errors.dart';

part 'tasks.dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin {
  TasksDao(super.db);

  Stream<List<Task>> watchTasks() {
    return (select(tasks)).watch();
  }

  Future<List<Task>> getTasks() async {
    return await (select(tasks)).get();
  }

  Future<void> addTask(TaskModel task) async {
    try {
      await into(tasks).insert(TasksCompanion(
        id: const Value(
          -1,
        ), // comment this to test error case, how to throw it and handle it
        title: Value(task.title),
        description: Value(task.description),
      ));
    } catch (error) {
      if (error is InvalidDataException) {
        final errorFields = error.errors.entries
            .map((e) => e.key.dartGetterName.toString())
            .toList()
            .join(', ');
        throw DataMigrationError(fields: errorFields);
      }
      rethrow;
    }
  }
}
