import 'package:comdig/src/modules/auth/login/domain/entities/token_response_entity.dart';
import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
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
  final TokenResponseEntity token;

  const LoginResponseEntity({
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
    required this.token,
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
        token,
      ];
}
