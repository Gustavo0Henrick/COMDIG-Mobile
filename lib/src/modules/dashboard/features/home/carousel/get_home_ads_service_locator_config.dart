
import 'package:comdig/src/modules/dashboard/features/home/carousel/domain/repositories/i_get_home_ads_repository.dart';
import 'package:comdig/src/modules/dashboard/features/home/carousel/domain/usecases/get_home_ads_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/home/carousel/infra/datasources/get_home_ads_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/home/carousel/infra/datasources/i_get_home_ads_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/home/carousel/infra/repositories/get_home_ads_repository.dart';
import 'package:comdig/src/modules/dashboard/features/home/carousel/presenter/blocs/cubits/get_home_ads_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class GetHomeAdsServiceLocatorConfig
    implements ServiceLocatorConfigInternals, ServiceLocatorConfig {
  @override
  Future<void> configure(ServiceLocatorWrapper sl) async {
    registerManagerState(sl);
    registerUseCases(sl);
    registerRepositories(sl);
    registerDataSources(sl);
    registerServices(sl);
  }

  @override
  void registerDataSources(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetHomeAdsDatasource>(
        () => GetHomeAdsDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetHomeAdsRepository>(
        () => GetHomeAdsRepository(datasource: sl<IGetHomeAdsDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetHomeAdsUsecase(repository: sl<IGetHomeAdsRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => GetHomeAdsCubit(usecase: sl<GetHomeAdsUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
