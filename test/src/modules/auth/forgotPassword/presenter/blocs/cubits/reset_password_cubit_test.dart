import 'package:comdig/src/modules/auth/forgotPassword/domain/usecases/reset_password_usecase.dart';
import 'package:comdig/src/modules/auth/forgotPassword/presenter/blocs/cubits/reset_password_cubit.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class ResetPasswordCubitMock extends Mock implements ResetPasswordCubit {}

class ResetPasswordUsecaseMock extends Mock implements ResetPasswordUsecase {}

void main() {
  late ResetPasswordCubit cubit;
  late ResetPasswordUsecase usecase;

  setUp(() {
    usecase = ResetPasswordUsecaseMock();
    cubit = ResetPasswordCubit(usecase: usecase);
  });

  ({String email, String code, String password}) resetData =
      (email: "email@test.com", code: "12345", password: "password");

  blocTest<ResetPasswordCubit, ResetPasswordStates>(
    'When attempt to Reset Password for an User is made then ResetPasswordLoadingState and ResetPasswordSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => usecase(resetData))
          .thenAnswer((_) async => const Right<Failure, bool>(true));
    },
    act: (ResetPasswordCubit cubit) => cubit.resetPassword(resetData),
    expect: () => [
      ResetPasswordLoadingState(),
      ResetPasswordSuccessState(result: true),
    ],
  );

  blocTest<ResetPasswordCubit, ResetPasswordStates>(
    'Should emitted ResetPasswordLoadingState and ResetPasswordErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(resetData)).thenAnswer(
        (_) async => Left<Failure, bool>(GeneralFailure("failure"))),
    act: (ResetPasswordCubit cubit) => cubit.resetPassword(resetData),
    expect: () => [
      ResetPasswordLoadingState(),
      ResetPasswordErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<ResetPasswordCubit, ResetPasswordStates>(
    'Should emitted ResetPasswordLoadingState and ResetPasswordErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(resetData)).thenAnswer(
        (_) async => Left<Failure, bool>(ServerFailure("server failure"))),
    act: (ResetPasswordCubit cubit) => cubit.resetPassword(resetData),
    expect: () => [
      ResetPasswordLoadingState(),
      ResetPasswordErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<ResetPasswordCubit, ResetPasswordStates>(
    'Should emitted ResetPasswordLoadingState and ResetPasswordErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(resetData)).thenAnswer((_) async =>
        Left<Failure, bool>(BadRequestFailure("BadRequest failure"))),
    act: (ResetPasswordCubit cubit) => cubit.resetPassword(resetData),
    expect: () => [
      ResetPasswordLoadingState(),
      ResetPasswordErrorState(failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<ResetPasswordCubit, ResetPasswordStates>(
    'Should emitted ResetPasswordLoadingState and ResetPasswordErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(resetData)).thenAnswer(
        (_) async => Left<Failure, bool>(RequestFailure("Request failure"))),
    act: (ResetPasswordCubit cubit) => cubit.resetPassword(resetData),
    expect: () => [
      ResetPasswordLoadingState(),
      ResetPasswordErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<ResetPasswordCubit, ResetPasswordStates>(
    'Should emitted ResetPasswordLoadingState and ResetPasswordErrorState when get a InvalidCredentialsFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(resetData)).thenAnswer((_) async =>
        Left<Failure, bool>(
            InvalidCredentialsFailure("Invalid Credentials failure"))),
    act: (ResetPasswordCubit cubit) => cubit.resetPassword(resetData),
    expect: () => [
      ResetPasswordLoadingState(),
      ResetPasswordErrorState(
          failure: InvalidCredentialsFailure("Invalid Credentials failure")),
    ],
  );
}
