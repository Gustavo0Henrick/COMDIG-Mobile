import 'package:comdig/src/modules/auth/login/domain/entities/login_response_entity.dart';
import 'package:comdig/src/modules/auth/login/infra/models/token_response_model.dart';

class LoginResponseModel extends LoginResponseEntity {
  final TokenResponseModel tokenModel;
  const LoginResponseModel({
    required super.id,
    required super.name,
    required super.email,
    required super.cellphone,
    required super.city,
    required super.uf,
    required super.birthdate,
    required super.createdAt,
    required super.updatedAt,
    required super.favorites,
    required super.lastname,
    required this.tokenModel,
  }) : super(token: tokenModel);

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
      'token': tokenModel.toMap(),
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
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
      favorites: List<String?>.from(map['favorites'] ?? []),
      tokenModel: TokenResponseModel.fromMap(map['token']),
    );
  }
}
