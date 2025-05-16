import 'package:eclipse/app/config/app_config.dart';
import 'package:eclipse/app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth {
  Future<void> authenticate(String email, String password) async {
    final response = await http.post(
      Uri.parse('${AppConfig.revoltChatApiUrl}/auth/session/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      await StorageService().write('user_token', token);
      debugPrint('Token: $StorageService().read("user_token")');
    } else {
      throw Exception('Failed to authenticate ${response.statusCode}');
    }
  }
}
