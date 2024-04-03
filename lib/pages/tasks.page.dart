import 'package:flutter/material.dart';
import 'package:sample/database/database.dart';
import 'package:sample/widgets/task.widget.dart';
import 'package:sample/widgets/task_form.widget.dart';

class TasksPage extends StatelessWidget {
  final List<Task> tasks;

  const TasksPage({
    super.key,
    required this.tasks,
  });

  void _addHandler(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const TaskForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Tasks: $tasks");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        actions: [
          IconButton(
            onPressed: () => _addHandler(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) => TaskItem(
            title: tasks[index].title,
            description: tasks[index].description,
          ),
        ),
      ),
    );
  }
}
