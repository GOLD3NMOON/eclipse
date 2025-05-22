import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// AndroidOptions _getAndroidOptions() => const AndroidOptions(
//     encryptedSharedPreferences: true
// );
//
// final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

class StorageService {
    final FlutterSecureStorage storage = FlutterSecureStorage(
        aOptions: const AndroidOptions(
            encryptedSharedPreferences: true
        ),
        iOptions: const IOSOptions(
            accessibility: KeychainAccessibility.first_unlock
        )
    );

    Future<void>? write(String key, String value) async {
        await storage.write(key: key, value: value);
    }

    Future<String?> read(String key) async {
        return await storage.read(key: key);
    }

    Future<void> delete(String key) async {
        await storage.delete(key: key);
    }

}
