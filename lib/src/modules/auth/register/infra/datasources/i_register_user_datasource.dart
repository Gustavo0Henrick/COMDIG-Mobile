import 'package:comdig/src/modules/auth/register/infra/models/user_data_model.dart';

abstract interface class IRegisterUserDatasource {
  Future registerUser(UserDataModel userDataModel);
}
