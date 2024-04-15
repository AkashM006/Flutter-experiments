import 'package:flutter/material.dart';
import 'package:sample/domain/task.model.dart';
import 'package:sample/views/widgets/home/task_detail.widget.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });
  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskDetail(task: tasks[index]),
      itemCount: tasks.length,
    );
  }
}
