import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/providers/auth.dart';
import 'package:sample/providers/router.dart';

class AuthCheckerMiddleware extends ConsumerStatefulWidget {
  final Widget child;
  final String path;
  final bool shouldBeLoggedIn;
  final bool canPop;

  const AuthCheckerMiddleware({
    super.key,
    required this.shouldBeLoggedIn,
    required this.path,
    required this.child,
    this.canPop = true,
  });

  @override
  ConsumerState<AuthCheckerMiddleware> createState() =>
      _AuthCheckerMiddlewareState();
}

class _AuthCheckerMiddlewareState extends ConsumerState<AuthCheckerMiddleware> {
  late bool canPop;

  @override
  void initState() {
    super.initState();
    canPop = widget.canPop;
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute =
        ref.watch(routerProvider).routeInformationProvider.value.uri.path;

    final isLoggedIn = ref.watch(authProvider);

    ref.listen(
      authProvider,
      (previous, next) {
        if (widget.path != currentRoute) return;

        if (!widget.shouldBeLoggedIn && next) {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(PAGES.home.path);
          }
        } else if (widget.shouldBeLoggedIn && !next) {
          context.push(PAGES.auth.path);
        }
      },
    );

    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) {
        if (didPop) return;
        if (!isLoggedIn && !widget.shouldBeLoggedIn) {
          setState(() {
            canPop = true;
          });
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            SystemNavigator.pop();
          });
        }
      },
      child: widget.child,
    );
  }
}
