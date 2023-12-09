import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_get_companies_by_category_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/usecases/get_companies_by_category_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/get_companies_by_category_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_get_companies_by_category_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/repositories/get_companies_by_category_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/get_companies_by_category_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class GetCompaniesByCategoryServiceLocatorConfig
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
    sl.registerLazySingleton<IGetCompaniesByCategoryDatasource>(
        () => GetCompaniesByCategoryDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetCompaniesByCategoryRepository>(() =>
        GetCompaniesByCategoryRepository(
            datasource: sl<IGetCompaniesByCategoryDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => GetCompaniesByCategoryUsecase(
        repository: sl<IGetCompaniesByCategoryRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => GetCompaniesByCategoryCubit(
        usecase: sl<GetCompaniesByCategoryUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
