import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/presenter/blocs/cubits/remove_favorite_cubit.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class RemoveFavoriteCubitMock extends Mock implements RemoveFavoriteCubit {}

class RemoveFavoriteUsecaseMock extends Mock implements RemoveFavoriteUsecase {}

class SecureStorageManagerMock extends Mock implements ISecureStorageManager {}

void main() {
  late RemoveFavoriteCubit cubit;
  late RemoveFavoriteUsecase usecase;
  late ISecureStorageManager storage;

  setUp(() {
    usecase = RemoveFavoriteUsecaseMock();
    storage = SecureStorageManagerMock();
    cubit = RemoveFavoriteCubit(usecase: usecase);
  });

  String companyId = "companyId";

  dynamic success = true;

  blocTest<RemoveFavoriteCubit, RemoveFavoriteStates>(
    'When attempt to RemoveFavorite is made then RemoveFavoriteLoadingState and RemoveFavoriteSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => storage.saveData(any(), any())).thenAnswer((_) async => true);
      when(() => usecase(companyId))
          .thenAnswer((_) async => const Right<Failure, dynamic>(true));
    },
    act: (RemoveFavoriteCubit cubit) => cubit.removeFavorite(companyId),
    expect: () => [
      RemoveFavoriteLoadingState(),
      RemoveFavoriteSuccessState(result: success),
    ],
  );

  blocTest<RemoveFavoriteCubit, RemoveFavoriteStates>(
    'Should emitted RemoveFavoriteLoadingState and RemoveFavoriteErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer(
        (_) async => Left<Failure, dynamic>(GeneralFailure("failure"))),
    act: (RemoveFavoriteCubit cubit) => cubit.removeFavorite(companyId),
    expect: () => [
      RemoveFavoriteLoadingState(),
      RemoveFavoriteErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<RemoveFavoriteCubit, RemoveFavoriteStates>(
    'Should emitted RemoveFavoriteLoadingState and RemoveFavoriteErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer(
        (_) async => Left<Failure, dynamic>(ServerFailure("server failure"))),
    act: (RemoveFavoriteCubit cubit) => cubit.removeFavorite(companyId),
    expect: () => [
      RemoveFavoriteLoadingState(),
      RemoveFavoriteErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<RemoveFavoriteCubit, RemoveFavoriteStates>(
    'Should emitted RemoveFavoriteLoadingState and RemoveFavoriteErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer((_) async =>
        Left<Failure, dynamic>(BadRequestFailure("BadRequest failure"))),
    act: (RemoveFavoriteCubit cubit) => cubit.removeFavorite(companyId),
    expect: () => [
      RemoveFavoriteLoadingState(),
      RemoveFavoriteErrorState(
          failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<RemoveFavoriteCubit, RemoveFavoriteStates>(
    'Should emitted RemoveFavoriteLoadingState and RemoveFavoriteErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer(
        (_) async => Left<Failure, dynamic>(RequestFailure("Request failure"))),
    act: (RemoveFavoriteCubit cubit) => cubit.removeFavorite(companyId),
    expect: () => [
      RemoveFavoriteLoadingState(),
      RemoveFavoriteErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<RemoveFavoriteCubit, RemoveFavoriteStates>(
    'Should emitted RemoveFavoriteLoadingState and RemoveFavoriteErrorState when get a UnauthorizedFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer((_) async =>
        Left<Failure, dynamic>(
            UnauthorizedFailure("Invalid Credentials failure"))),
    act: (RemoveFavoriteCubit cubit) => cubit.removeFavorite(companyId),
    expect: () => [
      RemoveFavoriteLoadingState(),
      RemoveFavoriteErrorState(
          failure: UnauthorizedFailure("Invalid Credentials failure")),
    ],
  );
}
