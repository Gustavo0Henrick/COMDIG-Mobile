import 'package:comdig/src/modules/auth/login/domain/repositories/i_get_my_self_repository.dart';
import 'package:comdig/src/modules/auth/login/domain/usecases/get_my_self_usecase.dart';
import 'package:comdig/src/shared/entities/user_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class GetMySelfRepositoryMock extends Mock implements IGetMySelfRepository {}

main() {
  late GetMySelfRepositoryMock repository;
  late GetMySelfUsecase usecase;

  setUp(() {
    repository = GetMySelfRepositoryMock();
    usecase = GetMySelfUsecase(repository: repository);
  });

  const UserEntity userEntity = UserEntity(
    id: "id",
    name: "Name",
    lastname: "Lastname",
    cellphone: "(00)00000-0000",
    city: "City",
    uf: "UF",
    birthDate: "00/00/0000",
    email: "teste@email.com",
    createdAt: "createdAt",
    updatedAt: "updatedAt",
  );

  test("Should return a UserEntity from the GetMySelf Method", () async {
    when(() => repository.getMySelf("id"))
        .thenAnswer((_) async => const Right<Failure, UserEntity>(userEntity));
    final result = await usecase("id");

    expect(result, const Right(userEntity));

    verify(() => repository.getMySelf("id")).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.getMySelf("id")).thenAnswer((_) async =>
        Left<Failure, UserEntity>(InvalidCredentialsFailure(messageError)));
    final result = await usecase("id");

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getMySelf("id")).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.getMySelf("id")).thenAnswer(
        (_) async => Left<Failure, UserEntity>(GeneralFailure(messageError)));
    final result = await usecase("id");

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.getMySelf("id")).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.getMySelf("id")).thenAnswer((_) async =>
        Left<Failure, UserEntity>(BadRequestFailure(messageError)));
    final result = await usecase("id");

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.getMySelf("id")).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.getMySelf("id")).thenAnswer(
        (_) async => Left<Failure, UserEntity>(RequestFailure(messageError)));
    final result = await usecase("id");

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.getMySelf("id")).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.getMySelf("id")).thenAnswer((_) async =>
        Left<Failure, UserEntity>(InvalidCredentialsFailure(messageError)));
    final result = await usecase("id");

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getMySelf("id")).called(1);

    verifyNoMoreInteractions(repository);
  });
}
