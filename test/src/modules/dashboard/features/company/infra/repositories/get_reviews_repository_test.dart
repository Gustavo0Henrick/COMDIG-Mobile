import 'package:comdig/src/modules/dashboard/features/company/domain/entities/review_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_get_reviews_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/repositories/get_reviews_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetReviewsDatasourceMock extends Mock implements IGetReviewsDatasource {}

main() {
  late IGetReviewsDatasource datasource;
  late GetReviewsRepository repository;

  setUp(() {
    datasource = GetReviewsDatasourceMock();
    repository = GetReviewsRepository(datasource: datasource);
  });

  String companyId = "companyId";

  DateTime date = DateTime.now();

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

  test("Should return a Success Message from GetReviews Method", () async {
    when(() => datasource.getReviews(companyId))
        .thenAnswer((_) async => reviewsInfoEntity);

    final result = await repository.getReviews(companyId);

    expect(
      result,
      Right(reviewsInfoEntity),
    );

    verify(() => datasource.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.getReviews(companyId))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.getReviews(companyId);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.getReviews(companyId))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.getReviews(companyId);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.getReviews(companyId))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.getReviews(companyId);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.getReviews(companyId)).thenThrow(message);

    final result = await repository.getReviews(companyId);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a UnauthorizedFailure when get UnauthorizedException from datasource",
      () async {
    var message = "Unauthorized Error";
    when(() => datasource.getReviews(companyId))
        .thenThrow(UnauthorizedException(message: message, statusCode: 403));

    final result = await repository.getReviews(companyId);

    expect(result, Left(UnauthorizedFailure(message)));

    verify(() => datasource.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
