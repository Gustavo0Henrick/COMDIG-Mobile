import 'package:comdig/src/modules/auth/forgotPassword/domain/repositories/i_reset_password_repository.dart';
import 'package:comdig/src/modules/auth/forgotPassword/domain/repositories/i_send_forgot_password_code_repository.dart';
import 'package:comdig/src/modules/auth/forgotPassword/domain/usecases/reset_password_usecase.dart';
import 'package:comdig/src/modules/auth/forgotPassword/domain/usecases/send_forgot_password_code_usecase.dart';
import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/i_reset_password_datasource.dart';
import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/i_send_forgot_password_code_datasource.dart';
import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/reset_password_datasource.dart';
import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/send_forgot_password_code_datasource.dart';
import 'package:comdig/src/modules/auth/forgotPassword/infra/repositories/reset_password_repository.dart';
import 'package:comdig/src/modules/auth/forgotPassword/infra/repositories/send_forgot_password_code_repository.dart';
import 'package:comdig/src/modules/auth/forgotPassword/presenter/blocs/cubits/reset_password_cubit.dart';
import 'package:comdig/src/modules/auth/forgotPassword/presenter/blocs/cubits/send_forgot_password_code_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class ForgotPasswordServiceLocatorConfig
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
    sl.registerLazySingleton<ISendForgotPasswordCodeDatasource>(
        () => SendForgotPasswordCodeDatasource(requester: AppRequester()));
    sl.registerLazySingleton<IResetPasswordDatasource>(
        () => ResetPasswordDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<ISendForgotPasswordCodeRepository>(() =>
        SendForgotPasswordCodeRepository(
            datasource: sl<ISendForgotPasswordCodeDatasource>()));
    sl.registerLazySingleton<IResetPasswordRepository>(() =>
        ResetPasswordRepository(datasource: sl<IResetPasswordDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => SendForgotPasswordCodeUsecase(
        repository: sl<ISendForgotPasswordCodeRepository>()));
    sl.registerFactory(
        () => ResetPasswordUsecase(repository: sl<IResetPasswordRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
      () => SendForgotPasswordCodeCubit(
          usecase: sl<SendForgotPasswordCodeUsecase>()),
    );
    sl.registerFactory(
      () => ResetPasswordCubit(usecase: sl<ResetPasswordUsecase>()),
    );
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
