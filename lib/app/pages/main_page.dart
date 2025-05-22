import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:eclipse/app/models/user_session_model.dart';
import 'package:eclipse/app/services/session/user_session_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final UserSessionService _sessionService = UserSessionService();
  late Future<UserSessionModel?> _userSessionFuture;

  @override
  void initState() {
    super.initState();
    _userSessionFuture = _sessionService.getSession();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserSessionModel?>(
      future: _userSessionFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          debugPrint('Erro ao carregar sessão: ${snapshot.error}');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) context.go('/login');
          });
          return const Scaffold(
            body: Center(child: Text('Erro ao carregar sessão.')),
          );
        } else {
          final session = snapshot.data;
          debugPrint('Sessão carregada: ${session?.displayName}');

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              if (session != null && session.token.isNotEmpty) {
                context.go('/home');
              } else {
                context.go('/login');
              }
            }
          });

          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
