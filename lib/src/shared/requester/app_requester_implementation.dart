import 'dart:convert' as convert;
import 'package:comdig/src/shared/helpers/debug_helper.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';
import 'package:comdig/src/shared/requester/interceptors/header_interceptor.dart';
import 'package:comdig/src/shared/requester/interceptors/refresh_token_interceptor.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppRequester implements IAppRequester {
  List<Interceptor> _customIntecerptors = [];

  static final AppRequester _singleton = AppRequester._internal();

  factory AppRequester({
    List<Interceptor>? customInterceptors,
  }) {
    if (customInterceptors != null) {
      _singleton._customIntecerptors = customInterceptors;
    }

    return _singleton;
  }

  AppRequester._internal();

  Future<void> _addToken(Dio dio) async {
    final accessToken =
        await SecureStorageManager().readData(StorageKeys.accessToken);

    if (accessToken != null) {
      dio.options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
  }

  Dio _setOptions(String url) {
    var dio = Dio();
    _addToken(dio);
    dio.interceptors.addAll(_customIntecerptors);

    dio.interceptors.add(HeaderInterceptor());
    dio.interceptors.add(RefreshTokenInterceptor());

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

    dio.options.baseUrl = url;
    return dio;
  }

  @override
  Future delete(
      {required String url,
      body,
      required Function(dynamic p1) fromJson}) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      invokeDio: (dio) async {
        return await dio
            .delete(url, data: body)
            .timeout(const Duration(seconds: 20));
      },
    );
  }

  @override
  Future get(
      {required String url,
      body,
      required Function(dynamic p1) fromJson}) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      invokeDio: (dio) async {
        return await dio.get(url).timeout(const Duration(seconds: 20));
      },
    );
  }

  @override
  Future post(
      {required String url,
      body,
      required Function(dynamic p1) fromJson}) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      invokeDio: (dio) async {
        return await dio
            .post(url, data: body)
            .timeout(const Duration(seconds: 20));
      },
    );
  }

  @override
  Future put(
      {required String url,
      body,
      required Function(dynamic p1) fromJson}) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      invokeDio: (dio) async {
        return await dio
            .put(url, data: body)
            .timeout(const Duration(seconds: 20));
      },
    );
  }

  Future _invokeRequest({
    required String url,
    required Function(dynamic p1) fromJson,
    required Future<Response<dynamic>?> Function(Dio) invokeDio,
  }) async {
    try {
      var dio = _setOptions(url);
      await _addToken(dio);

      late Response<dynamic>? response;

      response = await invokeDio(dio);

      return fromJson(response?.data);
    } on DioException catch (e) {
      int statusCode = e.response?.statusCode ?? 0;
      if (statusCode == 401) {
        throw InvalidCredentialsException(
          message: "E-mail e/ou senha inválidos.",
          statusCode: statusCode.toInt(),
        );
      } else if (statusCode >= 500) {
        throw ServerException(
          message: "Falha de Servidor. Por favor, tente novamente mais tarde.",
          statusCode: statusCode,
        );
      } else if (statusCode == 400) {
        throw BadRequestException(
          message: e.response?.data ??
              "Ops! Algo deu errado. Por favor, tente novamente.",
          statusCode: statusCode,
        );
      } else if (statusCode == 403) {
        throw UnauthorizedException(
          message: "Acesso não autorizado.",
          statusCode: statusCode,
        );
      } else if (statusCode == 404) {
        throw UnauthorizedException(
          message: "Ops! Algo deu errado.",
          statusCode: statusCode,
        );
      } else if (statusCode == 0) {
        throw RequestException(
          message: e.response?.data.toString() ?? "",
          statusCode: statusCode,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  static String handleErrorAndGetMessage(Object e, {String? message}) {
    String msg;
    if (message == null || message.isEmpty) {
      msg = "Falha na conexão com o servidor. ";
    } else {
      msg = message;
    }
    return "$msg (${getErrorCode(e)})";
  }

  static String handleErrorAndGetMessageFromException(Object e) {
    String msg;
    if (e is RequestException) {
      msg = convert.utf8.decode(getExceptionMessage(e)!.codeUnits);
    } else {
      msg = "Falha na conexão com o servidor.";
    }
    return msg;
  }

  static String getErrorCode(Object e) {
    String code;
    if (e is RequestException) {
      code = e.statusCode.toString();
    } else if (e is Exception) {
      code = "-1";
    } else {
      code = "-999";
    }
    return code;
  }

  static String? getExceptionMessage(Exception e) {
    return (e as RequestException).message;
  }
}
