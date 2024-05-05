import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatelessWidget {
  const CustomLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
