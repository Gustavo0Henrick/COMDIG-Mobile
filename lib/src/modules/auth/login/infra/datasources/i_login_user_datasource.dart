import 'package:comdig/src/modules/auth/login/infra/models/login_user_model.dart';

abstract interface class ILoginUserDatasource {
  Future loginUser(LoginUserModel loginUserModel);
}
