import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IGetReviewsRepository {
  Future<Either<Failure, ReviewsInfoEntity>> getReviews(String companyId);
}
