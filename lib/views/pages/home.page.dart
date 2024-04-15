import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final tasksStream = ref.watch(tasks)
    return const Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
