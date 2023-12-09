import 'package:comdig/src/modules/auth/register/domain/entities/user_data_entity.dart';
import 'package:comdig/src/modules/auth/register/infra/models/user_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late UserDataModel userDataModel;

  setUp(() {
    userDataModel = const UserDataModel(
      name: "Name",
      lastname: "Lastname",
      cellphone: "(00)00000-0000",
      birthDate: "00/00/0000",
      email: "teste@email.com",
      password: "password",
      city: "City",
      uf: "UF",
    );
  });

  test("Should be a subclass of UserDataEntity", () {
    expect(userDataModel, isA<UserDataEntity>());
  });

  test("Should return a valid UserDataModel from a Map", () {
    final Map<String, dynamic> map = {
      "name": "Name",
      "lastname": "Lastname",
      "cellphone": "(00)00000-0000",
      "birthDate": "00/00/0000",
      "email": "teste@email.com",
      "password": "password",
      "city": "City",
      "uf": "UF",
    };

    final result = UserDataModel.fromMap(map);

    expect(result, isA<UserDataModel>());
  });

  test("Should return Map containing the UserDataModel data", () {
    final expectedMap = {
      'name': 'Name',
      'lastname': 'Lastname',
      'city': 'City',
      'uf': 'UF',
      'email': 'teste@email.com',
      'cellphone': '(00)00000-0000',
      'birthdate': '00/00/0000',
      'password': 'password'
    };

    final result = userDataModel.toMap();

    expect(result, expectedMap);
  });

  test("Should return Json containing the UserDataModel data", () {
    String json =
        '{"name":"Name", "lastname":"Lastname", "city":"City", "uf":"UF", "email":"teste@email.com", "cellphone":"(00)00000-0000", "birthdate":"00/00/0000", "password":"password"}';

    final result = UserDataModel.fromJson(json);

    expect(result, isA<UserDataModel>());
  });
  test("Should return a valid UserDataModel from a Json", () {
    String expectedJson =
        '{"name":"Name","lastname":"Lastname","city":"City","uf":"UF","email":"teste@email.com","cellphone":"(00)00000-0000","birthdate":"00/00/0000","password":"password"}';

    final result = userDataModel.toJson();

    expect(result, expectedJson);
  });
}
