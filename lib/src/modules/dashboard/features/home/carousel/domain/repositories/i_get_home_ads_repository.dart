import 'package:comdig/src/modules/dashboard/features/home/carousel/domain/entities/home_ad_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IGetHomeAdsRepository {
  Future<Either<Failure, List<HomeAdEntity>>> getHomeAds();
}
