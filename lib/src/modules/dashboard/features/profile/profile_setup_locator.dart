import 'package:comdig/src/modules/dashboard/features/profile/editProfile/edit_user_profile_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/my_profile_service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class ProfileSetupLocator implements ServiceLocatorModuleConfig {
  final List<ServiceLocatorConfig> _features = [
    MyProfileServiceLocatorConfig(),
    EditUserProfileServiceLocatorConfig(),
  ];

  @override
  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }
  }
}
