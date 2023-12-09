import 'package:comdig/src/modules/auth/login/domain/usecases/get_my_self_usecase.dart';
import 'package:comdig/src/shared/entities/user_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_my_self_states.dart';

class GetMySelfCubit extends Cubit<GetMySelfStates> {
  final GetMySelfUsecase usecase;
  final ISecureStorageManager storage;

  GetMySelfCubit({required this.usecase, required this.storage})
      : super(GetMySelfInitialState());

  Future<void> getMySelf(String id) async {
    emit(GetMySelfLoadingState());

    var result = await usecase(id);

    result.fold(
      (Failure failure) => emit(GetMySelfErrorState(failure: failure)),
      (UserEntity success) async {
        await storage.saveData(StorageKeys.name, success.name);
        await storage.saveData(StorageKeys.lastname, success.lastname);
        await storage.saveData(StorageKeys.email, success.email);
        await storage.saveData(StorageKeys.cellphone, success.cellphone);
        return emit(GetMySelfSuccessState(userEntity: success));
      },
    );
  }

}
