import 'dart:convert';

import 'package:comdig/src/modules/auth/login/domain/entities/login_user_entity.dart';

class LoginUserModel extends LoginUserEntity {
  const LoginUserModel({required super.email, required super.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginUserModel.fromMap(Map<String, dynamic> map) {
    return LoginUserModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserModel.fromJson(String source) =>
      LoginUserModel.fromMap(json.decode(source));
}
