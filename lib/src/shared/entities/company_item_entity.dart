import 'package:equatable/equatable.dart';

class CompanyItemEntity extends Equatable {
  final String id;
  final String name;
  final String category;
  final String email;
  final String site;
  final String phone;
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String address;
  final String city;
  final String uf;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String image;

  const CompanyItemEntity(
      {required this.id,
      required this.name,
      required this.category,
      required this.city,
      required this.uf,
      required this.email,
      required this.address,
      required this.site,
      required this.phone,
      required this.sunday,
      required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.createdAt,
      required this.updatedAt,
      required this.image});

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        city,
        uf,
        email,
        createdAt,
        updatedAt,
        image,
        address,
        phone,
        site,
        sunday,
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
      ];
}
