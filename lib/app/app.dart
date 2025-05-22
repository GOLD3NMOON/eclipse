import 'package:eclipse/app/pages/auth/login_page.dart';
import 'package:eclipse/app/pages/home_page.dart';
import 'package:eclipse/app/pages/auth/sign_up_page.dart';
import 'package:eclipse/app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder:
            (BuildContext context, GoRouterState state) => const MainPage(),
        routes: <RouteBase>[
          GoRoute(
            path: 'home',
            builder: 
                (BuildContext context, GoRouterState state) =>
                 const HomePage(),
            ),
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
      title: "Eclipse",
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
