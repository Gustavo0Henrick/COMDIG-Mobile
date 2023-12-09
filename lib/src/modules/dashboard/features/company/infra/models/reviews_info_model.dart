import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/models/review_model.dart';

class ReviewsInfoModel extends ReviewsInfoEntity {
  final List<ReviewModel> reviewsModel;

  const ReviewsInfoModel({
    required super.rating,
    required super.totalReviews,
    required this.reviewsModel,
  }) : super(reviews: reviewsModel);

  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
      'totalReviews': totalReviews,
      'reviews': reviewsModel.map((x) => x.toMap()).toList(),
    };
  }

  factory ReviewsInfoModel.fromMap(Map<String, dynamic> map) {
    double rating = 0.0;
    int length = 0;

    length = List<ReviewModel>.from(
        map['reviews']?.map((x) => ReviewModel.fromMap(x))).length;
    List<ReviewModel> models = List<ReviewModel>.from(
        map['reviews']?.map((x) => ReviewModel.fromMap(x)));

    for (var model in models) {
      rating = rating + model.rating;
    }

    rating = rating / models.length;

    return ReviewsInfoModel(
      rating: rating,
      totalReviews: length,
      reviewsModel: List<ReviewModel>.from(
          map['reviews']?.map((x) => ReviewModel.fromMap(x))),
    );
  }
}
