import 'package:equatable/equatable.dart';

class SearchItemEntity extends Equatable {
  final String id;
  final String title;
  final String description;

  const SearchItemEntity({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  List<String> get props => [id, title, description];
}
