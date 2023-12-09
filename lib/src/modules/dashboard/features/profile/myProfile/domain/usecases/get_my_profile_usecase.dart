import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/entities/my_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/repositories/i_get_my_profile_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetMyProfileUsecase implements IUsecase<MyProfileEntity, String> {
  final IGetMyProfileRepository repository;

  const GetMyProfileUsecase({required this.repository});

  @override
  Future<Either<Failure, MyProfileEntity>> call(String userId) async {
    return await repository.getMyProfile(userId);
  }
}
