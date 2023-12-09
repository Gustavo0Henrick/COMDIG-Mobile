import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/entities/favorite_entity.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/repositories/i_get_favorites_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetFavoritesUsecase implements IUsecase<List<FavoriteEntity>, String> {
  final IGetFavoritesRepository repository;

  const GetFavoritesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<FavoriteEntity>>> call(String userId) async {
    return await repository.getFavorites(userId);
  }
}
