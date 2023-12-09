import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_get_company_data_datasource.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/models/company_item_model.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetCompanyDataDatasource implements IGetCompanyDataDatasource {
  final IAppRequester requester;

  const GetCompanyDataDatasource({required this.requester});

  @override
  Future getCompanyById(String companyId) async {
    return await requester.get(
      url: EndpointsHelper.getCompanyById(companyId),
      fromJson: (value) => CompanyItemModel.fromMap(value),
    );
  }
}
