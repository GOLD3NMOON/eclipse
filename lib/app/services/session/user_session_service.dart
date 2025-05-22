import 'package:eclipse/app/models/user_session_model.dart';
import 'package:eclipse/app/services/storage_service.dart';

class UserSessionService {
  static const String _sessionKey = 'auth_user_data';
  final StorageService _storage = StorageService();

  Future<void> setSession(UserSessionModel session) async {
    final jsonString = session.toJsonString();
    await _storage.write(_sessionKey, jsonString);
  }

  Future<UserSessionModel?> getSession() async {
    final jsonString = await _storage.read(_sessionKey);
    if (jsonString != null) {
      return UserSessionModel.fromJsonString(jsonString);
    }
    return null;
  }

  Future<bool> isLoggedIn() async {
    final session = await getSession();
    return session != null;
  }

  Future<void> clearSession() async {
    await _storage.delete(_sessionKey);
  }
}

