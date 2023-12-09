part of '../cubits/get_events_list_cubit.dart';

abstract class GetEventsListStates extends Equatable {}

class GetEventsListInitialState extends GetEventsListStates {
  @override
  List<Object?> get props => [];
}

class GetEventsListLoadingState extends GetEventsListStates {
  @override
  List<Object?> get props => [];
}

class GetEventsListSuccessState extends GetEventsListStates {
  final List<EventEntity> result;

  GetEventsListSuccessState({required this.result});

  @override
  List<List<EventEntity>> get props => [result];
}

class GetEventsListErrorState extends GetEventsListStates {
  final Failure failure;

  GetEventsListErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
