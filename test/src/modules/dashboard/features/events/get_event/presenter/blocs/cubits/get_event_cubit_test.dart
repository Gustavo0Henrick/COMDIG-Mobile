import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/entities/event_data_entity.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/usecases/get_event_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/presenter/blocs/cubits/get_event_cubit.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class GetEventCubitMock extends Mock implements GetEventCubit {}

class GetEventUsecaseMock extends Mock implements GetEventUsecase {}

class SecureStorageManagerMock extends Mock implements ISecureStorageManager {}

void main() {
  late GetEventCubit cubit;
  late GetEventUsecase usecase;
  late ISecureStorageManager storage;

  setUp(() {
    usecase = GetEventUsecaseMock();
    storage = SecureStorageManagerMock();
    cubit = GetEventCubit(usecase: usecase);
  });

  String url = "www.google.com";

  EventDataEntity event = const EventDataEntity(
    title: "title",
    local: "local",
    address: "address",
    initDate: "initDate",
    endDate: "endDate",
    organizador: "organizador",
    instagramLink: "instagramLink",
    facebookLink: "facebookLink",
    twitterLink: "twitterLink",
    webLink: "webLink",
  );
  blocTest<GetEventCubit, GetEventStates>(
    'When attempt to GetEvent of an User is made then GetEventLoadingState and GetEventSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => storage.saveData(any(), any())).thenAnswer((_) async => true);
      when(() => usecase(url))
          .thenAnswer((_) async => Right<Failure, EventDataEntity>(event));
    },
    act: (GetEventCubit cubit) => cubit.getEvent(url),
    expect: () => [
      GetEventLoadingState(),
      GetEventSuccessState(
        result: const EventDataEntity(
          title: "title",
          local: "local",
          address: "address",
          initDate: "initDate",
          endDate: "endDate",
          organizador: "organizador",
          instagramLink: "instagramLink",
          facebookLink: "facebookLink",
          twitterLink: "twitterLink",
          webLink: "webLink",
        ),
      ),
    ],
  );

  blocTest<GetEventCubit, GetEventStates>(
    'Should emitted GetEventLoadingState and GetEventErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(url)).thenAnswer(
        (_) async => Left<Failure, EventDataEntity>(GeneralFailure("failure"))),
    act: (GetEventCubit cubit) => cubit.getEvent(url),
    expect: () => [
      GetEventLoadingState(),
      GetEventErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<GetEventCubit, GetEventStates>(
    'Should emitted GetEventLoadingState and GetEventErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(url)).thenAnswer((_) async =>
        Left<Failure, EventDataEntity>(ServerFailure("server failure"))),
    act: (GetEventCubit cubit) => cubit.getEvent(url),
    expect: () => [
      GetEventLoadingState(),
      GetEventErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<GetEventCubit, GetEventStates>(
    'Should emitted GetEventLoadingState and GetEventErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(url)).thenAnswer((_) async =>
        Left<Failure, EventDataEntity>(
            BadRequestFailure("BadRequest failure"))),
    act: (GetEventCubit cubit) => cubit.getEvent(url),
    expect: () => [
      GetEventLoadingState(),
      GetEventErrorState(failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<GetEventCubit, GetEventStates>(
    'Should emitted GetEventLoadingState and GetEventErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(url)).thenAnswer((_) async =>
        Left<Failure, EventDataEntity>(RequestFailure("Request failure"))),
    act: (GetEventCubit cubit) => cubit.getEvent(url),
    expect: () => [
      GetEventLoadingState(),
      GetEventErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<GetEventCubit, GetEventStates>(
    'Should emitted GetEventLoadingState and GetEventErrorState when get a UnauthorizedFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(url)).thenAnswer((_) async =>
        Left<Failure, EventDataEntity>(
            UnauthorizedFailure("Invalid Credentials failure"))),
    act: (GetEventCubit cubit) => cubit.getEvent(url),
    expect: () => [
      GetEventLoadingState(),
      GetEventErrorState(
          failure: UnauthorizedFailure("Invalid Credentials failure")),
    ],
  );
}
