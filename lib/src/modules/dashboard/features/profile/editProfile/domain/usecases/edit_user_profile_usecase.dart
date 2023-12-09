import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/entities/edit_user_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/repositories/i_edit_user_profile_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class EditUserProfileUsecase implements IUsecase<bool, EditUserProfileEntity> {
  final IEditUserProfileRepository repository;

  const EditUserProfileUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(EditUserProfileEntity params) async {
    return await repository.editUserProfile(params);
  }
}
