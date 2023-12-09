import 'package:comdig/src/modules/dashboard/features/search/search_item/categories_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/company_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/get_companies_by_category_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/search_service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class SearchSetupLocator implements ServiceLocatorModuleConfig {
  final List<ServiceLocatorConfig> _features = [
    SearchServiceLocatorConfig(),
    CategoriesServiceLocatorConfig(),
    CompanyServiceLocatorConfig(),
    GetCompaniesByCategoryServiceLocatorConfig(),
  ];

  @override
  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }
  }
}
