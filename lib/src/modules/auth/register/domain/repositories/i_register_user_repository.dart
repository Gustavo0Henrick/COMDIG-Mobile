import 'package:comdig/src/modules/auth/register/domain/entities/register_response_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/entities/user_data_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IRegisterUserRepository {
  Future<Either<Failure, RegisterResponseEntity>> registerUser(UserDataEntity userDataEntity);
}
