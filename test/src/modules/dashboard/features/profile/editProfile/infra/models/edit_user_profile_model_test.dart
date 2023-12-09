import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/models/edit_user_profile_model.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/entities/edit_user_profile_entity.dart';

import 'package:flutter_test/flutter_test.dart';

main() {
  late EditUserProfileModel editUserProfileModel;

  setUp(() {
    editUserProfileModel = const EditUserProfileModel(
      id: "id",
      name: "name",
      lastname: "lastname",
      city: "city",
      uf: "uf",
      birthDate: "birthDate",
      cellphone: "cellphone",
    );
  });

  test("Should be a subclass of EditUserProfileEntity", () {
    expect(editUserProfileModel, isA<EditUserProfileEntity>());
  });

  test("Should return a valid EditUserProfileModel from a Map", () {
    final Map<String, dynamic> map = {
      "id": "id",
      "name": "name",
      "lastname": "lastname",
      "city": "city",
      "uf": "uf",
      "birthDate": "birthDate",
      "cellphone": "cellphone",
    };

    final result = EditUserProfileModel.fromMap(map);

    expect(result, isA<EditUserProfileModel>());
  });

  test("Should return Map containing the EditUserProfileModel data", () {
    final expectedMap = {
      "id": "id",
      "name": "name",
      "lastname": "lastname",
      "city": "city",
      "uf": "uf",
      "birthDate": "birthDate",
      "cellphone": "cellphone",
    };

    final result = editUserProfileModel.toMap();

    expect(result, expectedMap);
  });

  test("Should return Json containing the EditUserProfileModel data", () {
    String json =
        '{"id":"id","name":"name","lastname":"lastname","city":"city","uf":"uf","birthDate":"birthDate","cellphone": "cellphone"}';

    final result = EditUserProfileModel.fromJson(json);

    expect(result, isA<EditUserProfileModel>());
  });
  test("Should return a valid EditUserProfileModel from a Json", () {
    String expectedJson =
        '{"id":"id","name":"name","lastname":"lastname","city":"city","uf":"uf","birthDate":"birthDate","cellphone": "cellphone"}';

    final result = editUserProfileModel.toJson();

    expect(result, expectedJson);
  });
}
