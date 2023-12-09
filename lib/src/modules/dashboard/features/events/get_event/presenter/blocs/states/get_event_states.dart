part of '../cubits/get_event_cubit.dart';

abstract class GetEventStates extends Equatable {}

class GetEventInitialState extends GetEventStates {
  @override
  List<Object?> get props => [];
}

class GetEventLoadingState extends GetEventStates {
  @override
  List<Object?> get props => [];
}

class GetEventSuccessState extends GetEventStates {
  final EventDataEntity result;

  GetEventSuccessState({required this.result});

  @override
  List<EventDataEntity> get props => [result];
}

class GetEventErrorState extends GetEventStates {
  final Failure failure;

  GetEventErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
