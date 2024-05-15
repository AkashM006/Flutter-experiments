import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/providers/auth.dart';

class BackgroundListener extends ConsumerStatefulWidget {
  final Widget child;
  const BackgroundListener({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<BackgroundListener> createState() => _BackgroundListenerState();
}

class _BackgroundListenerState extends ConsumerState<BackgroundListener>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authProvider.notifier).logout();
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
