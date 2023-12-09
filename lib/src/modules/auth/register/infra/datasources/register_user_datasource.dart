import 'package:comdig/src/modules/auth/register/infra/datasources/i_register_user_datasource.dart';
import 'package:comdig/src/modules/auth/register/infra/models/register_response_model.dart';
import 'package:comdig/src/modules/auth/register/infra/models/user_data_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class RegisterUserDatasource implements IRegisterUserDatasource {
  final IAppRequester requester;

  const RegisterUserDatasource({required this.requester});

  @override
  Future registerUser(UserDataModel userDataModel) async {
    return await requester.post(
      url: EndpointsHelper.registerUser,
      body: userDataModel.toMap(),
      fromJson: (value) => RegisterResponseModel.fromMap(value),
    );
  }
}
