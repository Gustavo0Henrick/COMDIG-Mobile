import 'package:comdig/src/modules/dashboard/features/company/domain/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class ReviewsInfoEntity extends Equatable {
  final double rating;
  final int totalReviews;
  final List<ReviewEntity> reviews;

  const ReviewsInfoEntity({
    required this.rating,
    required this.totalReviews,
    required this.reviews,
  });

  @override
  List<Object?> get props => [rating, totalReviews, reviews];
}
