import 'package:comdig/src/modules/auth/register/domain/repositories/i_register_user_repository.dart';
import 'package:comdig/src/modules/auth/register/domain/usecases/register_user_usecase.dart';
import 'package:comdig/src/modules/auth/register/infra/datasources/i_register_user_datasource.dart';
import 'package:comdig/src/modules/auth/register/infra/datasources/register_user_datasource.dart';
import 'package:comdig/src/modules/auth/register/infra/repositories/register_user_repository.dart';
import 'package:comdig/src/modules/auth/register/presenter/blocs/cubits/register_user_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class RegisterUserServiceLocatorConfig
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
    sl.registerLazySingleton<IRegisterUserDatasource>(
        () => RegisterUserDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IRegisterUserRepository>(() =>
        RegisterUserRepository(datasource: sl<IRegisterUserDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => RegisterUserUsecase(repository: sl<IRegisterUserRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => RegisterUserCubit(usecase: sl<RegisterUserUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
