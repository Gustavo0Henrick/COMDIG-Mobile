import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/datasources/i_get_favorites_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/models/list_favorites_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetFavoritesDatasource implements IGetFavoritesDatasource {
  final IAppRequester requester;

  const GetFavoritesDatasource({required this.requester});

  @override
  Future getFavorites(String userId) async {
    return await requester.get(
      url: EndpointsHelper.getAllFavoritesById(userId),
      fromJson: (value) =>
          ListFavoritesModel.fromMap({"listFavoriteModels": value}),
    );
  }
}
