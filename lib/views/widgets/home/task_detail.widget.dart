import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/controllers/implmentation/tasks_impl.controller.dart';
import 'package:sample/domain/task.model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sample/views/pages/detail.page.dart';

class TaskDetailItem extends ConsumerWidget {
  const TaskDetailItem({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRemovingTask =
        ref.watch(tasksControllerImplProvider).removeTaskState.isLoading;

    void handleDelete(BuildContext context) async {
      await ref.read(tasksControllerImplProvider.notifier).removeTask(task.id);
    }

    void tapHandler() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailPage(
            taskId: task.id,
          ),
        ),
      );
    }

    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        dragDismissible: true,
        closeThreshold: 0.1,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: isRemovingTask ? null : handleDelete,
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
            icon: Icons.delete_outline,
            label: "Delete",
            flex: 1,
          ),
        ],
      ),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        onTap: tapHandler,
      ),
    );
  }
}
