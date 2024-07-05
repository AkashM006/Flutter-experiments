import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  final void Function() onPrev;
  const ScreenTwo({
    super.key,
    required this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Page Two"),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: onPrev,
            child: const Text("Previous page"),
          ),
        ],
      ),
    );
  }
}
