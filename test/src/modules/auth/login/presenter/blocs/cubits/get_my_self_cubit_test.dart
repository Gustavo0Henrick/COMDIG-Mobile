import 'package:comdig/src/modules/auth/login/domain/usecases/get_my_self_usecase.dart';
import 'package:comdig/src/modules/auth/login/presenter/blocs/cubits/get_my_self_cubit.dart';
import 'package:comdig/src/shared/entities/user_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class GetMySelfCubitMock extends Mock implements GetMySelfCubit {}

class GetMySelfUsecaseMock extends Mock implements GetMySelfUsecase {}

class SecureStorageManagerMock extends Mock implements ISecureStorageManager {}

void main() {
  late GetMySelfCubit cubit;
  late GetMySelfUsecase usecase;
  late ISecureStorageManager storage;

  setUp(() {
    usecase = GetMySelfUsecaseMock();
    storage = SecureStorageManagerMock();
    cubit = GetMySelfCubit(usecase: usecase, storage: storage);
  });

  const UserEntity userEntity = UserEntity(
    id: "id",
    name: "Name",
    lastname: "Lastname",
    cellphone: "(00)00000-0000",
    birthDate: "00/00/0000",
    city: "City",
    uf: "UF",
    email: "teste@email.com",
    createdAt: "createdAt",
    updatedAt: "updatedAt",
  );

  blocTest<GetMySelfCubit, GetMySelfStates>(
    'When attempt to GetMySelf an User is made then GetMySelfLoadingState and LoginUserSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => storage.saveData(any(), any())).thenAnswer((_) async => true);
      when(() => usecase("id")).thenAnswer(
          (_) async => const Right<Failure, UserEntity>(userEntity));
    },
    act: (GetMySelfCubit cubit) => cubit.getMySelf("id"),
    expect: () => [
      GetMySelfLoadingState(),
      GetMySelfSuccessState(
        userEntity: const UserEntity(
          id: "id",
          name: "Name",
          lastname: "Lastname",
          cellphone: "(00)00000-0000",
          birthDate: "00/00/0000",
          email: "teste@email.com",
          city: "City",
          uf: "UF",
          createdAt: "createdAt",
          updatedAt: "updatedAt",
        ),
      ),
    ],
  );

  blocTest<GetMySelfCubit, GetMySelfStates>(
    'Should emitted GetMySelfLoadingState and GetMySelfErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase("id")).thenAnswer(
        (_) async => Left<Failure, UserEntity>(GeneralFailure("failure"))),
    act: (GetMySelfCubit cubit) => cubit.getMySelf("id"),
    expect: () => [
      GetMySelfLoadingState(),
      GetMySelfErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<GetMySelfCubit, GetMySelfStates>(
    'Should emitted GetMySelfLoadingState and GetMySelfErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase("id")).thenAnswer((_) async =>
        Left<Failure, UserEntity>(ServerFailure("server failure"))),
    act: (GetMySelfCubit cubit) => cubit.getMySelf("id"),
    expect: () => [
      GetMySelfLoadingState(),
      GetMySelfErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<GetMySelfCubit, GetMySelfStates>(
    'Should emitted GetMySelfLoadingState and GetMySelfErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase("id")).thenAnswer((_) async =>
        Left<Failure, UserEntity>(BadRequestFailure("BadRequest failure"))),
    act: (GetMySelfCubit cubit) => cubit.getMySelf("id"),
    expect: () => [
      GetMySelfLoadingState(),
      GetMySelfErrorState(failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<GetMySelfCubit, GetMySelfStates>(
    'Should emitted GetMySelfLoadingState and GetMySelfErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase("id")).thenAnswer((_) async =>
        Left<Failure, UserEntity>(RequestFailure("Request failure"))),
    act: (GetMySelfCubit cubit) => cubit.getMySelf("id"),
    expect: () => [
      GetMySelfLoadingState(),
      GetMySelfErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<GetMySelfCubit, GetMySelfStates>(
    'Should emitted GetMySelfLoadingState and GetMySelfErrorState when get a UnauthorizedFailure',
    build: () => cubit,
    setUp: () => when(() => usecase("id")).thenAnswer((_) async =>
        Left<Failure, UserEntity>(
            UnauthorizedFailure("Invalid Credentials failure"))),
    act: (GetMySelfCubit cubit) => cubit.getMySelf("id"),
    expect: () => [
      GetMySelfLoadingState(),
      GetMySelfErrorState(
          failure: UnauthorizedFailure("Invalid Credentials failure")),
    ],
  );
}
