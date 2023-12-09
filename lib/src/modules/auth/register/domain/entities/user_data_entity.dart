import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable {
  final String name;
  final String lastname;
  final String city;
  final String uf;
  final String email;
  final String cellphone;
  final String birthDate;
  final String password;

  const UserDataEntity({
    required this.name,
    required this.lastname,
    required this.city,
    required this.uf,
    required this.email,
    required this.cellphone,
    required this.birthDate,
    required this.password,
  });

  @override
  List<String> get props => [
        name,
        lastname,
        city,
        uf,
        email,
        cellphone,
        birthDate,
        password,
      ];
}
