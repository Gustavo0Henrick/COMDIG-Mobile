import 'package:comdig/src/modules/auth/login/domain/repositories/i_get_my_self_repository.dart';
import 'package:comdig/src/modules/auth/login/domain/repositories/i_login_user_repository.dart';
import 'package:comdig/src/modules/auth/login/domain/usecases/get_my_self_usecase.dart';
import 'package:comdig/src/modules/auth/login/domain/usecases/login_user_usecase.dart';
import 'package:comdig/src/modules/auth/login/infra/datasources/get_my_self_datasource.dart';
import 'package:comdig/src/modules/auth/login/infra/datasources/i_get_my_self_datasource.dart';
import 'package:comdig/src/modules/auth/login/infra/datasources/i_login_user_datasource.dart';
import 'package:comdig/src/modules/auth/login/infra/datasources/login_user_datasource.dart';
import 'package:comdig/src/modules/auth/login/infra/repositories/get_my_self_repository.dart';
import 'package:comdig/src/modules/auth/login/infra/repositories/login_user_repository.dart';
import 'package:comdig/src/modules/auth/login/presenter/blocs/cubits/get_my_self_cubit.dart';
import 'package:comdig/src/modules/auth/login/presenter/blocs/cubits/login_user_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';

class LoginUserServiceLocatorConfig
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
    sl.registerLazySingleton<ILoginUserDatasource>(
        () => LoginUserDatasource(requester: AppRequester()));
    sl.registerLazySingleton<IGetMySelfDatasource>(
        () => GetMySelfDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<ILoginUserRepository>(
        () => LoginUserRepository(datasource: sl<ILoginUserDatasource>()));
    sl.registerLazySingleton<IGetMySelfRepository>(
        () => GetMySelfRepository(datasource: sl<IGetMySelfDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => LoginUserUsecase(repository: sl<ILoginUserRepository>()));
    sl.registerFactory(
        () => GetMySelfUsecase(repository: sl<IGetMySelfRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
      () => LoginUserCubit(
        usecase: sl<LoginUserUsecase>(),
        storage: sl<ISecureStorageManager>(),
      ),
    );
    sl.registerFactory(
      () => GetMySelfCubit(
        usecase: sl<GetMySelfUsecase>(),
        storage: sl<ISecureStorageManager>(),
      ),
    );
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<ISecureStorageManager>(
        () => SecureStorageManager());
  }
}
