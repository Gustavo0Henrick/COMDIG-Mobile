import 'package:comdig/src/modules/auth/login/domain/entities/login_response_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/entities/login_user_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/repositories/i_login_user_repository.dart';
import 'package:comdig/src/modules/auth/login/infra/datasources/i_login_user_datasource.dart';
import 'package:comdig/src/modules/auth/login/infra/models/login_response_model.dart';
import 'package:comdig/src/modules/auth/login/infra/models/login_user_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class LoginUserRepository implements ILoginUserRepository {
  final ILoginUserDatasource datasource;

  const LoginUserRepository({required this.datasource});

  @override
  Future<Either<Failure, LoginResponseEntity>> loginUser(
      LoginUserEntity loginUserEntity) async {
    try {
      LoginUserModel loginUserModel = LoginUserModel(
        email: loginUserEntity.email,
        password: loginUserEntity.password,
      );

      LoginResponseModel result = await datasource.loginUser(loginUserModel);
      return Right<Failure, LoginResponseEntity>(result);
    } on ServerException catch (e) {
      return Left<Failure, LoginResponseEntity>(
          ServerFailure(e.message.toString()));
    } on InvalidCredentialsException catch (e) {
      return Left<Failure, LoginResponseEntity>(
          InvalidCredentialsFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, LoginResponseEntity>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, LoginResponseEntity>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, LoginResponseEntity>(GeneralFailure(e.toString()));
    }
  }
}
