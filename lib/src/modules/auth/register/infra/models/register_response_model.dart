import 'package:comdig/src/modules/auth/register/domain/entities/register_response_entity.dart';

class RegisterResponseModel extends RegisterResponseEntity {
  const RegisterResponseModel({
    required super.id,
    required super.name,
    required super.lastname,
    required super.email,
    required super.cellphone,
    required super.city,
    required super.uf,
    required super.birthdate,
    required super.createdAt,
    required super.updatedAt,
    required super.favorites,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'email': email,
      'cellphone': cellphone,
      'city': city,
      'uf': uf,
      'birthdate': birthdate.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'favorites': favorites,
    };
  }

  factory RegisterResponseModel.fromMap(Map<String, dynamic> map) {
    return RegisterResponseModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      lastname: map['lastname'] ?? '',
      email: map['email'] ?? '',
      cellphone: map['cellphone'] ?? '',
      city: map['city'] ?? '',
      uf: map['uf'] ?? '',
      birthdate: DateTime.parse(map['birthdate']),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      favorites:
          map['favorites'] != null ? List<String>.from(map['favorites']) : [],
    );
  }
}
