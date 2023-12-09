import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/entities/edit_user_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/usecases/edit_user_profile_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/edit_user_profile_states.dart';

class EditUserProfileCubit extends Cubit<EditUserProfileStates> {
  final EditUserProfileUsecase usecase;

  EditUserProfileCubit({required this.usecase})
      : super(EditUserProfileInitialState());

  Future<void> editUserProfile(
      EditUserProfileEntity editUserProfileEntity) async {
    emit(EditUserProfileLoadingState());

    var result = await usecase(editUserProfileEntity);

    result.fold(
      (Failure failure) => emit(EditUserProfileErrorState(failure: failure)),
      (bool success) => emit(EditUserProfileSuccessState(result: success)),
    );
  }
}
