import 'package:comdig/src/modules/dashboard/features/company/domain/entities/post_review_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IPostReviewRepository {
  Future<Either<Failure, dynamic>> postReview(PostReviewEntity postReviewEntity);
}
