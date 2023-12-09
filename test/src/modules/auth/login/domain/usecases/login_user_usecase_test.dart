import 'package:comdig/src/modules/auth/login/domain/entities/login_response_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/entities/login_user_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/entities/token_response_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/repositories/i_login_user_repository.dart';
import 'package:comdig/src/modules/auth/login/domain/usecases/login_user_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginUserRepositoryMock extends Mock implements ILoginUserRepository {}

main() {
  late LoginUserRepositoryMock repository;
  late LoginUserUsecase usecase;

  setUp(() {
    repository = LoginUserRepositoryMock();
    usecase = LoginUserUsecase(repository: repository);
  });

  const LoginUserEntity loginUserEntity = LoginUserEntity(
    email: "teste@email.com",
    password: "password",
  );

  LoginResponseEntity loginResponseEntity = LoginResponseEntity(
    favorites: const [],
    token: const TokenResponseEntity(
        accessToken: "accessToken", refreshToken: "refreshToken"),
    id: "id",
    name: "Name",
    lastname: "Lastname",
    cellphone: "(00)00000-0000",
    city: "City",
    uf: "UF",
    birthdate: DateTime.now(),
    email: "teste@email.com",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  test("Should return a TokenUserEntity for a Login User Method", () async {
    when(() => repository.loginUser(loginUserEntity)).thenAnswer(
        (_) async => Right<Failure, LoginResponseEntity>(loginResponseEntity));
    final result = await usecase(loginUserEntity);

    expect(result, Right(loginResponseEntity));

    verify(() => repository.loginUser(
          const LoginUserEntity(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.loginUser(loginUserEntity)).thenAnswer((_) async =>
        Left<Failure, LoginResponseEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(loginUserEntity);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.loginUser(
          const LoginUserEntity(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.loginUser(loginUserEntity)).thenAnswer((_) async =>
        Left<Failure, LoginResponseEntity>(GeneralFailure(messageError)));
    final result = await usecase(loginUserEntity);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.loginUser(
          const LoginUserEntity(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.loginUser(loginUserEntity)).thenAnswer((_) async =>
        Left<Failure, LoginResponseEntity>(BadRequestFailure(messageError)));
    final result = await usecase(loginUserEntity);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.loginUser(
          const LoginUserEntity(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.loginUser(loginUserEntity)).thenAnswer((_) async =>
        Left<Failure, LoginResponseEntity>(RequestFailure(messageError)));
    final result = await usecase(loginUserEntity);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.loginUser(
          const LoginUserEntity(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.loginUser(loginUserEntity)).thenAnswer((_) async =>
        Left<Failure, LoginResponseEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(loginUserEntity);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.loginUser(
          const LoginUserEntity(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });
}
