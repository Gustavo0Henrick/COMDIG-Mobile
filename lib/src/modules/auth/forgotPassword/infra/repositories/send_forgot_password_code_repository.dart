import 'package:comdig/src/modules/auth/forgotPassword/domain/repositories/i_send_forgot_password_code_repository.dart';
import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/i_send_forgot_password_code_datasource.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class SendForgotPasswordCodeRepository
    implements ISendForgotPasswordCodeRepository {
  final ISendForgotPasswordCodeDatasource datasource;

  const SendForgotPasswordCodeRepository({required this.datasource});

  @override
  Future<Either<Failure, bool>> sendForgotPasswordCode(String email) async {
    try {
      bool result = await datasource.sendForgotPasswordCode(email);
      return Right<Failure, bool>(result);
    } on ServerException catch (e) {
      return Left<Failure, bool>(ServerFailure(e.message.toString()));
    } on InvalidCredentialsException catch (e) {
      return Left<Failure, bool>(
          InvalidCredentialsFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, bool>(BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, bool>(RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, bool>(GeneralFailure(e.toString()));
    }
  }
}
