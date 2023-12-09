import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_get_companies_by_category_datasource.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/models/list_company_items_model.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetCompaniesByCategoryDatasource
    implements IGetCompaniesByCategoryDatasource {
  final IAppRequester requester;

  const GetCompaniesByCategoryDatasource({required this.requester});

  @override
  Future getCompaniesByCategory(String category) async {
    return await requester.get(
      url: EndpointsHelper.getCompaniesByCategory(category),
      fromJson: (value) => ListCompanyItemsModel.fromMap(value),
    );
  }
}
