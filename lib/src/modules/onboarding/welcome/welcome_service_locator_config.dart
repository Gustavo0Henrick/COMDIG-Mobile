
// import 'package:comdig/src/shared/requester/app_requester_implementation.dart';
// import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
// import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

// class WelcomeServiceLocatorConfig
//     implements ServiceLocatorConfigInternals, ServiceLocatorConfig {
//   @override
//   Future<void> configure(ServiceLocatorWrapper sl) async {
//     registerManagerState(sl);
//     registerUseCases(sl);
//     registerRepositories(sl);
//     registerDataSources(sl);
//     registerServices(sl);
//   }

//   @override
//   void registerDataSources(ServiceLocatorWrapper sl) {
//     sl.registerLazySingleton<IWelcomeDatasource>(
//         () => WelcomeDatasource(requester: AppRequester()));
//   }

//   @override
//   void registerRepositories(ServiceLocatorWrapper sl) {
//     sl.registerLazySingleton<IWelcomeRepository>(() =>
//         WelcomeRepository(datasource: sl<IWelcomeDatasource>()));
//   }

//   @override
//   void registerUseCases(ServiceLocatorWrapper sl) {
//     sl.registerFactory(
//         () => WelcomeUsecase(repository: sl<IWelcomeRepository>()));
//   }

//   @override
//   void registerManagerState(ServiceLocatorWrapper sl) {
//     sl.registerFactory(() => WelcomeCubit(usecase: sl<WelcomeUsecase>()));
//   }

//   @override
//   void registerServices(ServiceLocatorWrapper sl) {}
// }
