import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_get_recommended_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/usecases/get_recommended_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/get_recommended_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_get_company_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/repositories/get_recommended_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/get_recommended_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class CompanyServiceLocatorConfig
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
    sl.registerLazySingleton<IGetRecommendedDatasource>(
        () => GetRecommendedDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetRecommendedRepository>(() =>
        GetRecommendedRepository(datasource: sl<IGetRecommendedDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() =>
        GetRecommendedUsecase(repository: sl<IGetRecommendedRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetRecommendedCubit(usecase: sl<GetRecommendedUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
