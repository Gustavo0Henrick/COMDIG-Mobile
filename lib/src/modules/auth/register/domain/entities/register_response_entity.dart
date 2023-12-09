import 'package:equatable/equatable.dart';

class RegisterResponseEntity extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String cellphone;
  final String city;
  final String uf;
  final DateTime birthdate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String?> favorites;

  const RegisterResponseEntity({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.cellphone,
    required this.city,
    required this.uf,
    required this.birthdate,
    required this.createdAt,
    required this.updatedAt,
    required this.favorites,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        lastname,
        email,
        cellphone,
        city,
        uf,
        birthdate,
        createdAt,
        updatedAt,
        favorites,
      ];
}
