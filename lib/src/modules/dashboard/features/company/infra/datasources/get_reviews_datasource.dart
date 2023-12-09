import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_get_reviews_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/models/reviews_info_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetReviewsDatasource implements IGetReviewsDatasource {
  final IAppRequester requester;

  const GetReviewsDatasource({required this.requester});

  @override
  Future getReviews(String companyId) async {
    return await requester.get(
      url: EndpointsHelper.getReviewsCompanyById(companyId),
      fromJson: (value) => ReviewsInfoModel.fromMap({"reviews": value}),
    );
  }
}
