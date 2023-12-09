import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IResetPasswordRepository {
  Future<Either<Failure, bool>> resetPassword(
      ({String code, String email, String password}) resetData);
}
