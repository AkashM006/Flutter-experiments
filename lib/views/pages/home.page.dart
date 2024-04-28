import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/controllers/tasks.controller.dart';
import 'package:sample/data/implementation/tasks_impl.repository.dart';
import 'package:flutter/material.dart';
import 'package:sample/utils/errors.dart';
import 'package:sample/views/widgets/common/error_dialog.widget.dart';
import 'package:sample/views/widgets/error.widget.dart';
import 'package:sample/views/widgets/home/tasks_list.widget.dart';
import 'package:sample/views/widgets/new_task/new_task.widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksStream = ref.watch(tasksProvider);

    ref.listen(
      tasksControllerProvider,
      (previous, next) {
        if (next is AsyncError) {
          final error = next.error as AppError;
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(message: error.message),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        shadowColor: Colors.grey,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showNewTaskForm(context),
        child: const Icon(Icons.add),
      ),
      body: switch (tasksStream) {
        AsyncData(value: final tasks) => TasksList(tasks: tasks),
        AsyncError(:final error) => CustomErrorWidget(error.toString()),
        _ => const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(),
            ),
          )
      },
    );
  }
}
