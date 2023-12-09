import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/datasources/edit_user_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/models/edit_user_profile_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AppRequesterMock extends Mock implements IAppRequester {}

main() {
  late IAppRequester requester;
  late EditUserProfileDatasource datasource;

  setUp(() {
    requester = AppRequesterMock();
    datasource = EditUserProfileDatasource(requester: requester);
  });

  EditUserProfileModel editUserProfileModel = const EditUserProfileModel(
    id: "id",
    name: "name",
    lastname: "lastname",
    city: "city",
    uf: "uf",
    birthDate: "birthDate",
    cellphone: "cellphone",
  );

  test("Should call the EditUserProfile with correct Method", () async {
    when(() async => await requester.post(
          url: any(),
          body: editUserProfileModel.toMap(),
          fromJson: (value) => true,
        )).thenAnswer((_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(),
        ));

    await datasource.editUserProfile(editUserProfileModel);
  });

  test("Should return a Success Message when is successful", () async {
    when(() async => await requester.post(
          url: any(),
          body: editUserProfileModel.toMap(),
          fromJson: (value) => true,
        )).thenAnswer((_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(),
        ));

    Response response = await datasource.editUserProfile(editUserProfileModel);

    String result = response.data;
    expect(result, true);
  });

  test("Should throw a BadRequestException when the the request is invalid",
      () async {
    var message = "BadRequest Error";
    when(() => requester.post(
          url: any(named: "url"),
          body: editUserProfileModel.toMap(),
          fromJson: (value) => true,
        )).thenAnswer((_) async => Response(
          data: {"message": "BadRequest Error"},
          statusCode: 400,
          requestOptions: RequestOptions(
            data: {"message": "BadRequest Error"},
          ),
        ));

    final result = datasource.editUserProfile(editUserProfileModel);

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
          body: editUserProfileModel.toMap(),
          fromJson: (value) => true,
        )).thenAnswer((_) async => Response(
          data: {"message": "Server Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Server Error"},
          ),
        ));

    final result = datasource.editUserProfile(editUserProfileModel);

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
          body: editUserProfileModel.toMap(),
          fromJson: (value) => true,
        )).thenAnswer((_) async => Response(
          data: {"message": "Request Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Request Error"},
          ),
        ));

    final result = datasource.editUserProfile(editUserProfileModel);

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
          body: editUserProfileModel.toMap(),
          fromJson: (value) => true,
        )).thenAnswer((_) async => Response(
          data: {"message": "General Error"},
          statusCode: 000,
          requestOptions: RequestOptions(
            data: {"message": "General Error"},
          ),
        ));

    final result = datasource.editUserProfile(editUserProfileModel);

    expect(
      () => result,
      throwsA(
        GeneralException(message: message, statusCode: 000),
      ),
    );
  });

  test("Should throw a UnauthorizedException when the credentials are invalids",
      () async {
    var message = "General Error";
    when(() => requester.post(
          url: any(named: "url"),
          body: editUserProfileModel.toMap(),
          fromJson: (value) => true,
        )).thenAnswer((_) async => Response(
          data: {"message": "Unauthorized Error"},
          statusCode: 403,
          requestOptions: RequestOptions(
            data: {"message": "Unauthorized Error"},
          ),
        ));

    final result = datasource.editUserProfile(editUserProfileModel);

    expect(
      () => result,
      throwsA(
        UnauthorizedException(message: message, statusCode: 403),
      ),
    );
  });
}
