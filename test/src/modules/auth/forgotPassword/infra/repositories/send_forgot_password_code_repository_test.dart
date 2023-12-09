import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/i_send_forgot_password_code_datasource.dart';
import 'package:comdig/src/modules/auth/forgotPassword/infra/repositories/send_forgot_password_code_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SendForgotPasswordCodeDatasourceMock extends Mock
    implements ISendForgotPasswordCodeDatasource {}

main() {
  late SendForgotPasswordCodeDatasourceMock datasource;
  late SendForgotPasswordCodeRepository repository;

  setUp(() {
    datasource = SendForgotPasswordCodeDatasourceMock();
    repository = SendForgotPasswordCodeRepository(datasource: datasource);
  });

  String email = "email@test.com";

  test("Should return a Success Message from SendForgotPasswordCode Method",
      () async {
    when(() => datasource.sendForgotPasswordCode(email))
        .thenAnswer((_) async => true);

    final result = await repository.sendForgotPasswordCode(email);

    expect(result, const Right(true));

    verify(() => datasource.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.sendForgotPasswordCode(email))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.sendForgotPasswordCode(email);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.sendForgotPasswordCode(email))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.sendForgotPasswordCode(email);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.sendForgotPasswordCode(email))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.sendForgotPasswordCode(email);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.sendForgotPasswordCode(email)).thenThrow(message);

    final result = await repository.sendForgotPasswordCode(email);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a InvalidCredentialsFailure when get InvalidCredentialsException from datasource",
      () async {
    var message = "Invalid Credentials Error";
    when(() => datasource.sendForgotPasswordCode(email)).thenThrow(
        InvalidCredentialsException(message: message, statusCode: 401));

    final result = await repository.sendForgotPasswordCode(email);

    expect(result, Left(InvalidCredentialsFailure(message)));

    verify(() => datasource.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
