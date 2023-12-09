import 'package:comdig/src/modules/dashboard/features/home/carousel/domain/entities/home_ad_entity.dart';

class HomeAdModel extends HomeAdEntity {
  const HomeAdModel({
    required super.id,
    required super.title,
    required super.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type,
    };
  }

  factory HomeAdModel.fromMap(Map<String, dynamic> map) {
    return HomeAdModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      type: map['type'] ?? '',
    );
  }
}
