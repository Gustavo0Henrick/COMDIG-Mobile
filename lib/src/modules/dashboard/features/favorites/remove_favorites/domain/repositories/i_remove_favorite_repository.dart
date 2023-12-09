import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IRemoveFavoriteRepository {
  Future<Either<Failure, dynamic>> removeFavoriteById(String companyId);
}
