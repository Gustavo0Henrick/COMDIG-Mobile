import 'package:comdig/src/modules/dashboard/features/events/get_events_list/infra/datasources/i_get_events_list_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/infra/repositories/get_events_list_repository.dart';
import 'package:comdig/src/shared/entities/event_entity.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetEventsListDatasourceMock extends Mock
    implements IGetEventsListDatasource {}

main() {
  late IGetEventsListDatasource datasource;
  late GetEventsListRepository repository;

  setUp(() {
    datasource = GetEventsListDatasourceMock();
    repository = GetEventsListRepository(datasource: datasource);
  });

  String query = "Presidente Prudente";

  List<EventEntity> listEvents = const [
    EventEntity(
      title: "title",
      local: "local",
      date: "date",
      href: "href",
    ),
  ];

  test("Should return a Success Message from GetEventsList Method", () async {
    when(() => datasource.getEventsList(query))
        .thenAnswer((_) async => listEvents);

    final result = await repository.getEventsList(query);

    expect(
      result,
      Right(listEvents),
    );

    verify(() => datasource.getEventsList(query)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.getEventsList(query))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.getEventsList(query);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.getEventsList(query)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.getEventsList(query))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.getEventsList(query);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.getEventsList(query)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.getEventsList(query))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.getEventsList(query);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.getEventsList(query)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.getEventsList(query)).thenThrow(message);

    final result = await repository.getEventsList(query);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.getEventsList(query)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a UnauthorizedFailure when get UnauthorizedException from datasource",
      () async {
    var message = "Unauthorized Error";
    when(() => datasource.getEventsList(query))
        .thenThrow(UnauthorizedException(message: message, statusCode: 403));

    final result = await repository.getEventsList(query);

    expect(result, Left(UnauthorizedFailure(message)));

    verify(() => datasource.getEventsList(query)).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
