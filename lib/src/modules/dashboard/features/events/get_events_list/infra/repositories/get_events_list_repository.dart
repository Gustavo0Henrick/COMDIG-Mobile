import 'package:comdig/src/modules/dashboard/features/events/get_events_list/domain/repositories/i_get_events_list_repository.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/infra/datasources/i_get_events_list_datasource.dart';
import 'package:comdig/src/shared/entities/event_entity.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class GetEventsListRepository implements IGetEventsListRepository {
  final IGetEventsListDatasource datasource;

  const GetEventsListRepository({required this.datasource});

  @override
  Future<Either<Failure, List<EventEntity>>> getEventsList(String query) async {
    try {
      var response = await datasource.getEventsList(query);

      List<EventEntity> result = response;

      return Right<Failure, List<EventEntity>>(result);
    } on ServerException catch (e) {
      return Left<Failure, List<EventEntity>>(
          ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, List<EventEntity>>(
          UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, List<EventEntity>>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, List<EventEntity>>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, List<EventEntity>>(GeneralFailure(e.toString()));
    }
  }
}
