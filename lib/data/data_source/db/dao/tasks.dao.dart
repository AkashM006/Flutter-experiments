import 'package:drift/drift.dart';
import 'package:sample/data/data_source/db/database.dart';
import 'package:sample/data/data_source/db/schema/tasks.schema.dart';
import 'package:sample/domain/task.model.dart';
import 'package:sample/utils/classes/errors.dart';

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

  Future<int> removeTask(int id) async {
    // try {
    //   return (delete(tasks)..where((tbl) => tbl.id.equals(id))).go();
    // } catch (error) {
    throw const AppError(
      message: "Unable to delete your task it may not exist. Please check",
    );
    // }
  }
}
