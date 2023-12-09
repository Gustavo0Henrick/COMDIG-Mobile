import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/entities/edit_user_profile_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IEditUserProfileRepository {
  Future<Either<Failure, bool>> editUserProfile(
      EditUserProfileEntity editUserProfileEntity);
}
