import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/infra/models/favorite_model.dart';
import 'package:equatable/equatable.dart';

class ListFavoritesModel extends Equatable {
  final List<FavoriteModel> listFavoriteModels;

  const ListFavoritesModel({required this.listFavoriteModels});

  @override
  List<List<FavoriteModel>?> get props => [listFavoriteModels];

  Map<String, dynamic> toMap() {
    return {
      'listFavoriteModels': listFavoriteModels.map((x) => x.toMap()).toList(),
    };
  }

  factory ListFavoritesModel.fromMap(Map<String, dynamic> map) {
    return ListFavoritesModel(
      listFavoriteModels: List<FavoriteModel>.from(
          map['listFavoriteModels']?.map((x) => FavoriteModel.fromMap(x))),
    );
  }
}
