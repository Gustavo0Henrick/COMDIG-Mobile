import 'package:comdig/src/modules/auth/forgotPassword/domain/repositories/i_reset_password_repository.dart';
import 'package:comdig/src/modules/auth/forgotPassword/domain/usecases/reset_password_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class ResetPasswordRepositoryMock extends Mock
    implements IResetPasswordRepository {}

main() {
  late ResetPasswordRepositoryMock repository;
  late ResetPasswordUsecase usecase;

  setUp(() {
    repository = ResetPasswordRepositoryMock();
    usecase = ResetPasswordUsecase(repository: repository);
  });

  ({String email, String code, String password}) resetData =
      (email: "email@test.com", code: "12345", password: "password");

  test("Should return a True from ResetPassword Method", () async {
    when(() => repository.resetPassword(resetData))
        .thenAnswer((_) async => const Right<Failure, bool>(true));
    final result = await usecase(resetData);

    expect(result, const Right(true));

    verify(() => repository.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.resetPassword(resetData)).thenAnswer((_) async =>
        Left<Failure, bool>(InvalidCredentialsFailure(messageError)));
    final result = await usecase(resetData);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.resetPassword(resetData)).thenAnswer(
        (_) async => Left<Failure, bool>(GeneralFailure(messageError)));
    final result = await usecase(resetData);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.resetPassword(resetData)).thenAnswer(
        (_) async => Left<Failure, bool>(BadRequestFailure(messageError)));
    final result = await usecase(resetData);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.resetPassword(resetData)).thenAnswer(
        (_) async => Left<Failure, bool>(RequestFailure(messageError)));
    final result = await usecase(resetData);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.resetPassword(resetData)).thenAnswer((_) async =>
        Left<Failure, bool>(InvalidCredentialsFailure(messageError)));
    final result = await usecase(resetData);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.resetPassword(
            (email: "email@test.com", code: "12345", password: "password")))
        .called(1);

    verifyNoMoreInteractions(repository);
  });
}
