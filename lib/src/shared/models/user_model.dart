import 'dart:convert';

import 'package:comdig/src/shared/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.lastname,
    required super.city,
    required super.uf,
    required super.email,
    required super.cellphone,
    required super.birthDate,
    required super.createdAt,
    required super.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'city': city,
      'uf': uf,
      'email': email,
      'cellphone': cellphone,
      'birthDate': birthDate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      lastname: map['lastname'] ?? '',
      city: map['city'] ?? '',
      uf: map['uf'] ?? '',
      email: map['email'] ?? '',
      cellphone: map['cellphone'] ?? '',
      birthDate: map['birthDate'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
