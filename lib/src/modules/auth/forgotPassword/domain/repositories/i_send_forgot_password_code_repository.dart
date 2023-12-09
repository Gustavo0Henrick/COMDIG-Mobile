import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class ISendForgotPasswordCodeRepository {
  Future<Either<Failure, bool>> sendForgotPasswordCode(String email);
}
