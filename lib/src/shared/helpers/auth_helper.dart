import 'dart:developer';

import 'package:comdig/src/shared/entities/user_entity.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:comdig/src/shared/storages/storage_manager.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

abstract class AuthHelper {
  static Future<void> logout(BuildContext context) async {
    try {
      Future.wait(
        [
          SecureStorageManager().deleteData(StorageKeys.accessToken),
          SecureStorageManager().deleteData(StorageKeys.refreshToken),
          SecureStorageManager().deleteData(StorageKeys.userId),
          SecureStorageManager().deleteData(StorageKeys.cellphone),
          StorageManager().deleteData(StorageKeys.email),
          StorageManager().deleteData(StorageKeys.name),
          StorageManager().deleteData(StorageKeys.lastname),
          StorageManager().deleteData(StorageKeys.birthDate),
          SecureStorageManager().deleteData(StorageKeys.createdAt),
          SecureStorageManager().deleteData(StorageKeys.updatedAt),
          SecureStorageManager().deleteData(StorageKeys.loged),
          SecureStorageManager().deleteData(StorageKeys.role),
        ],
      );
      AppRoute().pop(context);
      AppRoute().pushNamedReplaced(context, AppRoutesKey.login);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> login(
    BuildContext context,
    UserEntity userData,
    String accessToken,
    String refreshToken,
  ) async {
    try {
      Future.wait(
        [
          SecureStorageManager().saveData(StorageKeys.accessToken, accessToken),
          SecureStorageManager()
              .saveData(StorageKeys.refreshToken, refreshToken),
          SecureStorageManager().saveData(StorageKeys.userId, userData.id),
          SecureStorageManager()
              .saveData(StorageKeys.cellphone, userData.cellphone),
          StorageManager().saveData(StorageKeys.email, userData.email),
          StorageManager().saveData(StorageKeys.name, userData.name),
          StorageManager().saveData(StorageKeys.lastname, userData.lastname),
          StorageManager().saveData(StorageKeys.birthDate, userData.birthDate),
          SecureStorageManager()
              .saveData(StorageKeys.createdAt, userData.createdAt),
          SecureStorageManager()
              .saveData(StorageKeys.updatedAt, userData.updatedAt),
          SecureStorageManager().saveData(StorageKeys.loged, "true"),
          SecureStorageManager().saveData(StorageKeys.role, "user"),
        ],
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
