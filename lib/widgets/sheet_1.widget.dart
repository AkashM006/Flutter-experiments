import 'package:flutter/material.dart';

class Sheet1 extends StatelessWidget {
  const Sheet1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Text(
        "Screen 1",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
