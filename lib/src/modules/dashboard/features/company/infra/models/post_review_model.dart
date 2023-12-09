import 'package:comdig/src/modules/dashboard/features/company/domain/entities/post_review_entity.dart';

class PostReviewModel extends PostReviewEntity {
  const PostReviewModel({
    required super.userId,
    required super.companyId,
    required super.rating,
    required super.name,
    required super.description,
    required super.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'companyId': companyId,
      'rating': rating,
      'name': name,
      'description': description,
      'image': image,
    };
  }

  factory PostReviewModel.fromMap(Map<String, dynamic> map) {
    return PostReviewModel(
      userId: map['userId'] ?? '',
      companyId: map['companyId'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
