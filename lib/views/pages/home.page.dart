import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/controllers/implmentation/tasks_impl.controller.dart';
import 'package:sample/data/implementation/tasks_impl.repository.dart';
import 'package:flutter/material.dart';
import 'package:sample/utils/enums/controller_states.dart';
import 'package:sample/views/widgets/common/custom_app_bart.widget.dart';
import 'package:sample/views/widgets/common/custom_loader.widget.dart';
import 'package:sample/views/widgets/error.widget.dart';
import 'package:sample/views/widgets/home/tasks_list.widget.dart';
import 'package:sample/views/widgets/new_task/new_task.widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksStream = ref.watch(tasksProvider);

    ref.listen(
      tasksControllerImplProvider,
      (previous, next) {
        switch (next.removeTaskState.status) {
          case ControllerStatus.success:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Removed task successfully"),
              ),
            );
            break;
          case ControllerStatus.failure:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(next.removeTaskState.message),
              ),
            );
            break;
          default:
            break;
        }
      },
    );

    return Scaffold(
      appBar: const CustomAppBar(
        titleWidget: Text("Welcome"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showNewTaskForm(context),
        child: const Icon(Icons.add),
      ),
      body: switch (tasksStream) {
        AsyncData(value: final tasks) => TasksList(tasks: tasks),
        AsyncError(:final error) => CustomErrorWidget(error.toString()),
        _ => const CustomLoaderWidget(),
      },
    );
  }
}
