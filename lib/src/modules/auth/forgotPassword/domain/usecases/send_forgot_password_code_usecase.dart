import 'package:comdig/src/modules/auth/forgotPassword/domain/repositories/i_send_forgot_password_code_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class SendForgotPasswordCodeUsecase implements IUsecase<bool, String> {
  final ISendForgotPasswordCodeRepository repository;

  const SendForgotPasswordCodeUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(String email) async {
    return await repository.sendForgotPasswordCode(email);
  }
}
