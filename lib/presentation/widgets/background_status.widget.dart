import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/presentation/provider/timer.provider.dart';

class BackgroundStatusWidget extends ConsumerStatefulWidget {
  const BackgroundStatusWidget({super.key});

  @override
  ConsumerState<BackgroundStatusWidget> createState() =>
      _BackgroundStatusWidgetState();
}

class _BackgroundStatusWidgetState extends ConsumerState<BackgroundStatusWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.detached:
        pauseAndPersist();
        break;
      case AppLifecycleState.paused:
        pauseAndPersist();
        break;
      case AppLifecycleState.resumed:
        resume();
        break;
      default:
        break;
    }
  }

  void resume() {}

  void pauseAndPersist() {
    ref.read(timerProvider(Duration.zero)).pause();
    ref.read(timerProvider(Duration.zero).notifier).persist();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
