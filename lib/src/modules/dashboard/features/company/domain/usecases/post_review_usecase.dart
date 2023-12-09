import 'package:comdig/src/modules/dashboard/features/company/domain/entities/post_review_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_post_review_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class PostReviewUsecase implements IUsecase<dynamic, PostReviewEntity> {
  final IPostReviewRepository repository;

  const PostReviewUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(
      PostReviewEntity postReviewEntity) async {
    return await repository.postReview(postReviewEntity);
  }
}
