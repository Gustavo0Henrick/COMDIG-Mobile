import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/infra/datasources/i_remove_favorite_datasource.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';

class RemoveFavoriteDatasource implements IRemoveFavoriteDatasource {
  final IAppRequester requester;

  const RemoveFavoriteDatasource({required this.requester});

  @override
  Future removeFavoriteById(String companyId) async {
    String userId =
        await SecureStorageManager().readData(StorageKeys.userId) ?? "";

    return await requester.delete(
      url: EndpointsHelper.removeFavoriteById(userId),
      body: {"companyId": companyId},
      fromJson: (value) => value,
    );
  }
}
