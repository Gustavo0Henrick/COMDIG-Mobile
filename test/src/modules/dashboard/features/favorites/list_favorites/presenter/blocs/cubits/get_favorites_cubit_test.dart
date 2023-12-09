import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/entities/favorite_entity.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/presenter/blocs/cubits/get_favorites_cubit.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class GetFavoritesCubitMock extends Mock implements GetFavoritesCubit {}

class GetFavoritesUsecaseMock extends Mock implements GetFavoritesUsecase {}

class SecureStorageManagerMock extends Mock implements ISecureStorageManager {}

void main() {
  late GetFavoritesCubit cubit;
  late GetFavoritesUsecase usecase;
  late ISecureStorageManager storage;

  setUp(() {
    usecase = GetFavoritesUsecaseMock();
    storage = SecureStorageManagerMock();
    cubit = GetFavoritesCubit(usecase: usecase);
  });

  String userId = "userId";

  List<FavoriteEntity> listFavoriteEntity = const [
    FavoriteEntity(
      id: "id",
      name: "name",
      category: "category",
      type: "type",
      city: "city",
      image: "image",
      uf: "sp",
    ),
  ];
  blocTest<GetFavoritesCubit, GetFavoritesStates>(
    'When attempt to GetFavorites of an User is made then GetFavoritesLoadingState and GetFavoritesSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => storage.saveData(any(), any())).thenAnswer((_) async => true);
      when(() => usecase(userId)).thenAnswer((_) async =>
          Right<Failure, List<FavoriteEntity>>(listFavoriteEntity));
    },
    act: (GetFavoritesCubit cubit) => cubit.getFavorites(userId),
    expect: () => [
      GetFavoritesLoadingState(),
      GetFavoritesSuccessState(
        result: const [
          FavoriteEntity(
            id: "id",
            name: "name",
            category: "category",
            type: "type",
            city: "city",
            image: "image",
            uf: "sp",
          ),
        ],
      ),
    ],
  );

  blocTest<GetFavoritesCubit, GetFavoritesStates>(
    'Should emitted GetFavoritesLoadingState and GetFavoritesErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userId)).thenAnswer((_) async =>
        Left<Failure, List<FavoriteEntity>>(GeneralFailure("failure"))),
    act: (GetFavoritesCubit cubit) => cubit.getFavorites(userId),
    expect: () => [
      GetFavoritesLoadingState(),
      GetFavoritesErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<GetFavoritesCubit, GetFavoritesStates>(
    'Should emitted GetFavoritesLoadingState and GetFavoritesErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userId)).thenAnswer((_) async =>
        Left<Failure, List<FavoriteEntity>>(ServerFailure("server failure"))),
    act: (GetFavoritesCubit cubit) => cubit.getFavorites(userId),
    expect: () => [
      GetFavoritesLoadingState(),
      GetFavoritesErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<GetFavoritesCubit, GetFavoritesStates>(
    'Should emitted GetFavoritesLoadingState and GetFavoritesErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userId)).thenAnswer((_) async =>
        Left<Failure, List<FavoriteEntity>>(
            BadRequestFailure("BadRequest failure"))),
    act: (GetFavoritesCubit cubit) => cubit.getFavorites(userId),
    expect: () => [
      GetFavoritesLoadingState(),
      GetFavoritesErrorState(failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<GetFavoritesCubit, GetFavoritesStates>(
    'Should emitted GetFavoritesLoadingState and GetFavoritesErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userId)).thenAnswer((_) async =>
        Left<Failure, List<FavoriteEntity>>(RequestFailure("Request failure"))),
    act: (GetFavoritesCubit cubit) => cubit.getFavorites(userId),
    expect: () => [
      GetFavoritesLoadingState(),
      GetFavoritesErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<GetFavoritesCubit, GetFavoritesStates>(
    'Should emitted GetFavoritesLoadingState and GetFavoritesErrorState when get a UnauthorizedFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userId)).thenAnswer((_) async =>
        Left<Failure, List<FavoriteEntity>>(
            UnauthorizedFailure("Invalid Credentials failure"))),
    act: (GetFavoritesCubit cubit) => cubit.getFavorites(userId),
    expect: () => [
      GetFavoritesLoadingState(),
      GetFavoritesErrorState(
          failure: UnauthorizedFailure("Invalid Credentials failure")),
    ],
  );
}
