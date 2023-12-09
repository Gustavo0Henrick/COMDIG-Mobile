import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/entities/my_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/models/my_profile_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  DateTime date = DateTime.parse("2023-10-19T11:42:07.424917Z");
  late MyProfileModel myProfile;

  setUp(() {
    myProfile = MyProfileModel(
      id: "id",
      name: "name",
      lastname: "lastname",
      email: "email",
      birthDate: "birthDate",
      cellphone: "cellphone",
      city: "city",
      uf: "uf",
      createdAt: date.toUtc().toIso8601String(),
      updatedAt: date.toUtc().toIso8601String(),
    );
  });

  test("Should be a subclass of MyProfileEntity", () {
    expect(myProfile, isA<MyProfileEntity>());
  });

  test("Should return a valid MyProfileModel from a Map", () {
    final Map<String, dynamic> map = {
      "id": "id",
      "name": "name",
      "lastname": "lastname",
      "email": "email",
      "birthdate": "birthDate",
      "cellphone": "cellphone",
      "city": "city",
      "uf": "uf",
      "createdAt": "2023-10-19T11:42:07.424917Z",
      "updatedAt": "2023-10-19T11:42:07.424917Z",
    };

    final result = MyProfileModel.fromMap(map);

    expect(result, isA<MyProfileModel>());
  });

  test("Should return Map containing the MyProfileModel data", () {
    final expectedMap = {
      "id": "id",
      "name": "name",
      "lastname": "lastname",
      "email": "email",
      "birthdate": "birthDate",
      "cellphone": "cellphone",
      "city": "city",
      "uf": "uf",
      "createdAt": "2023-10-19T11:42:07.424917Z",
      "updatedAt": "2023-10-19T11:42:07.424917Z",
    };

    final result = myProfile.toMap();

    expect(result, expectedMap);
  });

  test("Should return Json containing the MyProfileModel data", () {
    String json =
        '{"id":"id","name":"name","lastname":"lastname","email":"email","birthdate":"birthData","cellphone":"cellphone","city":"city","uf":"uf","createdAt":"2023-10-19T11:42:07.424917Z","updatedAt":"2023-10-19T11:42:07.424917Z"}';

    final result = MyProfileModel.fromJson(json);

    expect(result, isA<MyProfileModel>());
  });
  test("Should return a valid MyProfileModel from a Json", () {
    String expectedJson =
        '{"id":"id","name":"name","lastname":"lastname","email":"email","birthdate":"birthDate","cellphone":"cellphone","city":"city","uf":"uf","createdAt":"2023-10-19T11:42:07.424917Z","updatedAt":"2023-10-19T11:42:07.424917Z"}';

    final result = myProfile.toJson();

    expect(result, expectedJson);
  });
}
