part of '../cubits/reset_password_cubit.dart';

abstract class ResetPasswordStates extends Equatable {}

class ResetPasswordInitialState extends ResetPasswordStates {
  @override
  List<Object?> get props => [];
}

class ResetPasswordLoadingState extends ResetPasswordStates {
  @override
  List<Object?> get props => [];
}

class ResetPasswordSuccessState extends ResetPasswordStates {
  final bool result;

  ResetPasswordSuccessState({required this.result});

  @override
  List<bool> get props => [result];
}

class ResetPasswordErrorState extends ResetPasswordStates {
  final Failure failure;

  ResetPasswordErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
