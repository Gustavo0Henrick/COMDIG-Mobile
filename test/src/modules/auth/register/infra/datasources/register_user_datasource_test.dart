import 'package:comdig/src/modules/auth/register/infra/datasources/register_user_datasource.dart';
import 'package:comdig/src/modules/auth/register/infra/models/user_data_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AppRequesterMock extends Mock implements IAppRequester {}

main() {
  late IAppRequester requester;
  late RegisterUserDatasource datasource;

  setUp(() {
    requester = AppRequesterMock();
    datasource = RegisterUserDatasource(requester: requester);
  });

  const UserDataModel userDataModel = UserDataModel(
    name: "Name",
    lastname: "Lastname",
    cellphone: "(00)00000-0000",
    birthDate: "00/00/0000",
    email: "teste@email.com",
    password: "password",
    city: "City",
    uf: "UF",
  );

  test("Should call the register with correct Method", () async {
    when(() async => await requester.post(
          url: "",
          body: userDataModel.toMap(),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "success"},
          statusCode: 200,
          requestOptions: RequestOptions(data: userDataModel.toMap()),
        ));

    await datasource.registerUser(userDataModel);
  });

  test("Should return a Success Message when is successful", () async {
    when(() async => await requester.post(
          url: "",
          body: userDataModel.toMap(),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "success"},
          statusCode: 200,
          requestOptions: RequestOptions(data: {"message": "success"}),
        ));

    String registerUserExpected = "success";

    Response response = await datasource.registerUser(userDataModel);

    String result = response.data;
    expect(result, registerUserExpected);
  });

  test("Should throw a BadRequestException when the the request is invalid",
      () async {
    var message = "BadRequest Error";
    when(() => requester.post(
          url: any(named: "url"),
          body: userDataModel.toMap(),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "BadRequest Error"},
          statusCode: 400,
          requestOptions: RequestOptions(
            data: {"message": "BadRequest Error"},
          ),
        ));

    final result = datasource.registerUser(userDataModel);

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
          body: userDataModel.toMap(),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Server Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Server Error"},
          ),
        ));

    final result = datasource.registerUser(userDataModel);

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
          body: userDataModel.toMap(),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "Request Error"},
          statusCode: 500,
          requestOptions: RequestOptions(
            data: {"message": "Request Error"},
          ),
        ));

    final result = datasource.registerUser(userDataModel);

    expect(
      () => result,
      throwsA(
        RequestException(message: message, statusCode: 500),
      ),
    );
  });

  test("Should throw a GeneralException when get a Exception", () async {
    var message = "General Error";
    when(() => requester.post(
          url: any(named: "url"),
          body: userDataModel.toMap(),
          fromJson: (value) => value["message"],
        )).thenAnswer((_) async => Response(
          data: {"message": "General Error"},
          statusCode: 000,
          requestOptions: RequestOptions(
            data: {"message": "General Error"},
          ),
        ));

    final result = datasource.registerUser(userDataModel);

    expect(
      () => result,
      throwsA(
        GeneralException(message: message, statusCode: 000),
      ),
    );
  });
}
