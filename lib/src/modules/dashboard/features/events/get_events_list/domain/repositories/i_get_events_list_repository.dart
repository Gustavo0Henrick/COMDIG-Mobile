import 'package:comdig/src/shared/entities/event_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IGetEventsListRepository {
  Future<Either<Failure, List<EventEntity>>> getEventsList(String query);
}
