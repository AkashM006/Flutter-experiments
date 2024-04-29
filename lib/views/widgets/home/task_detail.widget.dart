import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/controllers/tasks.controller.dart';
import 'package:sample/domain/task.model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskDetail extends ConsumerStatefulWidget {
  const TaskDetail({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  ConsumerState<TaskDetail> createState() => _TaskDetail();
}

class _TaskDetail extends ConsumerState<TaskDetail>
    with TickerProviderStateMixin {
  late final controller = SlidableController(this);

  void handleDelete(BuildContext context) async {
    final result = await ref
        .read(tasksControllerProvider.notifier)
        .removeTask(widget.task.id);
    final currentState = ref.read(tasksControllerProvider);
    if (context.mounted && !result && currentState is! AsyncError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Not able to delete your task. Check if it exists",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      controller: controller,
      endActionPane: ActionPane(
        extentRatio: 0.25,
        dragDismissible: true,
        closeThreshold: 0.1,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: handleDelete,
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
            icon: Icons.delete_outline,
            label: "Delete",
            flex: 1,
          ),
        ],
      ),
      child: ListTile(
        title: Text(widget.task.title),
        subtitle: Text(widget.task.description),
      ),
    );
  }
}
