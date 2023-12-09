import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/entities/event_data_entity.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/repositories/i_get_event_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetEventUsecase implements IUsecase<EventDataEntity, String> {
  final IGetEventRepository repository;
  const GetEventUsecase({required this.repository});

  @override
  Future<Either<Failure, EventDataEntity>> call(String url) async {
    return await repository.getEvent(url);
  }
}
