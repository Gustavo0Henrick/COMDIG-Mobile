import 'package:equatable/equatable.dart';

class PostReviewEntity extends Equatable {
  final String userId;
  final String companyId;
  final int rating;
  final String name;
  final String description;
  final String image;

  const PostReviewEntity({
    required this.userId,
    required this.companyId,
    required this.rating,
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props =>
      [userId, companyId, rating, name, description, image];
}
