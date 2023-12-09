import 'package:comdig/src/modules/dashboard/features/company/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.rating,
    required super.id,
    required super.image,
    required super.name,
    required super.description,
    required super.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
      'id': id,
      'image': image,
      'name': name,
      'description': description,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      rating: map['rating']?.toDouble() ?? 0.0,
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
