import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/entities/favorite_entity.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/repositories/i_get_favorites_repository.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetFavoritesRepositoryMock extends Mock
    implements IGetFavoritesRepository {}

main() {
  late GetFavoritesRepositoryMock repository;
  late GetFavoritesUsecase usecase;

  setUp(() {
    repository = GetFavoritesRepositoryMock();
    usecase = GetFavoritesUsecase(repository: repository);
  });

  String userId = "userId";

  List<FavoriteEntity> listFavorites = const [
    FavoriteEntity(
      id: "id",
      name: "name",
      category: "category",
      type: "type",
      city: "city",
      image: "image",
      uf: "sp",
    ),
  ];

  test("Should return a List<FavoriteEntity> from the GetFavorites Method",
      () async {
    when(() => repository.getFavorites(userId)).thenAnswer(
        (_) async => Right<Failure, List<FavoriteEntity>>(listFavorites));
    final result = await usecase(userId);

    expect(result, Right(listFavorites));

    verify(() => repository.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.getFavorites(userId)).thenAnswer((_) async =>
        Left<Failure, List<FavoriteEntity>>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.getFavorites(userId)).thenAnswer((_) async =>
        Left<Failure, List<FavoriteEntity>>(GeneralFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.getFavorites(userId)).thenAnswer((_) async =>
        Left<Failure, List<FavoriteEntity>>(BadRequestFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.getFavorites(userId)).thenAnswer((_) async =>
        Left<Failure, List<FavoriteEntity>>(RequestFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.getFavorites(userId)).thenAnswer((_) async =>
        Left<Failure, List<FavoriteEntity>>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getFavorites(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
