import 'package:comdig/src/modules/dashboard/features/events/get_event/infra/datasources/i_get_event_datasource.dart';
import 'package:comdig/src/shared/helpers/get_envents_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetEventDatasource implements IGetEventDatasource {
  final IAppRequester requester;

  const GetEventDatasource({required this.requester});

  @override
  Future getEvent(String url) async {
    return await requester.get(url: url, fromJson: (value) async => await GetEventsHelper.getEvent(value));
  }
}
