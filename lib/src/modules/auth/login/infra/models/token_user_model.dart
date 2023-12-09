import 'dart:convert';

import 'package:comdig/src/modules/auth/login/domain/entities/token_user_entity.dart';

class TokenUserModel extends TokenUserEntity {
  const TokenUserModel({
    required super.accessToken,
    required super.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory TokenUserModel.fromMap(Map<String, dynamic> map) {
    return TokenUserModel(
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenUserModel.fromJson(String source) =>
      TokenUserModel.fromMap(json.decode(source));
}
