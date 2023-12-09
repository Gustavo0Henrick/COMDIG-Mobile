import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final String title;
  final String local;
  final String date;
  final String href;

  const EventEntity({
    required this.title,
    required this.local,
    required this.date,
    required this.href,
  });

  @override
  List<String> get props => [title, local, date, href];
}
