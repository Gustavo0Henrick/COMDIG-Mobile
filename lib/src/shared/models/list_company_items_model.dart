import 'package:comdig/src/shared/models/company_item_model.dart';
import 'package:equatable/equatable.dart';

class ListCompanyItemsModel extends Equatable {
  final List<CompanyItemModel> listCompanyItemsModels;

  const ListCompanyItemsModel({required this.listCompanyItemsModels});

  @override
  List<List<CompanyItemModel>> get props => [listCompanyItemsModels];

  Map<String, dynamic> toMap() {
    return {
      'listCompanyItemsModels':
          listCompanyItemsModels.map((x) => x.toMap()).toList(),
    };
  }

  factory ListCompanyItemsModel.fromMap(List map) {
    return ListCompanyItemsModel(
      listCompanyItemsModels: List<CompanyItemModel>.from(
        map.map((x) => CompanyItemModel.fromMap(x)),
      ),
    );
  }
}
