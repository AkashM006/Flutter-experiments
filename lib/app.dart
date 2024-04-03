import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/pages/error.page.dart';
import 'package:sample/pages/loading.page.dart';
import 'package:sample/pages/tasks.page.dart';
import 'package:sample/provider/tasks.provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksNotifierProvider);

    return switch (tasks) {
      AsyncData(:final value) => TasksPage(tasks: value),
      AsyncError() => const ErrorPage(),
      _ => const LoadingPage(),
    };
  }
}
