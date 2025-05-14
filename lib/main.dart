import 'package:eclipse/app/pages/login_page.dart';
import 'package:eclipse/app/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  Application({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder:
            (BuildContext context, GoRouterState state) => const LoginPage(),
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder:
                (BuildContext context, GoRouterState state) =>
                    const LoginPage(),
          ),
          GoRoute(
            path: 'sign_up',
            builder:
                (BuildContext context, GoRouterState state) =>
                    const SignUpPage(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Wal0",
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness:
            ThemeMode.system == ThemeMode.dark
                ? Brightness.dark
                : Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routerConfig: _router,
    );
  }
}
