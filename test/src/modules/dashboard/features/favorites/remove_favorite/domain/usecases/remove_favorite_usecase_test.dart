import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/domain/repositories/i_remove_favorite_repository.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RemoveFavoriteRepositoryMock extends Mock
    implements IRemoveFavoriteRepository {}

main() {
  late RemoveFavoriteRepositoryMock repository;
  late RemoveFavoriteUsecase usecase;

  setUp(() {
    repository = RemoveFavoriteRepositoryMock();
    usecase = RemoveFavoriteUsecase(repository: repository);
  });

  String companyId = "companyId";

  dynamic success = true;

  test("Should return a Success from the RemoveFavoriteById Method", () async {
    when(() => repository.removeFavoriteById(companyId))
        .thenAnswer((_) async => const Right<Failure, dynamic>(true));
    final result = await usecase(companyId);

    expect(result, Right(success));

    verify(() => repository.removeFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.removeFavoriteById(companyId)).thenAnswer((_) async =>
        Left<Failure, dynamic>(InvalidCredentialsFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.removeFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.removeFavoriteById(companyId)).thenAnswer(
        (_) async => Left<Failure, dynamic>(GeneralFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.removeFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.removeFavoriteById(companyId)).thenAnswer(
        (_) async => Left<Failure, dynamic>(BadRequestFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.removeFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.removeFavoriteById(companyId)).thenAnswer(
        (_) async => Left<Failure, dynamic>(RequestFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.removeFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.removeFavoriteById(companyId)).thenAnswer((_) async =>
        Left<Failure, dynamic>(InvalidCredentialsFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.removeFavoriteById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
