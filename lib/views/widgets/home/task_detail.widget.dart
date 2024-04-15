import 'package:flutter/material.dart';
import 'package:sample/domain/task.model.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
    );
  }
}
