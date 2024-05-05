import 'package:fpdart/fpdart.dart';
import 'package:sample/domain/task.model.dart';

abstract class TasksRepository {
  Stream<List<TaskModel>> watchTasks();
  Future<TaskModel> getTask(int id);
  Future<Either<String, void>> addTask(TaskModel task);
  Future<Either<String, void>> updateTask(TaskModel newTask);
  Future<Either<String, void>> removeTask(int id);
}
