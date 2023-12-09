import 'package:comdig/src/modules/dashboard/features/company/get_company_data_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/company/get_reviews_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/company/post_review_service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class CompanySetupLocator implements ServiceLocatorModuleConfig {
  final List<ServiceLocatorConfig> _features = [
    GetCompanyDataServiceLocatorConfig(),
    GetReviewsServiceLocatorConfig(),
    PostReviewServiceLocatorConfig(),
  ];

  @override
  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }
  }
}
