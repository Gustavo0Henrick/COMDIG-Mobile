import 'package:comdig/src/modules/dashboard/features/company/domain/entities/post_review_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_post_review_repository.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/usecases/post_review_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PostReviewRepositoryMock extends Mock implements IPostReviewRepository {}

main() {
  late PostReviewRepositoryMock repository;
  late PostReviewUsecase usecase;

  setUp(() {
    repository = PostReviewRepositoryMock();
    usecase = PostReviewUsecase(repository: repository);
  });

  ReviewsInfoEntity reviewsInfoEntity = const ReviewsInfoEntity(
    rating: 5,
    totalReviews: 1,
    reviews: [],
  );

  PostReviewEntity postReviewEntity = const PostReviewEntity(
    userId: "userId",
    companyId: "companyId",
    rating: 5,
    name: "name",
    description: "description",
    image: "image",
  );

  test("Should return a ReviewsInfoEntity from the PostReview Method",
      () async {
    when(() => repository.postReview(postReviewEntity)).thenAnswer(
        (_) async => Right<Failure, ReviewsInfoEntity>(reviewsInfoEntity));
    final result = await usecase(postReviewEntity);

    expect(
        result,
        const Right(
          ReviewsInfoEntity(
            rating: 5,
            totalReviews: 1,
            reviews: [],
          ),
        ));

    verify(() => repository.postReview(postReviewEntity)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.postReview(postReviewEntity)).thenAnswer((_) async =>
        Left<Failure, ReviewsInfoEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(postReviewEntity);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.postReview(postReviewEntity)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.postReview(postReviewEntity)).thenAnswer((_) async =>
        Left<Failure, ReviewsInfoEntity>(GeneralFailure(messageError)));
    final result = await usecase(postReviewEntity);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.postReview(postReviewEntity)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.postReview(postReviewEntity)).thenAnswer((_) async =>
        Left<Failure, ReviewsInfoEntity>(BadRequestFailure(messageError)));
    final result = await usecase(postReviewEntity);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.postReview(postReviewEntity)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.postReview(postReviewEntity)).thenAnswer((_) async =>
        Left<Failure, ReviewsInfoEntity>(RequestFailure(messageError)));
    final result = await usecase(postReviewEntity);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.postReview(postReviewEntity)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.postReview(postReviewEntity)).thenAnswer((_) async =>
        Left<Failure, ReviewsInfoEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(postReviewEntity);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.postReview(postReviewEntity)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
