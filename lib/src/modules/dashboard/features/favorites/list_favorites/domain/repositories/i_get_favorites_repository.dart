import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/entities/favorite_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IGetFavoritesRepository {
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites(String userId);
}
