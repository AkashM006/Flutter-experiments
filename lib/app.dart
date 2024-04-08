import 'package:flutter/material.dart';
import 'package:sample/widgets/bottom_sheet_content.widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  void openBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: false,
      builder: (context) => const BottomSheetContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () => openBottomSheet(context),
          child: const Text("Open Bottom Sheet"),
        ),
      ),
    );
  }
}
