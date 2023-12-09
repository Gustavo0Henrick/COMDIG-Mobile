import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/infra/datasources/i_add_favorite_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/infra/repositories/add_favorite_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddFavoriteDatasourceMock extends Mock
    implements IAddFavoriteDatasource {}

main() {
  late IAddFavoriteDatasource datasource;
  late AddFavoriteRepository repository;

  setUp(() {
    datasource = AddFavoriteDatasourceMock();
    repository = AddFavoriteRepository(datasource: datasource);
  });

  String companyId = "companyId";

  dynamic success = true;

  test("Should return a Success Message from AddFavoriteById Method", () async {
    when(() => datasource.addFavoriteById(companyId))
        .thenAnswer((_) async => true);

    final result = await repository.addFavoriteById(companyId);

    expect(result, Right(success));

    verify(() => datasource.addFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.addFavoriteById(companyId))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.addFavoriteById(companyId);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.addFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.addFavoriteById(companyId))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.addFavoriteById(companyId);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.addFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.addFavoriteById(companyId))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.addFavoriteById(companyId);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.addFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.addFavoriteById(companyId)).thenThrow(message);

    final result = await repository.addFavoriteById(companyId);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.addFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a UnauthorizedFailure when get UnauthorizedException from datasource",
      () async {
    var message = "Unauthorized Error";
    when(() => datasource.addFavoriteById(companyId))
        .thenThrow(UnauthorizedException(message: message, statusCode: 403));

    final result = await repository.addFavoriteById(companyId);

    expect(result, Left(UnauthorizedFailure(message)));

    verify(() => datasource.addFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
