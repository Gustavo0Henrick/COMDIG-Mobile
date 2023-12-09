import 'package:comdig/src/modules/auth/login/infra/datasources/i_login_user_datasource.dart';
import 'package:comdig/src/modules/auth/login/infra/models/login_user_model.dart';
import 'package:comdig/src/modules/auth/login/infra/models/token_user_model.dart';
import 'package:comdig/src/modules/auth/login/infra/repositories/login_user_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginUserDatasourceMock extends Mock implements ILoginUserDatasource {}

main() {
  late LoginUserDatasourceMock datasource;
  late LoginUserRepository repository;

  setUp(() {
    datasource = LoginUserDatasourceMock();
    repository = LoginUserRepository(datasource: datasource);
  });

  const LoginUserModel loginUserModel = LoginUserModel(
    email: "teste@email.com",
    password: "password",
  );

  test("Should return a Success Message for a Login User Method", () async {
    when(() => datasource.loginUser(loginUserModel)).thenAnswer(
      (_) async => const TokenUserModel(
          accessToken: "accessToken", refreshToken: "refreshToken"),
    );

    final result = await repository.loginUser(loginUserModel);

    expect(
      result,
      const Right(
        TokenUserModel(
            accessToken: "accessToken", refreshToken: "refreshToken"),
      ),
    );

    verify(() => datasource.loginUser(
          const LoginUserModel(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.loginUser(loginUserModel))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.loginUser(loginUserModel);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.loginUser(
          const LoginUserModel(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.loginUser(loginUserModel))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.loginUser(loginUserModel);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.loginUser(
          const LoginUserModel(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.loginUser(loginUserModel))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.loginUser(loginUserModel);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.loginUser(
          const LoginUserModel(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.loginUser(loginUserModel)).thenThrow(message);

    final result = await repository.loginUser(loginUserModel);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.loginUser(
          const LoginUserModel(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a InvalidCredentialsFailure when get InvalidCredentialsException from datasource",
      () async {
    var message = "Invalid Credentials Error";
    when(() => datasource.loginUser(loginUserModel)).thenThrow(
        InvalidCredentialsException(message: message, statusCode: 401));

    final result = await repository.loginUser(loginUserModel);

    expect(result, Left(InvalidCredentialsFailure(message)));

    verify(() => datasource.loginUser(
          const LoginUserModel(
            email: "teste@email.com",
            password: "password",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
