import 'dart:convert';

import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/entities/event_data_entity.dart';

class EventDataModel extends EventDataEntity {
  const EventDataModel({
    required super.title,
    required super.local,
    required super.address,
    required super.initDate,
    required super.endDate,
    required super.organizador,
    required super.instagramLink,
    required super.facebookLink,
    required super.twitterLink,
    required super.webLink,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'local': local,
      'address': address,
      'initDate': initDate,
      'endDate': endDate,
      'organizador': organizador,
      'instagramLink': instagramLink,
      'facebookLink': facebookLink,
      'twitterLink': twitterLink,
      'webLink': webLink,
    };
  }

  factory EventDataModel.fromMap(Map<String, dynamic> map) {
    return EventDataModel(
      title: map['title'] ?? '',
      local: map['local'] ?? '',
      address: map['address'] ?? '',
      initDate: map['initDate'] ?? '',
      endDate: map['endDate'] ?? '',
      organizador: map['organizador'] ?? '',
      instagramLink: map['instagramLink'] ?? '',
      facebookLink: map['facebookLink'] ?? '',
      twitterLink: map['twitterLink'] ?? '',
      webLink: map['webLink'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EventDataModel.fromJson(String source) =>
      EventDataModel.fromMap(json.decode(source));
}
