import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/entities/event_data_entity.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/infra/datasources/i_get_event_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/infra/repositories/get_event_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetEventDatasourceMock extends Mock implements IGetEventDatasource {}

main() {
  late IGetEventDatasource datasource;
  late GetEventRepository repository;

  setUp(() {
    datasource = GetEventDatasourceMock();
    repository = GetEventRepository(datasource: datasource);
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

  test("Should return a Success Message from GetEvent Method", () async {
    when(() => datasource.getEvent(url)).thenAnswer((_) async => event);

    final result = await repository.getEvent(url);

    expect(
      result,
      Right(event),
    );

    verify(() => datasource.getEvent(url)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.getEvent(url))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.getEvent(url);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.getEvent(url)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.getEvent(url))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.getEvent(url);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.getEvent(url)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.getEvent(url))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.getEvent(url);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.getEvent(url)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.getEvent(url)).thenThrow(message);

    final result = await repository.getEvent(url);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.getEvent(url)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a UnauthorizedFailure when get UnauthorizedException from datasource",
      () async {
    var message = "Unauthorized Error";
    when(() => datasource.getEvent(url))
        .thenThrow(UnauthorizedException(message: message, statusCode: 403));

    final result = await repository.getEvent(url);

    expect(result, Left(UnauthorizedFailure(message)));

    verify(() => datasource.getEvent(url)).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
