import 'package:comdig/src/modules/auth/register/domain/entities/register_response_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/entities/user_data_entity.dart';
import 'package:comdig/src/modules/auth/register/domain/repositories/i_register_user_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class RegisterUserUsecase implements IUsecase<RegisterResponseEntity, UserDataEntity> {
  final IRegisterUserRepository repository;

  RegisterUserUsecase({required this.repository});

  @override
  Future<Either<Failure, RegisterResponseEntity>> call(UserDataEntity userDataEntity) async {
    return await repository.registerUser(userDataEntity);
  }
}
