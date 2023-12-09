import 'package:comdig/src/modules/auth/login/domain/entities/login_response_entity.dart';
import 'package:comdig/src/modules/auth/login/infra/models/login_response_model.dart';
import 'package:comdig/src/modules/auth/login/infra/models/token_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late LoginResponseModel loginResponseModel;
  late DateTime date;

  setUp(() {
    date = DateTime.parse("2023-10-19 08:42:07.424917");
    loginResponseModel = LoginResponseModel(
      favorites: const [],
      tokenModel: const TokenResponseModel(
        accessToken: "accessToken",
        refreshToken: "refreshToken",
      ),
      id: "id",
      name: "Name",
      lastname: "Lastname",
      cellphone: "(00)00000-0000",
      city: "City",
      uf: "UF",
      birthdate: date,
      email: "teste@email.com",
      createdAt: date,
      updatedAt: date,
    );
  });

  test("Should be a subclass of LoginResponseEntity", () {
    expect(loginResponseModel, isA<LoginResponseEntity>());
  });

  test("Should return a valid LoginResponseModel from a Map", () {
    final Map<String, dynamic> map = {
      "favorites": [],
      "token": {
        "accessToken": "accessToken",
        "refreshToken": "refreshToken",
      },
      "id": "id",
      "name": "Name",
      "lastname": "Lastname",
      "cellphone": "(00)00000-0000",
      "city": "City",
      "uf": "UF",
      "birthdate": date,
      "email": "teste@email.com",
      "createdAt": date.toIso8601String(),
      "updatedAt": date.toIso8601String(),
    };

    final result = LoginResponseModel.fromMap(map);

    expect(result, isA<LoginResponseModel>());
  });

  test("Should return Map containing the LoginResponseModel data", () {
    final expectedMap = {
      'id': 'id',
      'name': 'Name',
      'lastname': 'Lastname',
      'email': 'teste@email.com',
      'cellphone': '(00)00000-0000',
      'city': 'City',
      'uf': 'UF',
      'birthdate': 1697715727424,
      'createdAt': 1697715727424,
      'updatedAt': 1697715727424,
      'favorites': [],
      'token': {'accessToken': 'accessToken', 'refreshToken': 'refreshToken'}
    };

    final result = loginResponseModel.toMap();

    expect(result, expectedMap);
  });
}
