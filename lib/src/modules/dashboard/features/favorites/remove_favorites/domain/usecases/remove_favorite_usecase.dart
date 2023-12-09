import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/domain/repositories/i_remove_favorite_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class RemoveFavoriteUsecase implements IUsecase<dynamic, String> {
  final IRemoveFavoriteRepository repository;

  const RemoveFavoriteUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(String companyId) async {
    return await repository.removeFavoriteById(companyId);
  }
}
