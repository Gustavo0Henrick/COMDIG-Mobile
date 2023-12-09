import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/entities/favorite_entity.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/models/favorite_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late FavoriteModel favoriteModel;

  setUp(() {
    favoriteModel = const FavoriteModel(
      id: "id",
      name: "name",
      category: "category",
      type: "type",
      city: "city",
      image: "image",
      uf: "sp",
    );
  });

  test("Should be a subclass of FavoriteEntity", () {
    expect(favoriteModel, isA<FavoriteEntity>());
  });

  test("Should return a valid FavoriteModel from a Map", () {
    final Map<String, dynamic> map = {
      "id": "id",
      "name": "name",
      "category": "category",
      "type": "type",
      "city": "city",
      "image": "image",
      "uf": "sp",
    };

    final result = FavoriteModel.fromMap(map);

    expect(result, isA<FavoriteModel>());
  });

  test("Should return Map containing the FavoriteModel data", () {
    final expectedMap = {
      "id": "id",
      "name": "name",
      "category": "category",
      "type": "type",
      "city": "city",
      "image": "image",
      "uf": "sp",
    };

    final result = favoriteModel.toMap();

    expect(result, expectedMap);
  });
}
