import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_search_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/usecases/search_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_search_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/search_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/repositories/search_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/search_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class SearchServiceLocatorConfig
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
    sl.registerLazySingleton<ISearchDatasource>(
        () => SearchDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<ISearchRepository>(
        () => SearchRepository(datasource: sl<ISearchDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => SearchUsecase(repository: sl<ISearchRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => SearchCubit(usecase: sl<SearchUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
