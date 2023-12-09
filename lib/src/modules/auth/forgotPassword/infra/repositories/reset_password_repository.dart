import 'package:comdig/src/modules/auth/forgotPassword/domain/repositories/i_reset_password_repository.dart';
import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/i_reset_password_datasource.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordRepository implements IResetPasswordRepository {
  final IResetPasswordDatasource datasource;

  const ResetPasswordRepository({required this.datasource});

  @override
  Future<Either<Failure, bool>> resetPassword(
      ({String code, String email, String password}) resetData) async {
    try {
      bool result = await datasource.resetPassword(resetData);
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
