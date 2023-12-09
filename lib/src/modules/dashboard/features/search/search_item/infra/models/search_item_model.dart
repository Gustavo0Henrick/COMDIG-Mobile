import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/entities/search_item_entity.dart';

class SearchItemModel extends SearchItemEntity {
  const SearchItemModel({
    required super.id,
    required super.title,
    required super.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory SearchItemModel.fromMap(Map<String, dynamic> map) {
    return SearchItemModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }
}
