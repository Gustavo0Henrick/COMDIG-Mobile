import 'package:comdig/src/modules/auth/login/domain/entities/token_response_entity.dart';

class TokenResponseModel extends TokenResponseEntity {
  const TokenResponseModel(
      {required super.accessToken, required super.refreshToken});

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory TokenResponseModel.fromMap(Map<String, dynamic> map) {
    return TokenResponseModel(
      accessToken: map['access_token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }
}
