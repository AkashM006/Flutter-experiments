import 'package:flutter/material.dart';
import 'package:sample/formatter.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [IntegerFormatter()],
        ),
      ),
    );
  }
}
