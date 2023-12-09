import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  const FavoriteModel({
    required super.id,
    required super.image,
    required super.name,
    required super.category,
    required super.city,
    required super.uf,
    required super.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'category': category,
      'city': city,
      'uf': uf,
      'type': type,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      city: map['city'] ?? '',
      uf: map['uf'] ?? '',
      type: map['type'] ?? '',
    );
  }
}
