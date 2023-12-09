import 'package:comdig/src/modules/auth/forgotPassword/domain/usecases/send_forgot_password_code_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/send_forgot_password_code_states.dart';

class SendForgotPasswordCodeCubit extends Cubit<SendForgotPasswordCodeStates> {
  final SendForgotPasswordCodeUsecase usecase;

  SendForgotPasswordCodeCubit({required this.usecase})
      : super(SendForgotPasswordCodeInitialState());

  Future sendForgotPasswordCode(String email) async {
    emit(SendForgotPasswordCodeLoadingState());

    var result = await usecase(email);

    result.fold(
      (Failure failure) =>
          emit(SendForgotPasswordCodeErrorState(failure: failure)),
      (bool success) =>
          emit(SendForgotPasswordCodeSuccessState(result: success)),
    );
  }
}
