import 'package:equatable/equatable.dart';

class HomeAdEntity extends Equatable {
  final String id;
  final String title;
  final String type;

  const HomeAdEntity({
    required this.id,
    required this.title,
    required this.type,
  });

  @override
  List<String> get props => [id, title, type];
}
