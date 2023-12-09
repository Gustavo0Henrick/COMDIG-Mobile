import 'package:comdig/src/modules/dashboard/features/company/domain/entities/review_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/models/review_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ReviewModel reviewModel;

  DateTime date = DateTime.now();

  setUp(() {
    reviewModel = ReviewModel(
      id: "id",
      name: "name",
      description: "description",
      rating: 5,
      image: "image",
      createdAt: date,
    );
  });

  test("Should be a subclass of ReviewEntity", () {
    expect(reviewModel, isA<ReviewEntity>());
  });

  test("Should return a valid ReviewModel from a Map", () {
    final Map<String, dynamic> map = {
      "id": "id",
      "name": "name",
      "description": "description",
      "rating": 5,
      "image": "image",
      "createdAt": date.toUtc().toIso8601String(),
    };

    final result = ReviewModel.fromMap(map);

    expect(result, isA<ReviewModel>());
  });

  test("Should return Map containing the ReviewModel data", () {
    final expectedMap = {
      "id": "id",
      "name": "name",
      "description": "description",
      "rating": 5,
      "image": "image",
      "createdAt": date.millisecondsSinceEpoch,
    };

    final result = reviewModel.toMap();

    expect(result, expectedMap);
  });
}
