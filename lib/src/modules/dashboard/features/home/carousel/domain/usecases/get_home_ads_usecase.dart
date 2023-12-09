import 'package:comdig/src/modules/dashboard/features/home/carousel/domain/entities/home_ad_entity.dart';
import 'package:comdig/src/modules/dashboard/features/home/carousel/domain/repositories/i_get_home_ads_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetHomeAdsUsecase implements IUsecase<List<HomeAdEntity>, NoParams> {
  final IGetHomeAdsRepository repository;

  const GetHomeAdsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<HomeAdEntity>>> call(NoParams params) async {
    return await repository.getHomeAds();
  }
}
