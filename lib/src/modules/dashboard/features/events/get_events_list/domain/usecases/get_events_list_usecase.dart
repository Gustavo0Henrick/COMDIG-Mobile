import 'package:comdig/src/modules/dashboard/features/events/get_events_list/domain/repositories/i_get_events_list_repository.dart';
import 'package:comdig/src/shared/entities/event_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetEventsListUsecase implements IUsecase<List<EventEntity>, String> {
  final IGetEventsListRepository repository;

  const GetEventsListUsecase({required this.repository});

  @override
  Future<Either<Failure, List<EventEntity>>> call(String query) async {
    return await repository.getEventsList(query);
  }
}
