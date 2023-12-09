import 'package:comdig/src/modules/dashboard/features/home/carousel/infra/datasources/i_get_home_ads_datasource.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetHomeAdsDatasource implements IGetHomeAdsDatasource {
  final IAppRequester requester;

  const GetHomeAdsDatasource({required this.requester});

  @override
  Future getHomeAds() async {
    return await requester.get(
      url: EndpointsHelper.getHomeAds,
      fromJson: (value) {},
    );
  }
}
