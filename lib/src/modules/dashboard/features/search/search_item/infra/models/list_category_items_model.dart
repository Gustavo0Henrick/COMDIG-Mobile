import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/models/category_item_model.dart';
import 'package:equatable/equatable.dart';

class ListCategoryItemsModel extends Equatable {
  final List<CategoryItemModel> listCategoryItemsModels;

  const ListCategoryItemsModel({required this.listCategoryItemsModels});

  @override
  List<List<CategoryItemModel>> get props => [listCategoryItemsModels];

  Map<String, dynamic> toMap() {
    return {
      'listCategoryItemsModels':
          listCategoryItemsModels.map((x) => x.toMap()).toList(),
    };
  }

  factory ListCategoryItemsModel.fromMap(Map<String, dynamic> map) {
    return ListCategoryItemsModel(
      listCategoryItemsModels: List<CategoryItemModel>.from(
          map['listCategoryItemsModels']
              ?.map((x) => CategoryItemModel.fromMap(x))),
    );
  }
}
