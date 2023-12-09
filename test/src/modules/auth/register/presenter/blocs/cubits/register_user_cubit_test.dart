import 'package:comdig/src/modules/auth/register/domain/entities/register_response_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/entities/user_data_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/usecases/register_user_usecase.dart';
import 'package:comdig/src/modules/auth/register/presenter/blocs/cubits/register_user_cubit.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class RegisterUserCubitMock extends Mock implements RegisterUserCubit {}

class RegisterUserUsecaseMock extends Mock implements RegisterUserUsecase {}

void main() {
  DateTime date = DateTime.parse("2023-10-19 08:42:07.424917");
  late RegisterUserCubit cubit;
  late RegisterUserUsecase usecase;

  setUp(() {
    usecase = RegisterUserUsecaseMock();
    cubit = RegisterUserCubit(usecase: usecase);
  });

  RegisterResponseEntity registerResponseEntity = RegisterResponseEntity(
    id: "id",
    name: "name",
    lastname: "lastname",
    email: "email",
    cellphone: "cellphone",
    city: "city",
    uf: "uf",
    birthdate: date,
    createdAt: date,
    updatedAt: date,
    favorites: const [],
  );

  UserDataEntity userDataEntity = const UserDataEntity(
    name: "Name",
    lastname: "Lastname",
    cellphone: "(00)00000-0000",
    birthDate: "00/00/0000",
    city: "City",
    uf: "UF",
    email: "teste@email.com",
    password: "password",
  );

  blocTest<RegisterUserCubit, RegisterUserStates>(
    'When attempt to Register an User is made then RegisterUserLoadingState and RegisterUserSuccessState are emitted',
    build: () => cubit,
    setUp: () => when(() => usecase(userDataEntity)).thenAnswer((_) async =>
        Right<Failure, RegisterResponseEntity>(registerResponseEntity)),
    act: (RegisterUserCubit cubit) => cubit.registerUser(userDataEntity),
    expect: () => [
      RegisterUserLoadingState(),
      RegisterUserSuccessState(data: registerResponseEntity),
    ],
  );

  blocTest<RegisterUserCubit, RegisterUserStates>(
    'Should emitted RegisterUserLoadingState and RegisterUserErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userDataEntity)).thenAnswer((_) async =>
        Left<Failure, RegisterResponseEntity>(GeneralFailure("failure"))),
    act: (RegisterUserCubit cubit) => cubit.registerUser(userDataEntity),
    expect: () => [
      RegisterUserLoadingState(),
      RegisterUserErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<RegisterUserCubit, RegisterUserStates>(
    'Should emitted RegisterUserLoadingState and RegisterUserErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userDataEntity)).thenAnswer((_) async =>
        Left<Failure, RegisterResponseEntity>(ServerFailure("server failure"))),
    act: (RegisterUserCubit cubit) => cubit.registerUser(userDataEntity),
    expect: () => [
      RegisterUserLoadingState(),
      RegisterUserErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<RegisterUserCubit, RegisterUserStates>(
    'Should emitted RegisterUserLoadingState and RegisterUserErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userDataEntity)).thenAnswer((_) async =>
        Left<Failure, RegisterResponseEntity>(
            BadRequestFailure("BadRequest failure"))),
    act: (RegisterUserCubit cubit) => cubit.registerUser(userDataEntity),
    expect: () => [
      RegisterUserLoadingState(),
      RegisterUserErrorState(failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<RegisterUserCubit, RegisterUserStates>(
    'Should emitted RegisterUserLoadingState and RegisterUserErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userDataEntity)).thenAnswer((_) async =>
        Left<Failure, RegisterResponseEntity>(
            RequestFailure("Request failure"))),
    act: (RegisterUserCubit cubit) => cubit.registerUser(userDataEntity),
    expect: () => [
      RegisterUserLoadingState(),
      RegisterUserErrorState(failure: RequestFailure("Request failure")),
    ],
  );
}
