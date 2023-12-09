import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/entities/my_profile_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IGetMyProfileRepository {
  Future<Either<Failure, MyProfileEntity>> getMyProfile(String userId);
}
