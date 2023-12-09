import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/entities/my_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/repositories/i_get_my_profile_repository.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/datasources/i_get_my_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/models/my_profile_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class GetMyProfileRepository implements IGetMyProfileRepository {
  final IGetMyProfileDatasource datasource;

  const GetMyProfileRepository({required this.datasource});

  @override
  Future<Either<Failure, MyProfileEntity>> getMyProfile(userId) async {
    try {
      MyProfileModel result = await datasource.getMyProfile(userId);
      return Right<Failure, MyProfileEntity>(result);
    } on ServerException catch (e) {
      return Left<Failure, MyProfileEntity>(
          ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, MyProfileEntity>(
          UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, MyProfileEntity>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, MyProfileEntity>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, MyProfileEntity>(GeneralFailure(e.toString()));
    }
  }
}
