import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_get_reviews_repositorie.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/usecases/get_reviews_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetReviewsRepositoryMock extends Mock implements IGetReviewsRepository {}

main() {
  late GetReviewsRepositoryMock repository;
  late GetReviewsUsecase usecase;

  setUp(() {
    repository = GetReviewsRepositoryMock();
    usecase = GetReviewsUsecase(repository: repository);
  });

  String companyId = "companyId";

  ReviewsInfoEntity company = const ReviewsInfoEntity(
    rating: 5,
    totalReviews: 1,
    reviews: [],
  );

  test("Should return a ReviewsInfoEntity from the GetReviews Method",
      () async {
    when(() => repository.getReviews(companyId))
        .thenAnswer((_) async => Right<Failure, ReviewsInfoEntity>(company));
    final result = await usecase(companyId);

    expect(
        result,
        const Right(
          ReviewsInfoEntity(
            rating: 5,
            totalReviews: 1,
            reviews: [],
          ),
        ));

    verify(() => repository.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.getReviews(companyId)).thenAnswer((_) async =>
        Left<Failure, ReviewsInfoEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.getReviews(companyId)).thenAnswer((_) async =>
        Left<Failure, ReviewsInfoEntity>(GeneralFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.getReviews(companyId)).thenAnswer((_) async =>
        Left<Failure, ReviewsInfoEntity>(BadRequestFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.getReviews(companyId)).thenAnswer((_) async =>
        Left<Failure, ReviewsInfoEntity>(RequestFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.getReviews(companyId)).thenAnswer((_) async =>
        Left<Failure, ReviewsInfoEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getReviews(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
