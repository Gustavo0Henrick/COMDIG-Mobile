import 'package:equatable/equatable.dart';

class EventDataEntity extends Equatable {
  final String title;
  final String local;
  final String address;
  final String initDate;
  final String endDate;
  final String organizador;
  final String instagramLink;
  final String facebookLink;
  final String twitterLink;
  final String webLink;

  const EventDataEntity({
    required this.title,
    required this.local,
    required this.address,
    required this.initDate,
    required this.endDate,
    required this.organizador,
    required this.instagramLink,
    required this.facebookLink,
    required this.twitterLink,
    required this.webLink,
  });

  @override
  List<String> get props => [
        title,
        local,
        address,
        initDate,
        endDate,
        organizador,
        instagramLink,
        facebookLink,
        twitterLink,
        webLink,
      ];
}
