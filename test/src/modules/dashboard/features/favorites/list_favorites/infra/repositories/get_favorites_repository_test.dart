import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/datasources/i_get_favorites_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/models/favorite_model.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/models/list_favorites_model.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/repositories/get_favorites_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetFavoritesDatasourceMock extends Mock
    implements IGetFavoritesDatasource {}

main() {
  late IGetFavoritesDatasource datasource;
  late GetFavoritesRepository repository;

  setUp(() {
    datasource = GetFavoritesDatasourceMock();
    repository = GetFavoritesRepository(datasource: datasource);
  });

  String userId = "userId";

  ListFavoritesModel listModelsModel = const ListFavoritesModel(
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

  test("Should return a Success Message from GetFavorites Method", () async {
    when(() => datasource.getFavorites(userId))
        .thenAnswer((_) async => listModelsModel);

    final result = await repository.getFavorites(userId);

    expect(
      result,
      const Right(
        [
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
      ),
    );

    verify(() => datasource.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.getFavorites(userId))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.getFavorites(userId);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.getFavorites(userId))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.getFavorites(userId);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.getFavorites(userId))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.getFavorites(userId);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.getFavorites(userId)).thenThrow(message);

    final result = await repository.getFavorites(userId);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a UnauthorizedFailure when get UnauthorizedException from datasource",
      () async {
    var message = "Unauthorized Error";
    when(() => datasource.getFavorites(userId))
        .thenThrow(UnauthorizedException(message: message, statusCode: 403));

    final result = await repository.getFavorites(userId);

    expect(result, Left(UnauthorizedFailure(message)));

    verify(() => datasource.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
