import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_get_reviews_repositorie.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetReviewsUsecase implements IUsecase<ReviewsInfoEntity, String> {
  final IGetReviewsRepository repository;

  const GetReviewsUsecase({required this.repository});

  @override
  Future<Either<Failure, ReviewsInfoEntity>> call(String companyId) async {
    return await repository.getReviews(companyId);
  }
}
