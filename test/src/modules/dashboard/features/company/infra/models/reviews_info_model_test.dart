import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/models/review_model.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/models/reviews_info_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ReviewsInfoModel reviewsInfoModel;

  DateTime date = DateTime.now();

  setUp(() {
    reviewsInfoModel = ReviewsInfoModel(
      rating: 5,
      totalReviews: 1,
      reviewsModel: [
        ReviewModel(
          id: "id",
          name: "name",
          description: "description",
          rating: 5,
          image: "image",
          createdAt: date,
        ),
      ],
    );
  });

  test("Should be a subclass of ReviewsInfoEntity", () {
    expect(reviewsInfoModel, isA<ReviewsInfoEntity>());
  });

  test("Should return a valid ReviewsInfoModel from a Map", () {
    final Map<String, dynamic> map = {
      "rating": 5,
      "totalReviews": 1,
      "reviews": [
        {
          "id": "id",
          "name": "name",
          "description": "description",
          "rating": 5,
          "image": "image",
          "createdAt": date.toUtc().toIso8601String(),
        }
      ],
    };

    final result = ReviewsInfoModel.fromMap(map);

    expect(result, isA<ReviewsInfoModel>());
  });

  test("Should return Map containing the ReviewsInfoModel data", () {
    final expectedMap = {
      "rating": 5,
      "totalReviews": 1,
      "reviews": [
        {
          "id": "id",
          "name": "name",
          "description": "description",
          "rating": 5,
          "image": "image",
          "createdAt": date.millisecondsSinceEpoch,
        }
      ],
    };

    final result = reviewsInfoModel.toMap();

    expect(result, expectedMap);
  });
}
