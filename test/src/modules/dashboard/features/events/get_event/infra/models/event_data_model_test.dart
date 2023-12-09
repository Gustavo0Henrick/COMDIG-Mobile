import 'package:comdig/src/modules/dashboard/features/events/get_event/infra/models/event_data_model.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/entities/favorite_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late EventDataModel eventDataModel;

  setUp(() {
    eventDataModel = const EventDataModel(
      title: "title",
      local: "local",
      address: "address",
      initDate: "initDate",
      endDate: "endDate",
      organizador: "organizador",
      instagramLink: "instagramLink",
      facebookLink: "facebookLink",
      twitterLink: "twitterLink",
      webLink: "webLink",
    );
  });

  test("Should be a subclass of EventDataEntity", () {
    expect(eventDataModel, isA<FavoriteEntity>());
  });

  test("Should return a valid EventDataModel from a Map", () {
    final Map<String, dynamic> map = {
      "title": "title",
      "local": "local",
      "address": "address",
      "initDate": "initDate",
      "endDate": "endDate",
      "organizador": "organizador",
      "instagramLink": "instagramLink",
      "facebookLink": "facebookLink",
      "twitterLink": "twitterLink",
      "webLink": "webLink",
    };

    final result = EventDataModel.fromMap(map);

    expect(result, isA<EventDataModel>());
  });

  test("Should return Map containing the EventDataModel data", () {
    final expectedMap = {
      "title": "title",
      "local": "local",
      "address": "address",
      "initDate": "initDate",
      "endDate": "endDate",
      "organizador": "organizador",
      "instagramLink": "instagramLink",
      "facebookLink": "facebookLink",
      "twitterLink": "twitterLink",
      "webLink": "webLink",
    };

    final result = eventDataModel.toMap();

    expect(result, expectedMap);
  });
}
