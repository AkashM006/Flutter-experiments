import 'package:sample/database/database.dart';

class AppDb {
  static AppDatabase? _db;

  static AppDatabase? get db {
    _db = _db ?? AppDatabase();
    return _db;
  }
}
