import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_get_reviews_repositorie.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/usecases/get_reviews_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/get_reviews_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_get_reviews_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/repositories/get_reviews_repository.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/blocs/cubits/get_reviews_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class GetReviewsServiceLocatorConfig
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
    sl.registerLazySingleton<IGetReviewsDatasource>(
        () => GetReviewsDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IGetReviewsRepository>(
        () => GetReviewsRepository(datasource: sl<IGetReviewsDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => GetReviewsUsecase(repository: sl<IGetReviewsRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => GetReviewsCubit(usecase: sl<GetReviewsUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}
