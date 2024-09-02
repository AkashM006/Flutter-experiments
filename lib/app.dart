import 'package:flutter/material.dart';
import 'package:sample/widgets/timer.widget.dart';

const zeroSecond = Duration(seconds: 0);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TimerWidget(
          time: zeroSecond,
        ),
      ),
    );
  }
}
