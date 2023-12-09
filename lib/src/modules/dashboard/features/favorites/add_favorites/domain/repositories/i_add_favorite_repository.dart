import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IAddFavoriteRepository {
  Future<Either<Failure, dynamic>> addFavoriteById(String companyId);
}
