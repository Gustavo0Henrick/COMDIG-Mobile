import 'package:comdig/src/shared/entities/user_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IGetMySelfRepository {
  Future<Either<Failure, UserEntity>> getMySelf(String id);
}
