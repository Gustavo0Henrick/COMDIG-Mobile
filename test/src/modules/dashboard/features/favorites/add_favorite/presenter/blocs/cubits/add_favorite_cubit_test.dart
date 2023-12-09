import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/domain/usecases/add_favorite_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/presenter/blocs/cubits/add_favorite_cubit.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class AddFavoriteCubitMock extends Mock implements AddFavoriteCubit {}

class AddFavoriteUsecaseMock extends Mock implements AddFavoriteUsecase {}

class SecureStorageManagerMock extends Mock implements ISecureStorageManager {}

void main() {
  late AddFavoriteCubit cubit;
  late AddFavoriteUsecase usecase;
  late ISecureStorageManager storage;

  setUp(() {
    usecase = AddFavoriteUsecaseMock();
    storage = SecureStorageManagerMock();
    cubit = AddFavoriteCubit(usecase: usecase);
  });

  String companyId = "companyId";

  dynamic success = true;

  blocTest<AddFavoriteCubit, AddFavoriteStates>(
    'When attempt to AddFavorite is made then AddFavoriteLoadingState and AddFavoriteSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => storage.saveData(any(), any())).thenAnswer((_) async => true);
      when(() => usecase(companyId))
          .thenAnswer((_) async => const Right<Failure, dynamic>(true));
    },
    act: (AddFavoriteCubit cubit) => cubit.addFavorite(companyId),
    expect: () => [
      AddFavoriteLoadingState(),
      AddFavoriteSuccessState(result: success),
    ],
  );

  blocTest<AddFavoriteCubit, AddFavoriteStates>(
    'Should emitted AddFavoriteLoadingState and AddFavoriteErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer(
        (_) async => Left<Failure, dynamic>(GeneralFailure("failure"))),
    act: (AddFavoriteCubit cubit) => cubit.addFavorite(companyId),
    expect: () => [
      AddFavoriteLoadingState(),
      AddFavoriteErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<AddFavoriteCubit, AddFavoriteStates>(
    'Should emitted AddFavoriteLoadingState and AddFavoriteErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer(
        (_) async => Left<Failure, dynamic>(ServerFailure("server failure"))),
    act: (AddFavoriteCubit cubit) => cubit.addFavorite(companyId),
    expect: () => [
      AddFavoriteLoadingState(),
      AddFavoriteErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<AddFavoriteCubit, AddFavoriteStates>(
    'Should emitted AddFavoriteLoadingState and AddFavoriteErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer((_) async =>
        Left<Failure, dynamic>(BadRequestFailure("BadRequest failure"))),
    act: (AddFavoriteCubit cubit) => cubit.addFavorite(companyId),
    expect: () => [
      AddFavoriteLoadingState(),
      AddFavoriteErrorState(failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<AddFavoriteCubit, AddFavoriteStates>(
    'Should emitted AddFavoriteLoadingState and AddFavoriteErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer(
        (_) async => Left<Failure, dynamic>(RequestFailure("Request failure"))),
    act: (AddFavoriteCubit cubit) => cubit.addFavorite(companyId),
    expect: () => [
      AddFavoriteLoadingState(),
      AddFavoriteErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<AddFavoriteCubit, AddFavoriteStates>(
    'Should emitted AddFavoriteLoadingState and AddFavoriteErrorState when get a UnauthorizedFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer((_) async =>
        Left<Failure, dynamic>(
            UnauthorizedFailure("Invalid Credentials failure"))),
    act: (AddFavoriteCubit cubit) => cubit.addFavorite(companyId),
    expect: () => [
      AddFavoriteLoadingState(),
      AddFavoriteErrorState(
          failure: UnauthorizedFailure("Invalid Credentials failure")),
    ],
  );
}
