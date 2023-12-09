import 'package:equatable/equatable.dart';

class TokenResponseEntity extends Equatable {
  final String accessToken;
  final String refreshToken;

  const TokenResponseEntity(
      {required this.accessToken, required this.refreshToken});

  @override
  List<String?> get props => [
        accessToken,
        refreshToken,
      ];
}
