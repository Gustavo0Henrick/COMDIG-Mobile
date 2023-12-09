import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/infra/datasources/i_add_favorite_datasource.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';

class AddFavoriteDatasource implements IAddFavoriteDatasource {
  final IAppRequester requester;

  const AddFavoriteDatasource({required this.requester});

  @override
  Future addFavoriteById(String companyId) async {
    String userId =
        await SecureStorageManager().readData(StorageKeys.userId) ?? "";

    return await requester.post(
      url: EndpointsHelper.addFavoriteById(userId),
      body: {"companyId": companyId},
      fromJson: (value) => value,
    );
  }
}
