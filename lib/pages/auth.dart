import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/providers/auth.dart';

class Auth extends ConsumerWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void loginHandler() {
      ref.read(authProvider.notifier).login();
    }

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: loginHandler,
          child: const Text("Login"),
        ),
      ),
    );
  }
}
