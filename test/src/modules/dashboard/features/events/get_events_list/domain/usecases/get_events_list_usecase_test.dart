import 'package:comdig/src/modules/dashboard/features/events/get_events_list/domain/repositories/i_get_events_list_repository.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/domain/usecases/get_events_list_usecase.dart';
import 'package:comdig/src/shared/entities/event_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetEventsListRepositoryMock extends Mock
    implements IGetEventsListRepository {}

main() {
  late GetEventsListRepositoryMock repository;
  late GetEventsListUsecase usecase;

  setUp(() {
    repository = GetEventsListRepositoryMock();
    usecase = GetEventsListUsecase(repository: repository);
  });

  String userId = "userId";

  List<EventEntity> listFavorites = const [
    EventEntity(
      title: "title",
      local: "local",
      date: "date",
      href: "href",
    ),
  ];

  test("Should return a List<EventEntity> from the GetEventsList Method",
      () async {
    when(() => repository.getEventsList(userId)).thenAnswer(
        (_) async => Right<Failure, List<EventEntity>>(listFavorites));
    final result = await usecase(userId);

    expect(result, Right(listFavorites));

    verify(() => repository.getEventsList(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.getEventsList(userId)).thenAnswer((_) async =>
        Left<Failure, List<EventEntity>>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getEventsList(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.getEventsList(userId)).thenAnswer((_) async =>
        Left<Failure, List<EventEntity>>(GeneralFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.getEventsList(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.getEventsList(userId)).thenAnswer((_) async =>
        Left<Failure, List<EventEntity>>(BadRequestFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.getEventsList(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.getEventsList(userId)).thenAnswer((_) async =>
        Left<Failure, List<EventEntity>>(RequestFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.getEventsList(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.getEventsList(userId)).thenAnswer((_) async =>
        Left<Failure, List<EventEntity>>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getEventsList(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
