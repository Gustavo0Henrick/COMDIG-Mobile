import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/domain/repositories/i_add_favorite_repository.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/domain/usecases/add_favorite_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/infra/datasources/add_favorite_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/infra/datasources/i_add_favorite_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/infra/repositories/add_favorite_repository.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/presenter/blocs/cubits/add_favorite_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class AddFavoriteServiceLocatorConfig
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
    sl.registerLazySingleton<IAddFavoriteDatasource>(
        () => AddFavoriteDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IAddFavoriteRepository>(
        () => AddFavoriteRepository(datasource: sl<IAddFavoriteDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => AddFavoriteUsecase(repository: sl<IAddFavoriteRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => AddFavoriteCubit(usecase: sl<AddFavoriteUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
