import 'package:comdig/src/modules/auth/login/infra/datasources/i_get_my_self_datasource.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/models/user_model.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetMySelfDatasource implements IGetMySelfDatasource {
  final IAppRequester requester;

  const GetMySelfDatasource({required this.requester});

  @override
  Future getMySelf(String id) async {
    return await requester.get(
      url: EndpointsHelper.getUserById(id),
      fromJson: (value) => UserModel.fromMap(value),
    );
  }
}
