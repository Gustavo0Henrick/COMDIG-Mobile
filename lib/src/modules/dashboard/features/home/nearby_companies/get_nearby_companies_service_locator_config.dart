import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/domain/repositories/i_get_nearby_companies_repositories.dart';
import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/domain/usecases/get_nearby_companies_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/infra/datasources/get_nearby_companies_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/infra/datasources/i_get_nearby_companies_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/infra/repositories/get_nearby_companies_repository.dart';
import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/presenter/blocs/cubits/get_nearby_companies_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class GetNearbyCompaniesServiceLocatorConfig
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
    sl.registerLazySingleton<IGetNearbyCompaniesDatasource>(
        () => GetNearbyCompaniesDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetNearbyCompaniesRepository>(() =>
        GetNearbyCompaniesRepository(
            datasource: sl<IGetNearbyCompaniesDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => GetNearbyCompaniesUsecase(
        repository: sl<IGetNearbyCompaniesRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() =>
        GetNearbyCompaniesCubit(usecase: sl<GetNearbyCompaniesUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
