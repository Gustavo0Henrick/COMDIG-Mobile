import 'package:comdig/src/modules/auth/register/domain/entities/register_response_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/entities/user_data_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/repositories/i_register_user_repository.dart';
import 'package:comdig/src/modules/auth/register/domain/usecases/register_user_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class RegisterUserRepositoryMock extends Mock
    implements IRegisterUserRepository {}

main() {
  DateTime date = DateTime.parse("2023-10-19 08:42:07.424917");
  late RegisterUserRepositoryMock repository;
  late RegisterUserUsecase usecase;

  setUp(() {
    repository = RegisterUserRepositoryMock();
    usecase = RegisterUserUsecase(repository: repository);
  });

  RegisterResponseEntity registerResponseEntity = RegisterResponseEntity(
    id: "id",
    email: "email",
    name: "name",
    lastname: "lastname",
    cellphone: "cellphone",
    city: "city",
    uf: "UF",
    favorites: const [],
    birthdate: date,
    createdAt: date,
    updatedAt: date,
  );

  const UserDataEntity userDataEntity = UserDataEntity(
    name: "Name",
    lastname: "Lastname",
    city: "City",
    uf: "UF",
    cellphone: "(00)00000-0000",
    birthDate: "00/00/0000",
    email: "teste@email.com",
    password: "password",
  );

  test("Should return a RegisterResponseEntity for a Register User Method",
      () async {
    when(() => repository.registerUser(userDataEntity)).thenAnswer((_) async =>
        Right<Failure, RegisterResponseEntity>(registerResponseEntity));
    final result = await usecase(userDataEntity);

    expect(result, Right(registerResponseEntity));

    verify(() => repository.registerUser(
          const UserDataEntity(
            name: "Name",
            lastname: "Lastname",
            city: "City",
            uf: "UF",
            cellphone: "(00)00000-0000",
            birthDate: "00/00/0000",
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.registerUser(userDataEntity)).thenAnswer((_) async =>
        Left<Failure, RegisterResponseEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(userDataEntity);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.registerUser(
          const UserDataEntity(
            name: "Name",
            lastname: "Lastname",
            city: "City",
            uf: "UF",
            cellphone: "(00)00000-0000",
            birthDate: "00/00/0000",
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.registerUser(userDataEntity)).thenAnswer((_) async =>
        Left<Failure, RegisterResponseEntity>(GeneralFailure(messageError)));
    final result = await usecase(userDataEntity);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.registerUser(
          const UserDataEntity(
            name: "Name",
            lastname: "Lastname",
            city: "City",
            uf: "UF",
            cellphone: "(00)00000-0000",
            birthDate: "00/00/0000",
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.registerUser(userDataEntity)).thenAnswer((_) async =>
        Left<Failure, RegisterResponseEntity>(BadRequestFailure(messageError)));
    final result = await usecase(userDataEntity);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.registerUser(
          const UserDataEntity(
            name: "Name",
            lastname: "Lastname",
            city: "City",
            uf: "UF",
            cellphone: "(00)00000-0000",
            birthDate: "00/00/0000",
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.registerUser(userDataEntity)).thenAnswer((_) async =>
        Left<Failure, RegisterResponseEntity>(RequestFailure(messageError)));
    final result = await usecase(userDataEntity);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.registerUser(
          const UserDataEntity(
            name: "Name",
            lastname: "Lastname",
            city: "City",
            uf: "UF",
            cellphone: "(00)00000-0000",
            birthDate: "00/00/0000",
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });
}
