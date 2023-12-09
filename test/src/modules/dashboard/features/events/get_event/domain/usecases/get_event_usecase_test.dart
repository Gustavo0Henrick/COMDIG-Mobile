import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/entities/event_data_entity.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/repositories/i_get_event_repository.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/usecases/get_event_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetEventRepositoryMock extends Mock implements IGetEventRepository {}

main() {
  late GetEventRepositoryMock repository;
  late GetEventUsecase usecase;

  setUp(() {
    repository = GetEventRepositoryMock();
    usecase = GetEventUsecase(repository: repository);
  });

  String url = "www.google.com";

  EventDataEntity event = const EventDataEntity(
    title: "title",
    local: "local",
    endDate: "endDate",
    facebookLink: "facebookLink",
    address: "address",
    initDate: "initDate",
    instagramLink: "instragramLink",
    organizador: "organizador",
    twitterLink: "twitterLink",
    webLink: "webLink",
  );

  test("Should return a EventDataEntity from the GetEvent Method", () async {
    when(() => repository.getEvent(url))
        .thenAnswer((_) async => Right<Failure, EventDataEntity>(event));
    final result = await usecase(url);

    expect(result, Right(event));

    verify(() => repository.getEvent(url)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.getEvent(url)).thenAnswer((_) async =>
        Left<Failure, EventDataEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(url);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getEvent(url)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.getEvent(url)).thenAnswer((_) async =>
        Left<Failure, EventDataEntity>(GeneralFailure(messageError)));
    final result = await usecase(url);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.getEvent(url)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.getEvent(url)).thenAnswer((_) async =>
        Left<Failure, EventDataEntity>(BadRequestFailure(messageError)));
    final result = await usecase(url);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.getEvent(url)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.getEvent(url)).thenAnswer((_) async =>
        Left<Failure, EventDataEntity>(RequestFailure(messageError)));
    final result = await usecase(url);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.getEvent(url)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.getEvent(url)).thenAnswer((_) async =>
        Left<Failure, EventDataEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(url);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getEvent(url)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
