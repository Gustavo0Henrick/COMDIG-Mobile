import 'package:equatable/equatable.dart';

class CategoryItemEntity extends Equatable {
  final String id;
  final String categoryName;

  const CategoryItemEntity({required this.id, required this.categoryName});

  @override
  List<String> get props => [id, categoryName];
}
