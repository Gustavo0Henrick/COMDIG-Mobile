import 'dart:convert';

import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/entities/edit_user_profile_entity.dart';

class EditUserProfileModel extends EditUserProfileEntity {
  const EditUserProfileModel({
    required super.id,
    required super.name,
    required super.lastname,
    required super.city,
    required super.uf,
    required super.birthDate,
    required super.cellphone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'city': city,
      'uf': uf,
      'birthdate': birthDate,
      'cellphone': cellphone,
    };
  }

  factory EditUserProfileModel.fromMap(Map<String, dynamic> map) {
    return EditUserProfileModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      lastname: map['lastname'] ?? '',
      city: map['city'] ?? '',
      uf: map['uf'] ?? '',
      birthDate: map['birthdate'] ?? '',
      cellphone: map['cellphone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EditUserProfileModel.fromJson(String source) =>
      EditUserProfileModel.fromMap(json.decode(source));
}
