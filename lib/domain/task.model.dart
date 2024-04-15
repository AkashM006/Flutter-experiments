import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    @Default(-1) int id,
    required String title,
    required String description,
  }) = _TaskModel;
}
