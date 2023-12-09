import 'package:comdig/src/modules/auth/login/domain/entities/login_response_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/entities/login_user_entity.dart';
import 'package:comdig/src/modules/auth/login/domain/repositories/i_login_user_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUserUsecase
    implements IUsecase<LoginResponseEntity, LoginUserEntity> {
  final ILoginUserRepository repository;

  const LoginUserUsecase({required this.repository});

  @override
  Future<Either<Failure, LoginResponseEntity>> call(
      LoginUserEntity loginUserEntity) async {
    return await repository.loginUser(loginUserEntity);
  }
}
