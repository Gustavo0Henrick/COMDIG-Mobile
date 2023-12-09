import 'package:comdig/src/modules/auth/login/infra/datasources/i_login_user_datasource.dart';
import 'package:comdig/src/modules/auth/login/infra/models/login_response_model.dart';
import 'package:comdig/src/modules/auth/login/infra/models/login_user_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class LoginUserDatasource implements ILoginUserDatasource {
  final IAppRequester requester;

  const LoginUserDatasource({required this.requester});

  @override
  Future loginUser(LoginUserModel loginUserModel) async {
    return await requester.post(
      url: EndpointsHelper.loginUser,
      body: loginUserModel.toMap(),
      fromJson: (value) => LoginResponseModel.fromMap(value),
    );
  }
}
