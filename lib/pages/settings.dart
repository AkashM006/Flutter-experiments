import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/providers/auth.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void logoutHandler() {
      ref.read(authProvider.notifier).logout();
    }

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: logoutHandler,
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
