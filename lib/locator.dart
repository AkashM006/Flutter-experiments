import 'package:get_it/get_it.dart';
import 'package:sample/data/implementation/tasks_impl.repository.dart';
import 'package:sample/domain/database.dart';

final getIt = GetIt.I;

void setup() {
  getIt.registerLazySingleton(() => AppDatabase());
  getIt.registerLazySingleton(() => TasksRepositoryImpl());
}

void resetDBSingleton() {
  final db = getIt<AppDatabase>();
  getIt.resetLazySingleton(
    instance: db,
    disposingFunction: (db) => db.close(),
  );
}
