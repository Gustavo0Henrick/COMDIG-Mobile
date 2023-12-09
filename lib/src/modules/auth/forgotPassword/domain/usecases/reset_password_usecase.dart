import 'package:comdig/src/modules/auth/forgotPassword/domain/repositories/i_reset_password_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUsecase
    implements IUsecase<bool, ({String code, String email, String password})> {
  final IResetPasswordRepository repository;

  const ResetPasswordUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(
      ({String code, String email, String password}) params) async {
    return await repository.resetPassword(params);
  }
}
