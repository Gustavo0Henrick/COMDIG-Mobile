import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/entities/my_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/usecases/get_my_profile_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_my_profile_states.dart';

class GetMyProfileCubit extends Cubit<GetMyProfileStates> {
  final GetMyProfileUsecase usecase;

  GetMyProfileCubit({required this.usecase})
      : super(GetMyProfileInitialState());

  Future<void> getMyProfile(String userId) async {
    emit(GetMyProfileLoadingState());



    var result = await usecase(userId);

    result.fold(
      (Failure failure) => emit(GetMyProfileErrorState(failure: failure)),
      (MyProfileEntity success) =>
          emit(GetMyProfileSuccessState(myProfile: success)),
    );
  }
}
