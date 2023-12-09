import 'package:comdig/src/modules/dashboard/features/home/carousel/get_home_ads_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/home/featured_companies/get_featured_companies_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/get_nearby_companies_service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class HomeSetupLocator implements ServiceLocatorModuleConfig {
  final List<ServiceLocatorConfig> _features = [
    GetFeaturedCompaniesServiceLocatorConfig(),
    GetHomeAdsServiceLocatorConfig(),
    GetNearbyCompaniesServiceLocatorConfig(),
  ];

  @override
  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }
  }
}
