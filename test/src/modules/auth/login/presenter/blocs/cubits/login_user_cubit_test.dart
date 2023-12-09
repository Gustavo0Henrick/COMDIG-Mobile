import 'package:comdig/src/modules/auth/login/domain/entities/login_response_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/entities/login_user_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/entities/token_response_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/usecases/login_user_usecase.dart';
import 'package:comdig/src/modules/auth/login/presenter/blocs/cubits/login_user_cubit.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class LoginUserCubitMock extends Mock implements LoginUserCubit {}

class LoginUserUsecaseMock extends Mock implements LoginUserUsecase {}

class SecureStorageManagerMock extends Mock implements ISecureStorageManager {}

void main() {
  DateTime date = DateTime.parse("2023-10-19 08:42:07.424917");
  late LoginUserCubit cubit;
  late LoginUserUsecase usecase;
  late ISecureStorageManager storage;

  setUp(() {
    usecase = LoginUserUsecaseMock();
    storage = SecureStorageManagerMock();
    cubit = LoginUserCubit(usecase: usecase, storage: storage);
  });

  LoginUserEntity loginUserEntity = const LoginUserEntity(
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
    birthdate: date,
    email: "teste@email.com",
    createdAt: date,
    updatedAt: date,
  );

  blocTest<LoginUserCubit, LoginUserStates>(
    'When attempt to Login an User is made then LoginUserLoadingState and LoginUserSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => storage.saveData(any(), any())).thenAnswer((_) async => true);
      when(() => usecase(loginUserEntity)).thenAnswer((_) async =>
          Right<Failure, LoginResponseEntity>(loginResponseEntity));
    },
    act: (LoginUserCubit cubit) => cubit.loginUser(loginUserEntity),
    expect: () => [
      LoginUserLoadingState(),
      LoginUserSuccessState(
        data: LoginResponseEntity(
          favorites: const [],
          token: const TokenResponseEntity(
              accessToken: "accessToken", refreshToken: "refreshToken"),
          id: "id",
          name: "Name",
          lastname: "Lastname",
          cellphone: "(00)00000-0000",
          city: "City",
          uf: "UF",
          birthdate: date,
          email: "teste@email.com",
          createdAt: date,
          updatedAt: date,
        ),
      ),
    ],
  );

  blocTest<LoginUserCubit, LoginUserStates>(
    'Should emitted LoginUserLoadingState and LoginUserErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(loginUserEntity)).thenAnswer((_) async =>
        Left<Failure, LoginResponseEntity>(GeneralFailure("failure"))),
    act: (LoginUserCubit cubit) => cubit.loginUser(loginUserEntity),
    expect: () => [
      LoginUserLoadingState(),
      LoginUserErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<LoginUserCubit, LoginUserStates>(
    'Should emitted LoginUserLoadingState and LoginUserErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(loginUserEntity)).thenAnswer((_) async =>
        Left<Failure, LoginResponseEntity>(ServerFailure("server failure"))),
    act: (LoginUserCubit cubit) => cubit.loginUser(loginUserEntity),
    expect: () => [
      LoginUserLoadingState(),
      LoginUserErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<LoginUserCubit, LoginUserStates>(
    'Should emitted LoginUserLoadingState and LoginUserErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(loginUserEntity)).thenAnswer((_) async =>
        Left<Failure, LoginResponseEntity>(
            BadRequestFailure("BadRequest failure"))),
    act: (LoginUserCubit cubit) => cubit.loginUser(loginUserEntity),
    expect: () => [
      LoginUserLoadingState(),
      LoginUserErrorState(failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<LoginUserCubit, LoginUserStates>(
    'Should emitted LoginUserLoadingState and LoginUserErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(loginUserEntity)).thenAnswer((_) async =>
        Left<Failure, LoginResponseEntity>(RequestFailure("Request failure"))),
    act: (LoginUserCubit cubit) => cubit.loginUser(loginUserEntity),
    expect: () => [
      LoginUserLoadingState(),
      LoginUserErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<LoginUserCubit, LoginUserStates>(
    'Should emitted LoginUserLoadingState and LoginUserErrorState when get a InvalidCredentialsFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(loginUserEntity)).thenAnswer((_) async =>
        Left<Failure, LoginResponseEntity>(
            InvalidCredentialsFailure("Invalid Credentials failure"))),
    act: (LoginUserCubit cubit) => cubit.loginUser(loginUserEntity),
    expect: () => [
      LoginUserLoadingState(),
      LoginUserErrorState(
          failure: InvalidCredentialsFailure("Invalid Credentials failure")),
    ],
  );
}
