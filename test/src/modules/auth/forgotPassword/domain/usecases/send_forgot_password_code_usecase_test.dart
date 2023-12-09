import 'package:comdig/src/modules/auth/forgotPassword/domain/repositories/i_send_forgot_password_code_repository.dart';
import 'package:comdig/src/modules/auth/forgotPassword/domain/usecases/send_forgot_password_code_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class SendForgotPasswordCodeRepositoryMock extends Mock
    implements ISendForgotPasswordCodeRepository {}

main() {
  late SendForgotPasswordCodeRepositoryMock repository;
  late SendForgotPasswordCodeUsecase usecase;

  setUp(() {
    repository = SendForgotPasswordCodeRepositoryMock();
    usecase = SendForgotPasswordCodeUsecase(repository: repository);
  });

  String email = "email@test.com";

  test("Should return a True from SendForgotPasswordCode Method", () async {
    when(() => repository.sendForgotPasswordCode(email))
        .thenAnswer((_) async => const Right<Failure, bool>(true));
    final result = await usecase(email);

    expect(result, const Right(true));

    verify(() => repository.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.sendForgotPasswordCode(email)).thenAnswer((_) async =>
        Left<Failure, bool>(InvalidCredentialsFailure(messageError)));
    final result = await usecase(email);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.sendForgotPasswordCode(email)).thenAnswer(
        (_) async => Left<Failure, bool>(GeneralFailure(messageError)));
    final result = await usecase(email);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.sendForgotPasswordCode(email)).thenAnswer(
        (_) async => Left<Failure, bool>(BadRequestFailure(messageError)));
    final result = await usecase(email);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.sendForgotPasswordCode(email)).thenAnswer(
        (_) async => Left<Failure, bool>(RequestFailure(messageError)));
    final result = await usecase(email);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.sendForgotPasswordCode(email)).thenAnswer((_) async =>
        Left<Failure, bool>(InvalidCredentialsFailure(messageError)));
    final result = await usecase(email);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.sendForgotPasswordCode("email@test.com")).called(1);

    verifyNoMoreInteractions(repository);
  });
}
