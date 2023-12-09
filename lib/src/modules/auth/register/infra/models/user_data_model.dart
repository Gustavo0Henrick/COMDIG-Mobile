import 'dart:convert';

import 'package:comdig/src/modules/auth/register/domain/entities/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  const UserDataModel({
    required super.name,
    required super.lastname,
    required super.city,
    required super.uf,
    required super.email,
    required super.cellphone,
    required super.birthDate,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastname': lastname,
      'city': city,
      'uf': uf,
      'email': email,
      'cellphone': cellphone,
      'birthdate': birthDate,
      'password': password,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      name: map['name'] ?? '',
      lastname: map['lastname'] ?? '',
      city: map['city'] ?? '',
      uf: map['uf'] ?? '',
      email: map['email'] ?? '',
      cellphone: map['cellphone'] ?? '',
      birthDate: map['birthDate'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source));
}
