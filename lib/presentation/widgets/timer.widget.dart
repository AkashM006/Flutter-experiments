import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/core/timer.util.dart';
import 'package:sample/domain/timer.entity.dart';
import 'package:sample/presentation/provider/timer.provider.dart';
import 'package:sample/presentation/widgets/blinking_text.widget.dart';

class TimerWidget extends ConsumerWidget {
  final Duration time;
  const TimerWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerObject = ref.watch(timerProvider(time));

    void onPlayOrPause() {
      TimerEntity timer = timerObject;
      if (timer.isRunning) {
        timer.pause();
      } else {
        timer.start();
      }
    }

    void onReset() {
      timerObject.reset();
    }

    return StreamBuilder(
      stream: timerObject.timer,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Loading...",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: Text("No Data Here"),
          );
        }

        final timerData = snapshot.data!;

        final time = timerData.time;
        final isRunning = timerData.isRunning;

        final hasStarted = time.inMicroseconds != 0;

        final textWidget = Text(
          formatDuration(timerData.time),
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        );

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isRunning || time.inSeconds == 0
                ? textWidget
                : BlinkingText(child: textWidget),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  iconSize: 50,
                  onPressed: onPlayOrPause,
                  icon: Icon(
                    isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  ),
                ),
                if (!isRunning && hasStarted)
                  const SizedBox(
                    width: 20,
                  ),
                if (!isRunning && hasStarted)
                  IconButton.outlined(
                    iconSize: 50,
                    onPressed: onReset,
                    icon: const Icon(Icons.undo_rounded),
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
