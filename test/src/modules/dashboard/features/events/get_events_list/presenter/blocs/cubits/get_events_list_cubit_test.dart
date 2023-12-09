import 'package:comdig/src/modules/dashboard/features/events/get_events_list/domain/usecases/get_events_list_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/presenter/blocs/cubits/get_events_list_cubit.dart';
import 'package:comdig/src/shared/entities/event_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class GetEventsListCubitMock extends Mock implements GetEventsListCubit {}

class GetEventsListUsecaseMock extends Mock implements GetEventsListUsecase {}

class SecureStorageManagerMock extends Mock implements ISecureStorageManager {}

void main() {
  late GetEventsListCubit cubit;
  late GetEventsListUsecase usecase;
  late ISecureStorageManager storage;

  setUp(() {
    usecase = GetEventsListUsecaseMock();
    storage = SecureStorageManagerMock();
    cubit = GetEventsListCubit(usecase: usecase);
  });

  String query = "Presidente Prudente";

  List<EventEntity> listEventEntity = const [
    EventEntity(
      date: "date",
      href: "href",
      local: "local",
      title: "title",
    ),
  ];
  blocTest<GetEventsListCubit, GetEventsListStates>(
    'When attempt to GetEventsList of an User is made then GetEventsListLoadingState and GetEventsListSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => storage.saveData(any(), any())).thenAnswer((_) async => true);
      when(() => usecase(query)).thenAnswer(
          (_) async => Right<Failure, List<EventEntity>>(listEventEntity));
    },
    act: (GetEventsListCubit cubit) => cubit.getEventsList(query),
    expect: () => [
      GetEventsListLoadingState(),
      GetEventsListSuccessState(
        result: const [
          EventEntity(
            date: "date",
            href: "href",
            local: "local",
            title: "title",
          ),
        ],
      ),
    ],
  );

  blocTest<GetEventsListCubit, GetEventsListStates>(
    'Should emitted GetEventsListLoadingState and GetEventsListErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(query)).thenAnswer((_) async =>
        Left<Failure, List<EventEntity>>(GeneralFailure("failure"))),
    act: (GetEventsListCubit cubit) => cubit.getEventsList(query),
    expect: () => [
      GetEventsListLoadingState(),
      GetEventsListErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<GetEventsListCubit, GetEventsListStates>(
    'Should emitted GetEventsListLoadingState and GetEventsListErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(query)).thenAnswer((_) async =>
        Left<Failure, List<EventEntity>>(ServerFailure("server failure"))),
    act: (GetEventsListCubit cubit) => cubit.getEventsList(query),
    expect: () => [
      GetEventsListLoadingState(),
      GetEventsListErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<GetEventsListCubit, GetEventsListStates>(
    'Should emitted GetEventsListLoadingState and GetEventsListErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(query)).thenAnswer((_) async =>
        Left<Failure, List<EventEntity>>(
            BadRequestFailure("BadRequest failure"))),
    act: (GetEventsListCubit cubit) => cubit.getEventsList(query),
    expect: () => [
      GetEventsListLoadingState(),
      GetEventsListErrorState(failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<GetEventsListCubit, GetEventsListStates>(
    'Should emitted GetEventsListLoadingState and GetEventsListErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(query)).thenAnswer((_) async =>
        Left<Failure, List<EventEntity>>(RequestFailure("Request failure"))),
    act: (GetEventsListCubit cubit) => cubit.getEventsList(query),
    expect: () => [
      GetEventsListLoadingState(),
      GetEventsListErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<GetEventsListCubit, GetEventsListStates>(
    'Should emitted GetEventsListLoadingState and GetEventsListErrorState when get a UnauthorizedFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(query)).thenAnswer((_) async =>
        Left<Failure, List<EventEntity>>(
            UnauthorizedFailure("Invalid Credentials failure"))),
    act: (GetEventsListCubit cubit) => cubit.getEventsList(query),
    expect: () => [
      GetEventsListLoadingState(),
      GetEventsListErrorState(
          failure: UnauthorizedFailure("Invalid Credentials failure")),
    ],
  );
}
