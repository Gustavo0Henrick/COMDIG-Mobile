import 'package:comdig/src/modules/auth/login/domain/entities/token_user_entity.dart';
import 'package:comdig/src/modules/auth/login/infra/models/token_user_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late TokenUserModel tokenUserModel;

  setUp(() {
    tokenUserModel = const TokenUserModel(
      accessToken: "accessToken",
      refreshToken: "refreshToken",
    );
  });

  test("Should be a subclass of TokenUserEntity", () {
    expect(tokenUserModel, isA<TokenUserEntity>());
  });

  test("Should return a valid TokenUserModel from a Map", () {
    final Map<String, dynamic> map = {
      "accessToken": "accessToken",
      "refreshToken": "refreshToken",
    };

    final result = TokenUserModel.fromMap(map);

    expect(result, isA<TokenUserModel>());
  });

  test("Should return Map containing the TokenUserModel data", () {
    final expectedMap = {
      "accessToken": "accessToken",
      "refreshToken": "refreshToken",
    };

    final result = tokenUserModel.toMap();

    expect(result, expectedMap);
  });

  test("Should return Json containing the TokenUserModel data", () {
    String json = '{"accessToken":"accessToken","refreshToken":"refreshToken"}';

    final result = TokenUserModel.fromJson(json);

    expect(result, isA<TokenUserModel>());
  });
  test("Should return a valid TokenUserModel from a Json", () {
    String expectedJson =
        '{"accessToken":"accessToken","refreshToken":"refreshToken"}';

    final result = tokenUserModel.toJson();

    expect(result, expectedJson);
  });
}
