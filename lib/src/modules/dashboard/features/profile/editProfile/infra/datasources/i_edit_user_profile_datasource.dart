import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/models/edit_user_profile_model.dart';

abstract interface class IEditUserProfileDatasource {
  Future editUserProfile(EditUserProfileModel editUserProfileModel);
}
