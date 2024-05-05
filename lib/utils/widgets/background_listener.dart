import 'package:flutter/material.dart';
import 'package:sample/locator.dart';

class BackgroundListener extends StatefulWidget {
  const BackgroundListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<BackgroundListener> createState() => _BackgroundListenerState();
}

class _BackgroundListenerState extends State<BackgroundListener>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.paused || AppLifecycleState.detached:
        resetDBSingleton();
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
