import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/datasources/i_get_my_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/models/my_profile_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetMyProfileDatasource implements IGetMyProfileDatasource {
  final IAppRequester requester;

  const GetMyProfileDatasource({required this.requester});

  @override
  Future getMyProfile(String userId) async {
    return await requester.get(
      url: EndpointsHelper.getMyProfile(userId),
      fromJson: (value) => MyProfileModel.fromMap(value),
    );
  }
}
