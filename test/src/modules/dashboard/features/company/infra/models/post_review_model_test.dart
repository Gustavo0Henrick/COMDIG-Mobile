import 'package:comdig/src/modules/dashboard/features/company/domain/entities/post_review_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/models/post_review_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late PostReviewModel postReviewModel;

  setUp(() {
    postReviewModel = const PostReviewModel(
      userId: "userId",
      name: "name",
      description: "description",
      rating: 5,
      image: "image",
      companyId: "companyId",
    );
  });

  test("Should be a subclass of PostReviewEntity", () {
    expect(postReviewModel, isA<PostReviewEntity>());
  });

  test("Should return a valid PostReviewModel from a Map", () {
    final Map<String, dynamic> map = {
      'userId': "userId",
      'companyId': "companyId",
      'rating': 5,
      'name': "name",
      'description': "description",
      'image': "image",
    };

    final result = PostReviewModel.fromMap(map);

    expect(result, isA<PostReviewModel>());
  });

  test("Should return Map containing the PostReviewModel data", () {
    final expectedMap = {
      'userId': "userId",
      'companyId': "companyId",
      'rating': 5,
      'name': "name",
      'description': "description",
      'image': "image",
    };

    final result = postReviewModel.toMap();

    expect(result, expectedMap);
  });
}
