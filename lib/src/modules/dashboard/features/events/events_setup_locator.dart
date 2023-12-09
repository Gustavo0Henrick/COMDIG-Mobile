import 'package:comdig/src/modules/dashboard/features/events/get_event/get_event_service_locator_config.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/get_events_list_service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_config.dart';
import 'package:comdig/src/shared/service_locator/service_locator_wrapper.dart';

class EventsSetupLocator implements ServiceLocatorModuleConfig {
  final List<ServiceLocatorConfig> _features = [
    GetEventsListServiceLocatorConfig(),
    GetEventServiceLocatorConfig(),
  ];

  @override
  void setup(ServiceLocatorWrapper sl) {
    for (var serviceLocatorConfig in _features) {
      serviceLocatorConfig.configure(sl);
    }
  }
}
