import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/entities/event_data_entity.dart';
import 'package:comdig/src/shared/entities/event_entity.dart';
import 'package:html/dom.dart' as dom;

abstract class GetEventsHelper {
  static Future<List<EventEntity>> getEventsList(String body) async {
    String title = "";
    String local = "";
    String date = "";
    String href = "";

    dom.Document html = dom.Document.html(body);

    final cards = html.getElementsByClassName('card').map((e) {
      href = 'https://eventou.com.br${e.attributes["href"] ?? ""}';
      return e;
    });

    List<EventEntity> eventList = [];

    cards.map((e) {
      title = e.getElementsByTagName("h2").first.text;
      Iterable ps = e.getElementsByTagName("p");
      for (var element in ps) {
        if (element == ps.first) {
          local = element.text;
        } else {
          date = element.text;
        }
      }
      EventEntity event =
          EventEntity(title: title, local: local, date: date, href: href);
      eventList.add(event);
      return e.text;
    }).toList();

    return eventList;
  }

  static Future<EventDataEntity> getEvent(String body) async {
    String title = "";
    String local = "";
    String address = "";
    String initDate = "";
    String endDate = "";
    String organizador = "";

    String facebookLink = "";
    String instagramLink = "";
    String twitterLink = "";
    String webLink = "";

    dom.Document html = dom.Document.html(body);

    final info = html.getElementsByClassName('event-section-wrapper');
    List res;

    info.map((e) {
      res = e.getElementsByClassName("event-section");

      for (int i = 0; i < 5; i++) {
        if (i == 0) {
          title = e.getElementsByTagName("h1").first.text;
          local = e.getElementsByTagName("p").first.text;
        } else if (i == 1) {
          List divs = e.getElementsByClassName("event-information");
          for (int j = 0; j < 4; j++) {
            if (j == 0) {
              address = divs[j].getElementsByTagName("p").first.text;
            } else if (j == 1) {
              try {
                List<String> dates =
                    divs[j].getElementsByTagName("p").first.text.split("até ");

                initDate = dates[0];

                endDate = dates[1];
              } catch (e) {
                try {
                  initDate = divs[j].getElementsByTagName("p").first.text;
                  endDate = "Não informado";
                } catch (e) {
                  initDate = "Não informado";
                  endDate = "Não informado";
                }
              }
            } else if (j == 3) {
              List test = divs[j].getElementsByTagName("a");

              for (var element in test) {
                if (element.className.toString().contains("facebook")) {
                  facebookLink = element.attributes["href"];
                } else if (element.className.toString().contains("twitter")) {
                  twitterLink = element.attributes["href"];
                } else if (element.className.toString().contains("instagram")) {
                  instagramLink = element.attributes["href"];
                } else if (element.className.toString().isNotEmpty) {
                  webLink = element.attributes["href"];
                }
              }
            }
          }
        } else if (i == 2) {
        } else if (i == 3) {
          organizador =
              '${res[3].getElementsByTagName("h1").first.text} - ${res[3].getElementsByTagName("p").first.text}';
        }
      }
      return e;
    }).toList();

    EventDataEntity eventDataEntity = EventDataEntity(
      title: title,
      local: local,
      address: address,
      initDate: initDate,
      endDate: endDate,
      organizador: organizador,
      instagramLink: instagramLink,
      facebookLink: facebookLink,
      twitterLink: twitterLink,
      webLink: webLink,
    );

    return eventDataEntity;
  }
}
