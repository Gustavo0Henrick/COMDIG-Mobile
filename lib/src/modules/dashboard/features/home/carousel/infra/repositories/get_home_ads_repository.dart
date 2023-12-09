import 'package:comdig/src/modules/dashboard/features/home/carousel/domain/entities/home_ad_entity.dart';
import 'package:comdig/src/modules/dashboard/features/home/carousel/domain/repositories/i_get_home_ads_repository.dart';
import 'package:comdig/src/modules/dashboard/features/home/carousel/infra/datasources/i_get_home_ads_datasource.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class GetHomeAdsRepository implements IGetHomeAdsRepository {
  final IGetHomeAdsDatasource datasource;

  const GetHomeAdsRepository({required this.datasource});

  @override
  Future<Either<Failure, List<HomeAdEntity>>> getHomeAds() async {
    try {
      List<HomeAdEntity> result = await datasource.getHomeAds();

      return Right<Failure, List<HomeAdEntity>>(result);
    } on ServerException catch (e) {
      return Left<Failure, List<HomeAdEntity>>(
          ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, List<HomeAdEntity>>(
          UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, List<HomeAdEntity>>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, List<HomeAdEntity>>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, List<HomeAdEntity>>(GeneralFailure(e.toString()));
    }
  }
}
