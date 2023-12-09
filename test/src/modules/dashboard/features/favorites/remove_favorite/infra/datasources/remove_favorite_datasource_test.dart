import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/infra/datasources/remove_favorite_datasource.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AppRequesterMock extends Mock implements IAppRequester {}

main() {
  late IAppRequester requester;
  late RemoveFavoriteDatasource datasource;

  setUp(() {
    requester = AppRequesterMock();
    datasource = RemoveFavoriteDatasource(requester: requester);
  });

  String companyId = "companyId";

  test("Should call the RemoveFavoriteById with correct Method", () async {
    when(() async => await requester.post(
          url: any(),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"success": true},
          statusCode: 200,
          requestOptions: RequestOptions(data: "id"),
        ));

    await datasource.removeFavoriteById(companyId);
  });

  test("Should return a Success Message when is successful", () async {
    when(() async => await requester.post(
          url: any(),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"success": true},
          statusCode: 200,
          requestOptions: RequestOptions(
            data: {"success": true},
          ),
        ));

    Map<String, dynamic> listFavoriteModelsExpected = {"success": true};

    Response response = await datasource.removeFavoriteById(companyId);

    String result = response.data;
    expect(result, listFavoriteModelsExpected);
  });

  test("Should throw a BadRequestException when the the request is invalid",
      () async {
    var message = "BadRequest Error";
    when(() => requester.post(
          url: any(named: "url"),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "BadRequest Error"},
          statusCode: 400,
          requestOptions: RequestOptions(
            data: {"message": "BadRequest Error"},
          ),
        ));

    final result = datasource.removeFavoriteById(companyId);

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
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Server Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Server Error"},
          ),
        ));

    final result = datasource.removeFavoriteById(companyId);

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
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Request Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Request Error"},
          ),
        ));

    final result = datasource.removeFavoriteById(companyId);

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
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "General Error"},
          statusCode: 000,
          requestOptions: RequestOptions(
            data: {"message": "General Error"},
          ),
        ));

    final result = datasource.removeFavoriteById(companyId);

    expect(
      () => result,
      throwsA(
        GeneralException(message: message, statusCode: 000),
      ),
    );
  });

  test("Should throw a UnauthorizedException when the credentials are invalids",
      () async {
    var message = "Unauthorized Error";
    when(() => requester.post(
          url: any(named: "url"),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Unauthorized Error"},
          statusCode: 403,
          requestOptions: RequestOptions(
            data: {"message": "Unauthorized Error"},
          ),
        ));

    final result = datasource.removeFavoriteById(companyId);

    expect(
      () => result,
      throwsA(
        UnauthorizedException(message: message, statusCode: 403),
      ),
    );
  });
}
