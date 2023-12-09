import 'package:comdig/src/modules/auth/login/domain/entities/login_user_entity.dart';
import 'package:comdig/src/modules/auth/login/infra/models/login_user_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late LoginUserModel loginUserModel;

  setUp(() {
    loginUserModel = const LoginUserModel(
      email: "teste@email.com",
      password: "password",
    );
  });

  test("Should be a subclass of LoginUserEntity", () {
    expect(loginUserModel, isA<LoginUserEntity>());
  });

  test("Should return a valid LoginUserModel from a Map", () {
    final Map<String, dynamic> map = {
      "email": "teste@email.com",
      "password": "password",
    };

    final result = LoginUserModel.fromMap(map);

    expect(result, isA<LoginUserModel>());
  });

  test("Should return Map containing the LoginUserModel data", () {
    final expectedMap = {
      "email": "teste@email.com",
      "password": "password",
    };

    final result = loginUserModel.toMap();

    expect(result, expectedMap);
  });

  test("Should return Json containing the LoginUserModel data", () {
    String json = '{"email":"teste@email.com","password":"password"}';

    final result = LoginUserModel.fromJson(json);

    expect(result, isA<LoginUserModel>());
  });
  test("Should return a valid LoginUserModel from a Json", () {
    String expectedJson = '{"email":"teste@email.com","password":"password"}';

    final result = loginUserModel.toJson();

    expect(result, expectedJson);
  });
}
