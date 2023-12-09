import 'package:comdig/src/shared/service_locator/app_locator.dart';
import 'package:comdig/src/shared/service_locator/get_it_wrapper.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;
final GetIt root = GetIt.asNewInstance();
final ServiceLocatorWrapper slWrapper = GetItWrapper(sl);

void setupLocator() {
  AppLocator.setupLocator(slWrapper);
}



