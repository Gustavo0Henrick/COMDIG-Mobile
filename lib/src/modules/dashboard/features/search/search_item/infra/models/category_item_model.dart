import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/entities/category_item_entity.dart';

class CategoryItemModel extends CategoryItemEntity {
  const CategoryItemModel({required super.id, required super.categoryName});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryName': categoryName,
    };
  }

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    return CategoryItemModel(
      id: map['id'] ?? '',
      categoryName: map['category'] ?? '',
    );
  }
}
