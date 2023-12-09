import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/domain/repositories/i_remove_favorite_repository.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/infra/datasources/i_remove_favorite_datasource.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class RemoveFavoriteRepository implements IRemoveFavoriteRepository {
  final IRemoveFavoriteDatasource datasource;

  const RemoveFavoriteRepository({required this.datasource});

  @override
  Future<Either<Failure, dynamic>> removeFavoriteById(String companyId) async {
    try {
      dynamic result = await datasource.removeFavoriteById(companyId);

      return Right<Failure, dynamic>(result);
    } on ServerException catch (e) {
      return Left<Failure, dynamic>(ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, dynamic>(UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, dynamic>(BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, dynamic>(RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, dynamic>(GeneralFailure(e.toString()));
    }
  }
}
