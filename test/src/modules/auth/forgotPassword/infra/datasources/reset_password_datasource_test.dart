import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/reset_password_datasource.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AppRequesterMock extends Mock implements IAppRequester {}

main() {
  late IAppRequester requester;
  late ResetPasswordDatasource datasource;

  setUp(() {
    requester = AppRequesterMock();
    datasource = ResetPasswordDatasource(requester: requester);
  });

  ({String email, String code, String password}) resetData =
      (email: "email@test.com", code: "12345", password: "password");

  test("Should call the ResetPassword with correct Method", () async {
    when(() async => await requester.post(
          url: any(),
          body: {
            "code": resetData.code,
            "password": resetData.password,
            "email": resetData.email
          },
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"accessToke": "accessToke", "refreshToken": "refreshToken"},
          statusCode: 200,
          requestOptions: RequestOptions(
            data: {
              "code": resetData.code,
              "password": resetData.password,
              "email": resetData.email
            },
          ),
        ));

    await datasource.resetPassword(resetData);
  });

  test("Should return a Success Message when is successful", () async {
    when(() async => await requester.post(
          url: any(),
          body: {
            "code": resetData.code,
            "password": resetData.password,
            "email": resetData.email
          },
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {
            "code": resetData.code,
            "password": resetData.password,
            "email": resetData.email
          },
          statusCode: 200,
          requestOptions: RequestOptions(
            data: {
              "code": resetData.code,
              "password": resetData.password,
              "email": resetData.email
            },
          ),
        ));

    Response response = await datasource.resetPassword(resetData);

    String result = response.data;
    expect(result, "email@test.com");
  });

  test("Should throw a BadRequestException when the the request is invalid",
      () async {
    var message = "BadRequest Error";
    when(() => requester.post(
          url: any(named: "url"),
          body: {
            "code": resetData.code,
            "password": resetData.password,
            "email": resetData.email
          },
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "BadRequest Error"},
          statusCode: 400,
          requestOptions: RequestOptions(
            data: {"message": "BadRequest Error"},
          ),
        ));

    final result = datasource.resetPassword(resetData);

    expect(
      () => result,
      throwsA(
        BadRequestException(message: message, statusCode: 400),
      ),
    );
  });

  test("Should throw a ServerException when the server unavaliable", () async {
    var message = "Server Error";
    when(() => requester.post(
          url: any(named: "url"),
          body: {
            "code": resetData.code,
            "password": resetData.password,
            "email": resetData.email
          },
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Server Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Server Error"},
          ),
        ));

    final result = datasource.resetPassword(resetData);

    expect(
      () => result,
      throwsA(
        ServerException(message: message, statusCode: 500),
      ),
    );
  });

  test("Should throw a RequestException when the Request unavaliable",
      () async {
    var message = "Request Error";
    when(() => requester.post(
          url: any(named: "url"),
          body: {
            "code": resetData.code,
            "password": resetData.password,
            "email": resetData.email
          },
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Request Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Request Error"},
          ),
        ));

    final result = datasource.resetPassword(resetData);

    expect(
      () => result,
      throwsA(
        RequestException(message: message, statusCode: 500),
      ),
    );
  });

  test("Should throw a GeneralException when get a Excpetion", () async {
    var message = "General Error";
    when(() => requester.post(
          url: any(named: "url"),
          body: {
            "code": resetData.code,
            "password": resetData.password,
            "email": resetData.email
          },
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "General Error"},
          statusCode: 000,
          requestOptions: RequestOptions(
            data: {"message": "General Error"},
          ),
        ));

    final result = datasource.resetPassword(resetData);

    expect(
      () => result,
      throwsA(
        GeneralException(message: message, statusCode: 000),
      ),
    );
  });

  test(
      "Should throw a InvalidCredentialsException when the credentials are invalids",
      () async {
    var message = "General Error";
    when(() => requester.post(
          url: any(named: "url"),
          body: {
            "code": resetData.code,
            "password": resetData.password,
            "email": resetData.email
          },
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Invalid Credentials Error"},
          statusCode: 401,
          requestOptions: RequestOptions(
            data: {"message": "Invalid Credentials Error"},
          ),
        ));

    final result = datasource.resetPassword(resetData);

    expect(
      () => result,
      throwsA(
        GeneralException(message: message, statusCode: 401),
      ),
    );
  });
}
