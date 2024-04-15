import 'package:drift/drift.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(
        min: 2,
        max: 30,
      )();
  TextColumn get description => text().withLength(
        max: 500,
      )();
  DateTimeColumn get createdAt => dateTime()();
}
