import 'package:comdig/src/modules/dashboard/features/company/infra/models/post_review_model.dart';

abstract interface class IPostReviewDatasource {
  Future postReview(PostReviewModel postReviewModel);
}
