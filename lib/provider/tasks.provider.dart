import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample/database/database.dart';
import 'package:sample/util/db.dart';

part 'tasks.provider.g.dart';

@riverpod
class TasksNotifier extends _$TasksNotifier {
  @override
  Future<List<Task>> build() async {
    final result = await AppDb.db?.tasksDao.getTasks();
    return result ?? [];
  }

  Future<void> addTask(String name, String description) async {
    final result = await AppDb.db!.tasksDao.insertTask(TasksCompanion(
      title: Value(name),
      description: Value(description),
    ));

    final previousState = await future;

    state = AsyncData([...previousState, result]);
  }
}
