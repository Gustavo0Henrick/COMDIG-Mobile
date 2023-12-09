import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/entities/favorite_entity.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/repositories/i_get_favorites_repository.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/datasources/i_get_favorites_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/models/list_favorites_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class GetFavoritesRepository implements IGetFavoritesRepository {
  final IGetFavoritesDatasource datasource;

  const GetFavoritesRepository({required this.datasource});

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites(String userId) async {
    try {
      ListFavoritesModel result = await datasource.getFavorites(userId);

      return Right<Failure, List<FavoriteEntity>>(result.listFavoriteModels);
    } on ServerException catch (e) {
      return Left<Failure, List<FavoriteEntity>>(
          ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, List<FavoriteEntity>>(
          UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, List<FavoriteEntity>>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, List<FavoriteEntity>>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, List<FavoriteEntity>>(GeneralFailure(e.toString()));
    }
  }
}
