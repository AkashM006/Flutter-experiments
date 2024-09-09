import 'package:flutter/material.dart';
import 'package:sample/presentation/widgets/background_status.widget.dart';
import 'package:sample/presentation/widgets/timer.widget.dart';

const zeroSecond = Duration(seconds: 0);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerWidget(
              time: zeroSecond,
            ),
            BackgroundStatusWidget(),
          ],
        ),
      ),
    );
  }
}
