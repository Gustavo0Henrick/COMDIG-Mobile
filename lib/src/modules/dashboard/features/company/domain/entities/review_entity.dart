import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final double rating;
  final String id;
  final String image;
  final String name;
  final String description;
  final DateTime createdAt;

  const ReviewEntity({
    required this.rating,
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [rating, id, image, name, description, createdAt];
}
