import 'dart:convert';

import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/entities/my_profile_entity.dart';

class MyProfileModel extends MyProfileEntity {
  const MyProfileModel({
    required super.id,
    required super.name,
    required super.lastname,
    required super.email,
    required super.birthDate,
    required super.cellphone,
    required super.city,
    required super.uf,
    required super.createdAt,
    required super.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'email': email,
      'birthdate': birthDate,
      'cellphone': cellphone,
      'city': city,
      'uf': uf,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory MyProfileModel.fromMap(Map<String, dynamic> map) {
    return MyProfileModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      lastname: map['lastname'] ?? '',
      email: map['email'] ?? '',
      birthDate: map['birthdate'] ?? '',
      cellphone: map['cellphone'] ?? '',
      city: map['city'] ?? '',
      uf: map['uf'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MyProfileModel.fromJson(String source) =>
      MyProfileModel.fromMap(json.decode(source));
}
