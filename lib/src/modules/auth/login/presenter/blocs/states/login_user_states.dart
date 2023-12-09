part of '../cubits/login_user_cubit.dart';

abstract class LoginUserStates extends Equatable {}

class LoginUserInitialState extends LoginUserStates {
  @override
  List<Object?> get props => [];
}

class LoginUserLoadingState extends LoginUserStates {
  @override
  List<Object?> get props => [];
}

class LoginUserSuccessState extends LoginUserStates {
  final LoginResponseEntity data;

  LoginUserSuccessState({required this.data});

  @override
  List<LoginResponseEntity> get props => [data];
}

class LoginUserErrorState extends LoginUserStates {
  final Failure failure;

  LoginUserErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
