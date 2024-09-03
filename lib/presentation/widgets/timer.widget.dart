import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/core/timer.util.dart';
import 'package:sample/presentation/provider/timer.provider.dart';
import 'package:sample/presentation/widgets/blinking_text.widget.dart';
// import 'package:sample/data/timer.model.dart';
// import 'package:sample/core/timer.util.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sample/presentation/provider/timer.provider.dart';
// import 'package:sample/presentation/widgets/blinking_text.widget.dart';

// class TimerWidget extends ConsumerStatefulWidget {
//   final Duration time;
//   const TimerWidget({
//     super.key,
//     required this.time,
//   });

//   @override
//   ConsumerState<TimerWidget> createState() => _TimerWidgetState();
// }

// class _TimerWidgetState extends ConsumerState<TimerWidget> {
//   late TimerModel _timerModel;
//   bool _isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     // _timerModel = TimerModel(widget.time);
//     // _timerModel = ref.read(timerProvider)(widget.time);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _timerModel.dispose();
//   }

//   void onPlayOrPause() {
//     if (_isPlaying) {
//       _timerModel.pause();
//     } else {
//       _timerModel.start();
//     }

//     setState(() {
//       _isPlaying = !_isPlaying;
//     });
//   }

//   void onReset() {
//     _timerModel.reset();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: _timerModel.time,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Center(
//             child: Text("Something went wrong"),
//           );
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const CircularProgressIndicator(),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "Loading...",
//                   style: Theme.of(context).textTheme.headlineLarge,
//                 ),
//               ],
//             ),
//           );
//         }

//         if (!snapshot.hasData) {
//           return const Center(
//             child: Text("No Data Here"),
//           );
//         }

//         final textWidget = Text(
//           formatDuration(snapshot.data!),
//           style: Theme.of(context).textTheme.displayLarge,
//           textAlign: TextAlign.center,
//         );

//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _isPlaying || snapshot.data!.inSeconds == 0
//                 ? textWidget
//                 : BlinkingText(child: textWidget),
//             const SizedBox(
//               height: 25,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton.filled(
//                   iconSize: 50,
//                   onPressed: onPlayOrPause,
//                   icon: Icon(
//                     _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
//                   ),
//                 ),
//                 if (!_isPlaying && snapshot.data!.inSeconds != 0)
//                   const SizedBox(
//                     width: 20,
//                   ),
//                 if (!_isPlaying && snapshot.data!.inSeconds != 0)
//                   IconButton.outlined(
//                     iconSize: 50,
//                     onPressed: onReset,
//                     icon: const Icon(Icons.undo_rounded),
//                   )
//               ],
//             )
//           ],
//         );
//       },
//     );
//   }
// }

class TimerWidget extends ConsumerWidget {
  final Duration time;
  const TimerWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider(time));
    final isPlaying = timer.isRunning;

    void onPlayOrPause() {
      if (isPlaying) {
        timer.pause();
      } else {
        timer.start();
      }
    }

    void onReset() {
      timer.reset();
    }

    return StreamBuilder(
      stream: timer.time,
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

        final textWidget = Text(
          formatDuration(snapshot.data!),
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        );

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isPlaying || snapshot.data!.inSeconds == 0
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
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  ),
                ),
                if (!isPlaying && snapshot.data!.inSeconds != 0)
                  const SizedBox(
                    width: 20,
                  ),
                if (!isPlaying && snapshot.data!.inSeconds != 0)
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
