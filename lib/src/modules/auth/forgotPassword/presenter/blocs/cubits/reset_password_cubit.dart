import 'package:comdig/src/modules/auth/forgotPassword/domain/usecases/reset_password_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/reset_password_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  final ResetPasswordUsecase usecase;

  ResetPasswordCubit({required this.usecase})
      : super(ResetPasswordInitialState());

  Future resetPassword(
      ({String email, String code, String password}) resetData) async {
    emit(ResetPasswordLoadingState());

    var result = await usecase(resetData);

    result.fold(
      (Failure failure) => emit(ResetPasswordErrorState(failure: failure)),
      (bool success) => emit(ResetPasswordSuccessState(result: success)),
    );
  }
}
