import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/datasources/get_my_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/models/my_profile_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AppRequesterMock extends Mock implements IAppRequester {}

main() {
  late IAppRequester requester;
  late GetMyProfileDatasource datasource;

  setUp(() {
    requester = AppRequesterMock();
    datasource = GetMyProfileDatasource(requester: requester);
  });

  String userId = "userId";

  MyProfileModel myProfile = const MyProfileModel(
    id: "id",
    name: "name",
    lastname: "lastname",
    email: "email",
    birthDate: "birthDate",
    cellphone: "cellphone",
    city: "city",
    uf: "uf",
    createdAt: "createdAt",
    updatedAt: "updatedAt",
  );

  test("Should call the GetMyProfile with correct Method", () async {
    when(() async => await requester.get(
          url: any(),
          fromJson: (value) => myProfile,
        )).thenAnswer((_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(),
        ));

    await datasource.getMyProfile(userId);
  });

  test("Should return a Success Message when is successful", () async {
    when(() async => await requester.get(
          url: any(),
          fromJson: (value) => myProfile,
        )).thenAnswer((_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(),
        ));

    Response response = await datasource.getMyProfile(userId);

    String result = response.data;
    expect(result, myProfile);
  });

  test("Should throw a BadRequestException when the the request is invalid",
      () async {
    var message = "BadRequest Error";
    when(() => requester.get(
          url: any(named: "url"),
          fromJson: (value) => myProfile,
        )).thenAnswer((_) async => Response(
          data: {"message": "BadRequest Error"},
          statusCode: 400,
          requestOptions: RequestOptions(
            data: {"message": "BadRequest Error"},
          ),
        ));

    final result = datasource.getMyProfile(userId);

    expect(
      () => result,
      throwsA(
        BadRequestException(message: message, statusCode: 400),
      ),
    );
  });

  test("Should throw a ServerException when the server unavaliable", () async {
    var message = "Server Error";
    when(() => requester.get(
          url: any(named: "url"),
          fromJson: (value) => myProfile,
        )).thenAnswer((_) async => Response(
          data: {"message": "Server Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Server Error"},
          ),
        ));

    final result = datasource.getMyProfile(userId);

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
    when(() => requester.get(
          url: any(named: "url"),
          fromJson: (value) => myProfile,
        )).thenAnswer((_) async => Response(
          data: {"message": "Request Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Request Error"},
          ),
        ));

    final result = datasource.getMyProfile(userId);

    expect(
      () => result,
      throwsA(
        RequestException(message: message, statusCode: 500),
      ),
    );
  });

  test("Should throw a GeneralException when get a Excpetion", () async {
    var message = "General Error";
    when(() => requester.get(
          url: any(named: "url"),
          fromJson: (value) => myProfile,
        )).thenAnswer((_) async => Response(
          data: {"message": "General Error"},
          statusCode: 000,
          requestOptions: RequestOptions(
            data: {"message": "General Error"},
          ),
        ));

    final result = datasource.getMyProfile(userId);

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
    when(() => requester.get(
          url: any(named: "url"),
          fromJson: (value) => myProfile,
        )).thenAnswer((_) async => Response(
          data: {"message": "Unauthorized Error"},
          statusCode: 403,
          requestOptions: RequestOptions(
            data: {"message": "Unauthorized Error"},
          ),
        ));

    final result = datasource.getMyProfile(userId);

    expect(
      () => result,
      throwsA(
        UnauthorizedException(message: message, statusCode: 403),
      ),
    );
  });
}
