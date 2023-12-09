import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/models/search_item_model.dart';
import 'package:equatable/equatable.dart';

class ListSearchItemsModel extends Equatable {
  final List<SearchItemModel> listSearchItemModels;

  const ListSearchItemsModel({required this.listSearchItemModels});

  @override
  List<List<SearchItemModel>> get props => [listSearchItemModels];

  Map<String, dynamic> toMap() {
    return {
      'listSearchItemModels':
          listSearchItemModels.map((x) => x.toMap()).toList(),
    };
  }

  factory ListSearchItemsModel.fromMap(Map<String, dynamic> map) {
    return ListSearchItemsModel(
      listSearchItemModels: List<SearchItemModel>.from(
          map['listSearchItemModels']?.map((x) => SearchItemModel.fromMap(x))),
    );
  }
}
