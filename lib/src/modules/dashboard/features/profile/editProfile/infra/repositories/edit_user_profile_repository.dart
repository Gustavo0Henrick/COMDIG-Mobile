import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/entities/edit_user_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/repositories/i_edit_user_profile_repository.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/datasources/i_edit_user_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/models/edit_user_profile_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class EditUserProfileRepository implements IEditUserProfileRepository {
  final IEditUserProfileDatasource datasource;

  const EditUserProfileRepository({required this.datasource});

  @override
  Future<Either<Failure, bool>> editUserProfile(
      EditUserProfileEntity editUserProfileEntity) async {
    try {
      EditUserProfileModel editUserProfileModel = EditUserProfileModel(
        id: editUserProfileEntity.id,
        name: editUserProfileEntity.name,
        lastname: editUserProfileEntity.lastname,
        city: editUserProfileEntity.city,
        uf: editUserProfileEntity.uf,
        birthDate: editUserProfileEntity.birthDate,
        cellphone: editUserProfileEntity.cellphone,
      );

      bool result = await datasource.editUserProfile(editUserProfileModel);

      return Right<Failure, bool>(result);
    } on ServerException catch (e) {
      return Left<Failure, bool>(ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, bool>(UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, bool>(BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, bool>(RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, bool>(GeneralFailure(e.toString()));
    }
  }
}
