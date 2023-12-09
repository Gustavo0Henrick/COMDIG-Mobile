import 'package:comdig/src/modules/auth/forgotPassword/infra/datasources/i_send_forgot_password_code_datasource.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class SendForgotPasswordCodeDatasource
    implements ISendForgotPasswordCodeDatasource {
  final IAppRequester requester;

  const SendForgotPasswordCodeDatasource({required this.requester});

  @override
  Future sendForgotPasswordCode(String email) async {
    return await requester.post(
      url: "",
      fromJson: (_) => true,
    );
  }
}
