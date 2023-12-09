import 'dart:developer';

import 'package:comdig/src/modules/auth/login/infra/models/token_response_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/helpers/debug_helper.dart';

import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class RefreshTokenService {
  static Future<String> refreshToken() async {
    String refreshToken =
        await SecureStorageManager().readData(StorageKeys.refreshToken) ?? "";

    Dio dio = Dio();

    if (debugMode) {
      dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        requestBody: true,
        error: true,
        maxWidth: 90,
        compact: true,
      ));
    }
    late Response result;
    try {
      result = await dio.post(
        EndpointsHelper.refreshTokenUser,
        options: Options(
          headers: {"Authorization": "Refresh $refreshToken"},
        ),
      );

      TokenResponseModel tokenResult = TokenResponseModel.fromMap(result.data);

      Future.wait([
        SecureStorageManager()
            .saveData(StorageKeys.refreshToken, tokenResult.refreshToken),
        SecureStorageManager()
            .saveData(StorageKeys.accessToken, tokenResult.accessToken),
      ]);

      return tokenResult.accessToken;
    } catch (e) {
      log(e.toString());

      return "";
    }
  }
}
