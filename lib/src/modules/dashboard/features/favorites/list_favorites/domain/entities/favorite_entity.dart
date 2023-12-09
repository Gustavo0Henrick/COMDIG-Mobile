import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final String id;
  final String image;
  final String name;
  final String category;
  final String city;
  final String uf;
  final String type;

  const FavoriteEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.category,
    required this.city,
    required this.uf,
    required this.type,
  });

  @override
  List<String> get props => [
        id,
        image,
        name,
        category,
        city,
        uf,
        type,
      ];
}
