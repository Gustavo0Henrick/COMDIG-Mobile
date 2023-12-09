import 'package:comdig/src/modules/auth/login/domain/entities/login_response_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/entities/login_user_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/usecases/login_user_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/login_user_states.dart';

class LoginUserCubit extends Cubit<LoginUserStates> {
  final LoginUserUsecase usecase;
  final ISecureStorageManager storage;

  LoginUserCubit({required this.usecase, required this.storage})
      : super(LoginUserInitialState());

  Future<void> loginUser(LoginUserEntity loginUserEntity) async {
    emit(LoginUserLoadingState());

    var result = await usecase(loginUserEntity);

    result.fold(
      (Failure failure) => emit(LoginUserErrorState(failure: failure)),
      (LoginResponseEntity success) async {
        await storage.saveData(
            StorageKeys.accessToken, success.token.accessToken);
        await storage.saveData(
            StorageKeys.refreshToken, success.token.refreshToken);
        return emit(LoginUserSuccessState(data: success));
      },
    );
  }
}
