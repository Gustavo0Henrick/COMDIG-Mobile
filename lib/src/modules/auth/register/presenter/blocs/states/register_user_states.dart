part of '../cubits/register_user_cubit.dart';

abstract class RegisterUserStates extends Equatable {}

class RegisterUserInitialState extends RegisterUserStates {
  @override
  List<Object?> get props => [];
}

class RegisterUserLoadingState extends RegisterUserStates {
  @override
  List<Object?> get props => [];
}

class RegisterUserSuccessState extends RegisterUserStates {
  final RegisterResponseEntity data;

  RegisterUserSuccessState({required this.data});

  @override
  List<RegisterResponseEntity> get props => [data];
}

class RegisterUserErrorState extends RegisterUserStates {
  final Failure failure;

  RegisterUserErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
