import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/entities/event_data_entity.dart';
import 'package:comdig/src/shared/entities/event_entity.dart';
import 'package:comdig/src/shared/helpers/get_envents_helper.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Should be return a List<EventEntity> from a Response Body in String",
      () async {
    String query = "Presidente Prudente";

    final eventouURL = Uri.parse("https://eventou.com.br/explore?q=$query");
    final response = await http.get(eventouURL);
    final body = response.body;

    var result = await GetEventsHelper.getEventsList(body);
    expect(result, isA<List<EventEntity>>());
  });

  test("Should be return a EventDataEntity from a Response Body in String",
      () async {
    String event = "TOGETHER__1844";
    final eventouURI = Uri.parse("https://eventou.com.br/event/$event");
    final response = await http.get(eventouURI);
    final body = response.body;

    var result = await GetEventsHelper.getEvent(body);
    expect(result, isA<EventDataEntity>());
  });
}
