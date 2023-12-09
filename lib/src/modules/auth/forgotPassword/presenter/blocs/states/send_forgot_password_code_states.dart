part of '../cubits/send_forgot_password_code_cubit.dart';

abstract class SendForgotPasswordCodeStates extends Equatable {}

class SendForgotPasswordCodeInitialState extends SendForgotPasswordCodeStates {
  @override
  List<Object?> get props => [];
}

class SendForgotPasswordCodeLoadingState extends SendForgotPasswordCodeStates {
  @override
  List<Object?> get props => [];
}

class SendForgotPasswordCodeSuccessState extends SendForgotPasswordCodeStates {
  final bool result;

  SendForgotPasswordCodeSuccessState({required this.result});

  @override
  List<bool> get props => [result];
}

class SendForgotPasswordCodeErrorState extends SendForgotPasswordCodeStates {
  final Failure failure;

  SendForgotPasswordCodeErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
