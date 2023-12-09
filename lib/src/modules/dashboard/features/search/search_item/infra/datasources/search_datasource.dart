import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_search_datasource.dart';
import 'package:comdig/src/shared/models/list_company_items_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class SearchDatasource implements ISearchDatasource {
  final IAppRequester requester;

  const SearchDatasource({required this.requester});

  @override
  Future search(String input) async {
    return await requester.get(
      url: EndpointsHelper.searchCompanies(input),
      fromJson: (value) => ListCompanyItemsModel.fromMap(value),
    );
  }
}
