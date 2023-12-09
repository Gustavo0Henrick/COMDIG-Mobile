import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/domain/repositories/i_add_favorite_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class AddFavoriteUsecase implements IUsecase<dynamic, String> {
  final IAddFavoriteRepository repository;

  const AddFavoriteUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(String companyId) async {
    return await repository.addFavoriteById(companyId);
  }
}
