import 'package:flutter/material.dart';
import 'package:sample/pages_home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    void onPress() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PagesHome(),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: onPress,
          child: const Text("Go Home"),
        ),
      ),
    );
  }
}
