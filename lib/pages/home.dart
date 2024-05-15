import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/providers/counter.dart';
import 'package:sample/providers/router.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void redirectHandler() {
      context.push(PAGES.settings.path);
    }

    void incrementHandler() {
      ref.read(counterProvider.notifier).increment();
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: redirectHandler,
              child: const Text("Go to settings"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: incrementHandler,
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
