import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_get_company_datasource.dart';
import 'package:comdig/src/shared/models/list_company_items_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetRecommendedDatasource implements IGetRecommendedDatasource {
  final IAppRequester requester;

  const GetRecommendedDatasource({required this.requester});

  @override
  Future getRecommended() async {
    return await requester.get(
      url: EndpointsHelper.getRecommendedCompanies,
      fromJson: (value) => ListCompanyItemsModel.fromMap(value),
    );
  }
}
