import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_get_company_data_repository.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/usecases/get_company_data_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/get_company_data_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_get_company_data_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/repositories/get_company_data_repository.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/blocs/cubits/get_company_data_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class GetCompanyDataServiceLocatorConfig
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
    sl.registerLazySingleton<IGetCompanyDataDatasource>(
        () => GetCompanyDataDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetCompanyDataRepository>(() =>
        GetCompanyDataRepository(datasource: sl<IGetCompanyDataDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(() =>
        GetCompanyDataUsecase(repository: sl<IGetCompanyDataRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetCompanyDataCubit(usecase: sl<GetCompanyDataUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
