import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_get_categories_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/usecases/get_categories_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/get_categories_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_get_categories_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/repositories/get_categories_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/get_categories_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class CategoriesServiceLocatorConfig
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
    sl.registerLazySingleton<IGetCategoriesDatasource>(
        () => GetCategoriesDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetCategoriesRepository>(() =>
        GetCategoriesRepository(datasource: sl<IGetCategoriesDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetCategoriesUsecase(repository: sl<IGetCategoriesRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetCategoriesCubit(usecase: sl<GetCategoriesUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
