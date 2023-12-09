import 'package:comdig/src/modules/dashboard/features/home/featured_companies/domain/repositories/i_get_featured_companies_repository.dart';
import 'package:comdig/src/modules/dashboard/features/home/featured_companies/domain/usecases/get_featured_companies_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/home/featured_companies/infra/datasources/get_featured_companies_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/home/featured_companies/infra/datasources/i_get_featured_companies_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/home/featured_companies/infra/repositories/get_featured_companies_repository.dart';
import 'package:comdig/src/modules/dashboard/features/home/featured_companies/presenter/blocs/cubits/get_featured_companies_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class GetFeaturedCompaniesServiceLocatorConfig
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
    sl.registerLazySingleton<IGetFeaturedCompaniesDatasource>(
        () => GetFeaturedCompaniesDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetFeaturedCompaniesRepository>(() =>
        GetFeaturedCompaniesRepository(
            datasource: sl<IGetFeaturedCompaniesDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => GetFeaturedCompaniesUsecase(
        repository: sl<IGetFeaturedCompaniesRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() =>
        GetFeaturedCompaniesCubit(usecase: sl<GetFeaturedCompaniesUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
