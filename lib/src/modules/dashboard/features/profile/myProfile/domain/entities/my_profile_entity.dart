import 'package:equatable/equatable.dart';

class MyProfileEntity extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String birthDate;
  final String cellphone;
  final String uf;
  final String city;
  final String createdAt;
  final String updatedAt;

  const MyProfileEntity({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.birthDate,
    required this.cellphone,
    required this.city,
    required this.uf,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<String> get props => [
        id,
        name,
        lastname,
        email,
        birthDate,
        cellphone,
        city,
        uf,
        createdAt,
        updatedAt,
      ];
}
