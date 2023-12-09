import 'package:comdig/src/modules/dashboard/features/events/get_events_list/infra/datasources/i_get_events_list_datasource.dart';
import 'package:comdig/src/shared/helpers/get_envents_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetEventsListDatasource implements IGetEventsListDatasource {
  final IAppRequester requester;

  const GetEventsListDatasource({required this.requester});

  @override
  Future getEventsList(String query) async {
    return await requester.get(
      url: "https://eventou.com.br/explore?q=$query",
      fromJson: (value) async => await GetEventsHelper.getEventsList(value),
    );
  }
}
