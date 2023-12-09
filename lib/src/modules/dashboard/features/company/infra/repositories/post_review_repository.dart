import 'package:comdig/src/modules/dashboard/features/company/domain/entities/post_review_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_post_review_repository.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_post_review_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/models/post_review_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class PostReviewRepository implements IPostReviewRepository {
  final IPostReviewDatasource datasource;

  const PostReviewRepository({required this.datasource});

  @override
  Future<Either<Failure, dynamic>> postReview(
      PostReviewEntity postReviewEntity) async {
    try {
      PostReviewModel postReviewModel = PostReviewModel(
        userId: postReviewEntity.userId,
        companyId: postReviewEntity.companyId,
        rating: postReviewEntity.rating,
        name: postReviewEntity.name,
        description: postReviewEntity.description,
        image: postReviewEntity.image,
      );

      dynamic response = await datasource.postReview(postReviewModel);

      return Right<Failure, dynamic>(response);
    } on ServerException catch (e) {
      return Left<Failure, dynamic>(ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, dynamic>(UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, dynamic>(BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, dynamic>(RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, dynamic>(GeneralFailure(e.toString()));
    }
  }
}
