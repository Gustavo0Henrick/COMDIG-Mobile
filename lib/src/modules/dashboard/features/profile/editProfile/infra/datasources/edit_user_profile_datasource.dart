import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/datasources/i_edit_user_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/models/edit_user_profile_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class EditUserProfileDatasource implements IEditUserProfileDatasource {
  final IAppRequester requester;

  const EditUserProfileDatasource({required this.requester});

  @override
  Future editUserProfile(EditUserProfileModel editUserProfileModel) async {
    return await requester.post(
      url: EndpointsHelper.editProfileUserById(editUserProfileModel.id),
      body: editUserProfileModel.toMap(),
      fromJson: (value) => true,
    );
  }
}
