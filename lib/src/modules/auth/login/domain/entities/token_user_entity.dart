import 'package:equatable/equatable.dart';

class TokenUserEntity extends Equatable {
  final String accessToken;
  final String refreshToken;

 const TokenUserEntity({required this.accessToken, required this.refreshToken});
 
  @override
  List<String> get props => [accessToken, refreshToken];
}
