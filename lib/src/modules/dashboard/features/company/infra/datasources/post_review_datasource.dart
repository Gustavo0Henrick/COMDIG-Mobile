import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_post_review_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/models/post_review_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class PostReviewDatasource implements IPostReviewDatasource {
  final IAppRequester requester;

  const PostReviewDatasource({required this.requester});

  @override
  Future postReview(PostReviewModel postReviewModel) async {
    return await requester.post(
      url: EndpointsHelper.addReviewToCompany,
      body: postReviewModel.toMap(),
      fromJson: (value) => value,
    );
  }
}
