import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/repositories/i_get_event_repository.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/usecases/get_event_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/infra/datasources/get_event_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/infra/datasources/i_get_event_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/infra/repositories/get_event_repository.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/presenter/blocs/cubits/get_event_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class GetEventServiceLocatorConfig
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
    sl.registerLazySingleton<IGetEventDatasource>(
        () => GetEventDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetEventRepository>(
        () => GetEventRepository(datasource: sl<IGetEventDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetEventUsecase(repository: sl<IGetEventRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => GetEventCubit(usecase: sl<GetEventUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
