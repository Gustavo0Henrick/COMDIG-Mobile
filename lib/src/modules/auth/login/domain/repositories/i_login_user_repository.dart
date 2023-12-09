import 'package:comdig/src/modules/auth/login/domain/entities/login_response_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/entities/login_user_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class ILoginUserRepository {
  Future<Either<Failure, LoginResponseEntity>> loginUser(
      LoginUserEntity loginUserEntity);
}
