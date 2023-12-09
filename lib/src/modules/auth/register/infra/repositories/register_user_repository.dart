import 'package:comdig/src/modules/auth/register/domain/entities/register_response_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/entities/user_data_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/repositories/i_register_user_repository.dart';
import 'package:comdig/src/modules/auth/register/infra/datasources/i_register_user_datasource.dart';
import 'package:comdig/src/modules/auth/register/infra/models/register_response_model.dart';
import 'package:comdig/src/modules/auth/register/infra/models/user_data_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class RegisterUserRepository implements IRegisterUserRepository {
  final IRegisterUserDatasource datasource;

  const RegisterUserRepository({required this.datasource});

  @override
  Future<Either<Failure, RegisterResponseEntity>> registerUser(
      UserDataEntity userDataEntity) async {
    try {
      UserDataModel userDataModel = UserDataModel(
        name: userDataEntity.name,
        lastname: userDataEntity.lastname,
        city: userDataEntity.city,
        uf: userDataEntity.uf,
        email: userDataEntity.email,
        cellphone: userDataEntity.cellphone,
        birthDate: userDataEntity.birthDate,
        password: userDataEntity.password,
      );

      RegisterResponseModel result =
          await datasource.registerUser(userDataModel);
      return Right<Failure, RegisterResponseEntity>(result);
    } on ServerException catch (e) {
      return Left<Failure, RegisterResponseEntity>(
          ServerFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, RegisterResponseEntity>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, RegisterResponseEntity>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, RegisterResponseEntity>(
          GeneralFailure(e.toString()));
    }
  }
}
