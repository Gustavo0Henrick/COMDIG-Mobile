import 'package:equatable/equatable.dart';

class EditUserProfileEntity extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final String city;
  final String uf;
  final String birthDate;
  final String cellphone;

  const EditUserProfileEntity({
    required this.id,
    required this.name,
    required this.lastname,
    required this.city,
    required this.uf,
    required this.birthDate,
    required this.cellphone,
  });

  @override
  List<String> get props =>
      [id, name, lastname, city, uf, birthDate, cellphone];
}
