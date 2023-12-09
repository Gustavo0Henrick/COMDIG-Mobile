import 'package:comdig/src/modules/auth/login/domain/repositories/i_get_my_self_repository.dart';
import 'package:comdig/src/modules/auth/login/infra/datasources/i_get_my_self_datasource.dart';
import 'package:comdig/src/shared/entities/user_entity.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart'; 
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/models/user_model.dart';
import 'package:dartz/dartz.dart';

class GetMySelfRepository implements IGetMySelfRepository {
  final IGetMySelfDatasource datasource;

  const GetMySelfRepository({required this.datasource});

  @override
  Future<Either<Failure, UserEntity>> getMySelf(String id) async {
    try {
      UserModel result = await datasource.getMySelf(id);
      return Right<Failure, UserEntity>(result);
    } on ServerException catch (e) {
      return Left<Failure, UserEntity>(ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, UserEntity>(
          UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, UserEntity>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, UserEntity>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, UserEntity>(GeneralFailure(e.toString()));
    }
  }
}
