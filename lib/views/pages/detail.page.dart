import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/data/implementation/tasks_impl.repository.dart';
import 'package:sample/views/widgets/common/custom_app_bart.widget.dart';
import 'package:sample/views/widgets/common/custom_loader.widget.dart';
import 'package:sample/views/widgets/detail/task_detail.widget.dart';
import 'package:sample/views/widgets/error.widget.dart';

class DetailPage extends ConsumerWidget {
  final int taskId;
  const DetailPage({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskFuture = ref.watch(singleTaskProvider(taskId));

    return switch (taskFuture) {
      AsyncData(value: final task) => Scaffold(
          appBar: CustomAppBar(
            titleWidget: Text(task.title),
          ),
          body: TaskDetail(
            task: task,
          ),
        ),
      AsyncError(:final error) => Scaffold(
          appBar: const CustomAppBar(
            titleWidget: Text("Error"),
          ),
          body: Container(
            color: Theme.of(context).colorScheme.background,
            child: CustomErrorWidget(error.toString()),
          ),
        ),
      _ => const Scaffold(
          appBar: CustomAppBar(
            titleWidget: Text("Loading..."),
          ),
          body: CustomLoaderWidget(),
        ),
    };
  }
}
