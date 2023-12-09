import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/infra/datasources/i_get_nearby_companies_datasource.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/models/list_company_items_model.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetNearbyCompaniesDatasource implements IGetNearbyCompaniesDatasource {
  final IAppRequester requester;

  const GetNearbyCompaniesDatasource({required this.requester});

  @override
  Future getNearbyCompanies(String userId) async {
    return await requester.get(
      url: EndpointsHelper.getNearbyCompaniesById(userId),
      fromJson: (value) => ListCompanyItemsModel.fromMap(value),
    );
  }
}
