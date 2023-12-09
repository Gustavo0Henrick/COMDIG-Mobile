import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IGetRecommendedRepository {
  Future<Either<Failure, List<CompanyItemEntity>>> getRecommended();
}
