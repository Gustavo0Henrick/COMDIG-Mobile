import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/repositories/i_get_my_profile_repository.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/usecases/get_my_profile_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/datasources/get_my_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/datasources/i_get_my_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/repositories/get_my_profile_repository.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/presenter/blocs/cubits/get_my_profile_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class MyProfileServiceLocatorConfig
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
    sl.registerLazySingleton<IGetMyProfileDatasource>(
        () => GetMyProfileDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetMyProfileRepository>(() =>
        GetMyProfileRepository(datasource: sl<IGetMyProfileDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetMyProfileUsecase(repository: sl<IGetMyProfileRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetMyProfileCubit(usecase: sl<GetMyProfileUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
