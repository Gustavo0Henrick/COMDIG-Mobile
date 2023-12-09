import 'package:comdig/src/modules/auth/forgotPassword/domain/usecases/send_forgot_password_code_usecase.dart';
import 'package:comdig/src/modules/auth/forgotPassword/presenter/blocs/cubits/send_forgot_password_code_cubit.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class SendForgotPasswordCodeCubitMock extends Mock
    implements SendForgotPasswordCodeCubit {}

class SendForgotPasswordCodeUsecaseMock extends Mock
    implements SendForgotPasswordCodeUsecase {}

void main() {
  late SendForgotPasswordCodeCubit cubit;
  late SendForgotPasswordCodeUsecase usecase;

  setUp(() {
    usecase = SendForgotPasswordCodeUsecaseMock();
    cubit = SendForgotPasswordCodeCubit(usecase: usecase);
  });

  String email = "email@test.com";

  blocTest<SendForgotPasswordCodeCubit, SendForgotPasswordCodeStates>(
    'When attempt to Send Forgot Password Code an User is made then SendForgotPasswordCodeLoadingState and SendForgotPasswordCodeSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => usecase(email))
          .thenAnswer((_) async => const Right<Failure, bool>(true));
    },
    act: (SendForgotPasswordCodeCubit cubit) =>
        cubit.sendForgotPasswordCode(email),
    expect: () => [
      SendForgotPasswordCodeLoadingState(),
      SendForgotPasswordCodeSuccessState(result: true),
    ],
  );

  blocTest<SendForgotPasswordCodeCubit, SendForgotPasswordCodeStates>(
    'Should emitted SendForgotPasswordCodeLoadingState and SendForgotPasswordCodeErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(email)).thenAnswer(
        (_) async => Left<Failure, bool>(GeneralFailure("failure"))),
    act: (SendForgotPasswordCodeCubit cubit) =>
        cubit.sendForgotPasswordCode(email),
    expect: () => [
      SendForgotPasswordCodeLoadingState(),
      SendForgotPasswordCodeErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<SendForgotPasswordCodeCubit, SendForgotPasswordCodeStates>(
    'Should emitted SendForgotPasswordCodeLoadingState and SendForgotPasswordCodeErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(email)).thenAnswer(
        (_) async => Left<Failure, bool>(ServerFailure("server failure"))),
    act: (SendForgotPasswordCodeCubit cubit) =>
        cubit.sendForgotPasswordCode(email),
    expect: () => [
      SendForgotPasswordCodeLoadingState(),
      SendForgotPasswordCodeErrorState(
          failure: ServerFailure("server failure")),
    ],
  );

  blocTest<SendForgotPasswordCodeCubit, SendForgotPasswordCodeStates>(
    'Should emitted SendForgotPasswordCodeLoadingState and SendForgotPasswordCodeErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(email)).thenAnswer((_) async =>
        Left<Failure, bool>(BadRequestFailure("BadRequest failure"))),
    act: (SendForgotPasswordCodeCubit cubit) =>
        cubit.sendForgotPasswordCode(email),
    expect: () => [
      SendForgotPasswordCodeLoadingState(),
      SendForgotPasswordCodeErrorState(
          failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<SendForgotPasswordCodeCubit, SendForgotPasswordCodeStates>(
    'Should emitted SendForgotPasswordCodeLoadingState and SendForgotPasswordCodeErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(email)).thenAnswer(
        (_) async => Left<Failure, bool>(RequestFailure("Request failure"))),
    act: (SendForgotPasswordCodeCubit cubit) =>
        cubit.sendForgotPasswordCode(email),
    expect: () => [
      SendForgotPasswordCodeLoadingState(),
      SendForgotPasswordCodeErrorState(
          failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<SendForgotPasswordCodeCubit, SendForgotPasswordCodeStates>(
    'Should emitted SendForgotPasswordCodeLoadingState and SendForgotPasswordCodeErrorState when get a InvalidCredentialsFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(email)).thenAnswer((_) async =>
        Left<Failure, bool>(
            InvalidCredentialsFailure("Invalid Credentials failure"))),
    act: (SendForgotPasswordCodeCubit cubit) =>
        cubit.sendForgotPasswordCode(email),
    expect: () => [
      SendForgotPasswordCodeLoadingState(),
      SendForgotPasswordCodeErrorState(
          failure: InvalidCredentialsFailure("Invalid Credentials failure")),
    ],
  );
}
