import 'dart:developer';

import 'package:comdig/src/shared/storages/i_storage_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager implements IStorageManager {
  @override
  Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      log("Invalid Type");
      throw TypeError();
    }
  }

  @override
  Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  @override
  Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
