import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/list_favorites_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/add_favorite_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/remove_favorite_service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class FavoriteSetupLocator implements ServiceLocatorModuleConfig {
  final List<ServiceLocatorConfig> _features = [
    ListFavoritesServiceLocatorConfig(),
    AddFavoriteServiceLocatorConfig(),
    RemoveFavoriteServiceLocatorConfig(),
  ];

  @override
  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }
  }
}
