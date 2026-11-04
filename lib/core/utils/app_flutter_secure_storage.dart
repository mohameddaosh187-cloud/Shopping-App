import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppFlutterSecureStorage {
  static final storage = FlutterSecureStorage();

  static Future<void> save(String key, String? value) async {
    await storage.write(key: key, value: value);
  }

  static Future<String?> getData(String key) async {
    return await storage.read(key: key);
  }

  static Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}
