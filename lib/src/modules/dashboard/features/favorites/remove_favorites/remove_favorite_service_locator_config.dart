import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/domain/repositories/i_remove_favorite_repository.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/infra/datasources/remove_favorite_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/infra/datasources/i_remove_favorite_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/infra/repositories/remove_favorite_repository.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/presenter/blocs/cubits/remove_favorite_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class RemoveFavoriteServiceLocatorConfig
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
    sl.registerLazySingleton<IRemoveFavoriteDatasource>(
        () => RemoveFavoriteDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IRemoveFavoriteRepository>(() =>
        RemoveFavoriteRepository(datasource: sl<IRemoveFavoriteDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() =>
        RemoveFavoriteUsecase(repository: sl<IRemoveFavoriteRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => RemoveFavoriteCubit(usecase: sl<RemoveFavoriteUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
