import 'package:comdig/src/modules/dashboard/features/home/featured_companies/infra/datasources/i_get_featured_companies_datasource.dart';
import 'package:comdig/src/shared/models/list_company_items_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetFeaturedCompaniesDatasource
    implements IGetFeaturedCompaniesDatasource {
  final IAppRequester requester;

  const GetFeaturedCompaniesDatasource({required this.requester});

  @override
  Future getFeaturedCompanies() async {
    return await requester.get(
      url: EndpointsHelper.getFeaturedCompaniesCompanies,
      fromJson: (value) => ListCompanyItemsModel.fromMap(value),
    );
  }
}
