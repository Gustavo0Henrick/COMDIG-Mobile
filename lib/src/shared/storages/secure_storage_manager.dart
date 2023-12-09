import 'dart:developer';

import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager implements ISecureStorageManager {
  static const prefs = FlutterSecureStorage();

  @override
  Future<bool> saveData(String key, dynamic value) async {
    if (value is String) {
      await prefs.write(key: key, value: value);
      return true;
    } else {
      log("Invalid Type");
      throw TypeError();
    }
  }

  @override
  Future<String?> readData(String key) async {
    String? obj = await prefs.read(key: key);
    return obj;
  }

  @override
  Future deleteData(String key) async {
    return await prefs.delete(key: key);
  }
}
