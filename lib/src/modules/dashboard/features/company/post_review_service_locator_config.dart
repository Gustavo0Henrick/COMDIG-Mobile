
import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_post_review_repository.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/usecases/post_review_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_post_review_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/post_review_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/repositories/post_review_repository.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/blocs/cubits/post_review_cubit.dart';
import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class PostReviewServiceLocatorConfig
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
    sl.registerLazySingleton<IPostReviewDatasource>(
        () => PostReviewDatasource(requester: AppRequester()));
  }

  @override
  void registerRepositories(ServiceLocatorWrapper sl) {
    sl.registerLazySingleton<IPostReviewRepository>(
        () => PostReviewRepository(datasource: sl<IPostReviewDatasource>()));
  }

  @override
  void registerUseCases(ServiceLocatorWrapper sl) {
    sl.registerFactory(
        () => PostReviewUsecase(repository: sl<IPostReviewRepository>()));
  }

  @override
  void registerManagerState(ServiceLocatorWrapper sl) {
    sl.registerFactory(() => PostReviewCubit(usecase: sl<PostReviewUsecase>()));
  }

  @override
  void registerServices(ServiceLocatorWrapper sl) {}
}