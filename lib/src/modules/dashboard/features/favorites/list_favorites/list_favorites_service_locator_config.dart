import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/repositories/i_get_favorites_repository.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/datasources/get_favorites_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/datasources/i_get_favorites_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/repositories/get_favorites_repository.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/presenter/blocs/cubits/get_favorites_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class ListFavoritesServiceLocatorConfig
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
    sl.registerLazySingleton<IGetFavoritesDatasource>(
        () => GetFavoritesDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetFavoritesRepository>(() =>
        GetFavoritesRepository(datasource: sl<IGetFavoritesDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetFavoritesUsecase(repository: sl<IGetFavoritesRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetFavoritesCubit(usecase: sl<GetFavoritesUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
