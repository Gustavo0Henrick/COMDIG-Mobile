import 'package:comdig/src/modules/dashboard/features/events/get_events_list/domain/usecases/get_events_list_usecase.dart';
import 'package:comdig/src/shared/entities/event_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_events_list_states.dart';

class GetEventsListCubit extends Cubit<GetEventsListStates> {
  final GetEventsListUsecase usecase;

  GetEventsListCubit({required this.usecase})
      : super(GetEventsListInitialState());

  Future<void> getEventsList(String query) async {
    emit(GetEventsListLoadingState());

    var result = await usecase(query);

    result.fold(
      (Failure failure) => emit(GetEventsListErrorState(failure: failure)),
      (List<EventEntity> success) => emit(
        GetEventsListSuccessState(result: success),
      ),
    );
  }
}
