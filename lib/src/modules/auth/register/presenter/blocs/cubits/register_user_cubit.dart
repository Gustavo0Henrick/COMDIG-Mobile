import 'package:comdig/src/modules/auth/register/domain/entities/register_response_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/entities/user_data_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/usecases/register_user_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/register_user_states.dart';

class RegisterUserCubit extends Cubit<RegisterUserStates> {
  final RegisterUserUsecase usecase;

  RegisterUserCubit({required this.usecase})
      : super(RegisterUserInitialState());

  Future<void> registerUser(UserDataEntity userDataEntity) async {
    emit(RegisterUserLoadingState());

    var result = await usecase(userDataEntity);

    result.fold(
      (Failure failure) => emit(RegisterUserErrorState(failure: failure)),
      (RegisterResponseEntity success) =>
          emit(RegisterUserSuccessState(data: success)),
    );
  }
}
