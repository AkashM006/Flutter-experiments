import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  final void Function() onNext;
  const ScreenOne({
    super.key,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Page One"),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: onNext,
            child: const Text("Next page"),
          ),
        ],
      ),
    );
  }
}
