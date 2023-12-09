import 'package:comdig/src/modules/auth/forgotPassword/forgot_password_service_locator_config.dart';
import 'package:comdig/src/modules/auth/login/login_user_service_locator_config.dart';
import 'package:comdig/src/modules/auth/register/register_user_service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class AuthSetupLocator implements ServiceLocatorModuleConfig {
  final List<ServiceLocatorConfig> _features = [
    RegisterUserServiceLocatorConfig(),
    LoginUserServiceLocatorConfig(),
    ForgotPasswordServiceLocatorConfig(),
  ];

  @override
  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }
  }
}
