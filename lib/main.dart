import 'package:eclipse/app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  Application({super.key});

  final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: '/', builder: (context, state) => const LoginPage()),
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
