import 'package:equatable/equatable.dart';

class GeneralException extends Equatable implements Exception {
  final String message;
  final int? statusCode;

  const GeneralException({required this.message, this.statusCode});
  @override
  List<Object?> get props => [message, statusCode];
}

class InvalidCredentialsException extends Equatable implements Exception {
  final String message ;
  final int statusCode;

  const InvalidCredentialsException(
      {required this.message, required this.statusCode});

  @override
  List<Object> get props => [message, statusCode];
}

class ServerException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const ServerException({required this.message, required this.statusCode});
  @override
  List<Object> get props => [message, statusCode];
}

class BadRequestException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const BadRequestException({required this.message, required this.statusCode});

  @override
  List<Object> get props => [message, statusCode];
}

class UnauthorizedException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const UnauthorizedException(
      {required this.message, required this.statusCode});

  @override
  List<Object> get props => [message, statusCode];
}

class RequestException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const RequestException({required this.message, required this.statusCode});

  @override
  List<Object> get props => [message, statusCode];
}
