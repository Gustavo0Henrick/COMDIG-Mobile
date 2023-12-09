import 'package:comdig/src/modules/auth/auth_setup_locator.dart';
import 'package:comdig/src/modules/dashboard/features/company/company_setup_locator.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/favorite_setup_locator.dart';
import 'package:comdig/src/modules/dashboard/features/home/home_setup_locator.dart';
import 'package:comdig/src/modules/dashboard/features/events/events_setup_locator.dart';
import 'package:comdig/src/modules/dashboard/features/profile/profile_setup_locator.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_setup_locator.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

late ServiceLocatorWrapper globalSL;

class AppLocator {
  static void setupLocator(ServiceLocatorWrapper serviceLocator) {
    globalSL = serviceLocator;
    AuthSetupLocator().setup(globalSL);
    ProfileSetupLocator().setup(globalSL);
    FavoriteSetupLocator().setup(globalSL);
    SearchSetupLocator().setup(globalSL);
    HomeSetupLocator().setup(globalSL);
    EventsSetupLocator().setup(globalSL);
    CompanySetupLocator().setup(globalSL);
  }
}
