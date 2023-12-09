import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/entities/event_data_entity.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/usecases/get_event_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_event_states.dart';

class GetEventCubit extends Cubit<GetEventStates> {
  final GetEventUsecase usecase;

  GetEventCubit({required this.usecase}) : super(GetEventInitialState());

  Future<void> getEvent(String url) async {
    emit(GetEventLoadingState());

    var result = await usecase(url);

    result.fold(
      (Failure failure) => emit(GetEventErrorState(failure: failure)),
      (EventDataEntity success) => emit(
        GetEventSuccessState(result: success),
      ),
    );
  }
}
