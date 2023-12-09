import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_get_reviews_repositorie.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_get_reviews_datasource.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class GetReviewsRepository implements IGetReviewsRepository {
  final IGetReviewsDatasource datasource;

  const GetReviewsRepository({required this.datasource});

  @override
  Future<Either<Failure, ReviewsInfoEntity>> getReviews(
      String companyId) async {
    try {
      ReviewsInfoEntity response = await datasource.getReviews(companyId);

      return Right<Failure, ReviewsInfoEntity>(response);
    } on ServerException catch (e) {
      return Left<Failure, ReviewsInfoEntity>(
          ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, ReviewsInfoEntity>(
          UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, ReviewsInfoEntity>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, ReviewsInfoEntity>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, ReviewsInfoEntity>(GeneralFailure(e.toString()));
    }
  }
}
