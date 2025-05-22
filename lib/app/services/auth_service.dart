import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:eclipse/app/services/session/user_session_service.dart';
import 'package:eclipse/app/config/app_config.dart';
import 'package:eclipse/app/models/user_session_model.dart';

class AuthService {
    Future<void> authenticate(String email, String password) async {
        final uri = Uri.parse('${AppConfig.revoltChatApiUrl}/auth/session/login');

        final response = await http.post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'email': email, 'password': password}),
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          final userSession = UserSessionModel(
            token: data['token'],
            userId: data['user_id'],
            displayName: data['name']
          );
          await UserSessionService().setSession(userSession);
        } else {
          throw Exception('Falha na autenticação (${response.statusCode})');
        }
    }
}
