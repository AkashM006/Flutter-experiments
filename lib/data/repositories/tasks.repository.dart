import 'package:sample/domain/task.model.dart';

abstract class TasksRepository {
  Stream<List<TaskModel>> watchTasks();
  Future<void> addTask(TaskModel task);
}
