import 'package:comdig/src/modules/dashboard/features/company/domain/entities/review_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_post_review_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/models/post_review_model.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/repositories/post_review_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PostReviewDatasourceMock extends Mock implements IPostReviewDatasource {}

main() {
  late IPostReviewDatasource datasource;
  late PostReviewRepository repository;

  setUp(() {
    datasource = PostReviewDatasourceMock();
    repository = PostReviewRepository(datasource: datasource);
  });

  DateTime date = DateTime.now();

  PostReviewModel postReviewModel = const PostReviewModel(
    userId: "userId",
    name: "name",
    description: "description",
    rating: 5,
    image: "image",
    companyId: "companyId",
  );

  ReviewsInfoEntity reviewsInfoEntity = ReviewsInfoEntity(
    rating: 5,
    totalReviews: 1,
    reviews: [
      ReviewEntity(
        id: "id",
        name: "name",
        description: "description",
        rating: 5,
        image: "image",
        createdAt: date,
      )
    ],
  );

  test("Should return a Success Message from PostReview Method", () async {
    when(() => datasource.postReview(postReviewModel))
        .thenAnswer((_) async => reviewsInfoEntity);

    final result = await repository.postReview(postReviewModel);

    expect(
      result,
      Right(reviewsInfoEntity),
    );

    verify(() => datasource.postReview(postReviewModel)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.postReview(postReviewModel))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.postReview(postReviewModel);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.postReview(postReviewModel)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.postReview(postReviewModel))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.postReview(postReviewModel);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.postReview(postReviewModel)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.postReview(postReviewModel))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.postReview(postReviewModel);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.postReview(postReviewModel)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.postReview(postReviewModel)).thenThrow(message);

    final result = await repository.postReview(postReviewModel);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.postReview(postReviewModel)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a UnauthorizedFailure when get UnauthorizedException from datasource",
      () async {
    var message = "Unauthorized Error";
    when(() => datasource.postReview(postReviewModel))
        .thenThrow(UnauthorizedException(message: message, statusCode: 403));

    final result = await repository.postReview(postReviewModel);

    expect(result, Left(UnauthorizedFailure(message)));

    verify(() => datasource.postReview(postReviewModel)).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
