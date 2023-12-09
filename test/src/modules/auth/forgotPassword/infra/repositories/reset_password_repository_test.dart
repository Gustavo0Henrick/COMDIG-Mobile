import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/i_reset_password_datasource.dart';
import 'package:comdig/src/modules/auth/forgotPassword/infra/repositories/reset_password_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ResetPasswordDatasourceMock extends Mock
    implements IResetPasswordDatasource {}

main() {
  late ResetPasswordDatasourceMock datasource;
  late ResetPasswordRepository repository;

  setUp(() {
    datasource = ResetPasswordDatasourceMock();
    repository = ResetPasswordRepository(datasource: datasource);
  });

  ({String email, String code, String password}) resetData =
      (email: "email@test.com", code: "12345", password: "password");

  test("Should return a Success Message from ResetPassword Method", () async {
    when(() => datasource.resetPassword(resetData))
        .thenAnswer((_) async => true);

    final result = await repository.resetPassword(resetData);

    expect(result, const Right(true));

    verify(() => datasource.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.resetPassword(resetData))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.resetPassword(resetData);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.resetPassword(resetData))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.resetPassword(resetData);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.resetPassword(resetData))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.resetPassword(resetData);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.resetPassword(resetData)).thenThrow(message);

    final result = await repository.resetPassword(resetData);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a InvalidCredentialsFailure when get InvalidCredentialsException from datasource",
      () async {
    var message = "Invalid Credentials Error";
    when(() => datasource.resetPassword(resetData)).thenThrow(
        InvalidCredentialsException(message: message, statusCode: 401));

    final result = await repository.resetPassword(resetData);

    expect(result, Left(InvalidCredentialsFailure(message)));

    verify(() => datasource.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(datasource);
  });
}
