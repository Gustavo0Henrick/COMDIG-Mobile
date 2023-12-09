import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_get_categories_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/models/list_category_items_model.dart';
import 'package:comdig/src/shared/endpoints/endpoints_helper.dart';
import 'package:comdig/src/shared/requester/i_app_requester.dart';

class GetCategoriesDatasource implements IGetCategoriesDatasource {
  final IAppRequester requester;

  const GetCategoriesDatasource({required this.requester});

  @override
  Future getCategories() async {
    return await requester.get(
      url: EndpointsHelper.categories,
      fromJson: (value) => ListCategoryItemsModel.fromMap({"listCategoryItemsModels": value}),
    );
  }
}
