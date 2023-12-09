import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/repositories/i_edit_user_profile_repository.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/usecases/edit_user_profile_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/datasources/edit_user_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/datasources/i_edit_user_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/repositories/edit_user_profile_repository.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/presenter/blocs/cubits/edit_user_profile_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class EditUserProfileServiceLocatorConfig
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
    sl.registerLazySingleton<IEditUserProfileDatasource>(
        () => EditUserProfileDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IEditUserProfileRepository>(() =>
        EditUserProfileRepository(
            datasource: sl<IEditUserProfileDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() =>
        EditUserProfileUsecase(repository: sl<IEditUserProfileRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => EditUserProfileCubit(usecase: sl<EditUserProfileUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
