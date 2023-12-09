import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final String city;
  final String uf;
  final String email;
  final String cellphone;
  final String birthDate;
  final String createdAt;
  final String updatedAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.lastname,
    required this.city,
    required this.uf,
    required this.email,
    required this.cellphone,
    required this.birthDate,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<String> get props => [
        id,
        name,
        lastname,
        email,
        cellphone,
        birthDate,
        createdAt,
        updatedAt,
      ];
}
