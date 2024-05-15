import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample/auth_checker_middleware.dart';
import 'package:sample/background_listener.dart';
import 'package:sample/pages/auth.dart';
import 'package:sample/pages/home.dart';
import 'package:sample/pages/settings.dart';

part 'router.g.dart';

enum PAGES {
  auth,
  home,
  settings,
}

extension AppPages on PAGES {
  String get path {
    switch (this) {
      case PAGES.auth:
        return '/';
      case PAGES.home:
        return '/home';
      case PAGES.settings:
        return '/settings';
    }
  }

  Widget Function(BuildContext context, GoRouterState routerState) get builder {
    switch (this) {
      case PAGES.auth:
        return (context, routerState) => AuthCheckerMiddleware(
              path: path,
              shouldBeLoggedIn: false,
              child: const Auth(),
              canPop: false,
            );
      case PAGES.home:
        return (context, routerState) => BackgroundListener(
              child: AuthCheckerMiddleware(
                path: path,
                shouldBeLoggedIn: true,
                child: const Home(),
              ),
            );
      case PAGES.settings:
        return (context, routerState) => AuthCheckerMiddleware(
              path: path,
              shouldBeLoggedIn: true,
              child: const Settings(),
            );
    }
  }
}

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
      routes: PAGES.values
          .map(
            (page) => GoRoute(
              path: page.path,
              builder: page.builder,
            ),
          )
          .toList(),
    );
  }
}
