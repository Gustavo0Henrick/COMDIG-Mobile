import 'package:comdig/src/modules/auth/login/domain/repositories/i_get_my_self_repository.dart';
import 'package:comdig/src/shared/entities/user_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetMySelfUsecase implements IUsecase<UserEntity, String> {
  final IGetMySelfRepository repository;

  const GetMySelfUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(String params) async {
    return await repository.getMySelf(params);
  }
}
