import 'package:comdig/src/modules/dashboard/features/events/get_events_list/domain/repositories/i_get_events_list_repository.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/domain/usecases/get_events_list_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/infra/datasources/get_events_list_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/infra/datasources/i_get_events_list_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/infra/repositories/get_events_list_repository.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/presenter/blocs/cubits/get_events_list_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class GetEventsListServiceLocatorConfig
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
    sl.registerLazySingleton<IGetEventsListDatasource>(
        () => GetEventsListDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetEventsListRepository>(() =>
        GetEventsListRepository(datasource: sl<IGetEventsListDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetEventsListUsecase(repository: sl<IGetEventsListRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetEventsListCubit(usecase: sl<GetEventsListUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
