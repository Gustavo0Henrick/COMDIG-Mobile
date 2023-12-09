import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/i_reset_password_datasource.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class ResetPasswordDatasource implements IResetPasswordDatasource {
  final IAppRequester requester;

  const ResetPasswordDatasource({required this.requester});

  @override
  Future resetPassword(
      ({String code, String email, String password}) resetData) async {
    return await requester.post(
      url: "",
      body: {
        "code": resetData.code,
        "password": resetData.password,
        "email": resetData.email
      },
      fromJson: (value) => true,
    );
  }
}
