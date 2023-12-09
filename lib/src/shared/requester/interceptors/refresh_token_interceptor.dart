import 'package:comdig/src/shared/helpers/debug_helper.dart';
import 'package:comdig/src/shared/services/refresh_token_service.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RefreshTokenInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    String? accessToken =
        await SecureStorageManager().readData(StorageKeys.accessToken);

    Dio dio = Dio();
    if (err.response?.statusCode == 401 &&
        accessToken != null &&
        accessToken.isNotEmpty) {
      String newAccessToken = await RefreshTokenService.refreshToken();
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

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

      return handler.resolve(await dio.fetch(err.requestOptions));
    }
    return handler.next(err);
  }
}
