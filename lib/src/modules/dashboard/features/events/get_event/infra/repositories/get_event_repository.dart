import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/entities/event_data_entity.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/repositories/i_get_event_repository.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/infra/datasources/i_get_event_datasource.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class GetEventRepository implements IGetEventRepository {
  final IGetEventDatasource datasource;

  const GetEventRepository({required this.datasource});

  @override
  Future<Either<Failure, EventDataEntity>> getEvent(String url) async {
    try {
      var response = await datasource.getEvent(url);

      EventDataEntity result = response;

      return Right<Failure, EventDataEntity>(result);
    } on ServerException catch (e) {
      return Left<Failure, EventDataEntity>(
          ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, EventDataEntity>(
          UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, EventDataEntity>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, EventDataEntity>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, EventDataEntity>(GeneralFailure(e.toString()));
    }
  }
}
