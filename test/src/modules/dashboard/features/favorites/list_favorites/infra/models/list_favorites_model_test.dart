import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/entities/favorite_entity.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/models/favorite_model.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/models/list_favorites_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ListFavoritesModel listFavoritesModel;

  setUp(() {
    listFavoritesModel = const ListFavoritesModel(
      listFavoriteModels: [
        FavoriteModel(
      id: "id",
      name: "name",
      category: "category",
      type: "type",
      city: "city",
      image: "image",
      uf: "sp",
        ),
      ],
    );
  });

  test("The List<FavoriteModel> should be a subclass of List<FavoriteEntity>",
      () {
    expect(listFavoritesModel.listFavoriteModels, isA<List<FavoriteEntity>>());
  });

  test("Should return a valid ListFavoritesModel from a Map", () {
    final Map<String, dynamic> map = {
      "listFavoriteModels": [
        {
       "id": "id",
      "name": "name",
      "category": "category",
      "type": "type",
      "city": "city",
      "image": "image",
      "uf": "sp",
        },
      ],
    };

    final result = ListFavoritesModel.fromMap(map);

    expect(result, isA<ListFavoritesModel>());
  });

  test("Should return Map containing the ListFavoritesModel data", () {
    final expectedMap = {
      "listFavoriteModels": [
        {
      "id": "id",
      "name": "name",
      "category": "category",
      "type": "type",
      "city": "city",
      "image": "image",
      "uf": "sp",
        },
      ],
    };

    final result = listFavoritesModel.toMap();

    expect(result, expectedMap);
  });
}
