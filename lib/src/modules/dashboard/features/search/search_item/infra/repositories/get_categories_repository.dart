import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/entities/category_item_entity.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_get_categories_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_get_categories_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/models/list_category_items_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesRepository implements IGetCategoriesRepository {
  final IGetCategoriesDatasource datasource;

  const GetCategoriesRepository({required this.datasource});

  @override
  Future<Either<Failure, List<CategoryItemEntity>>> getCategories() async {
    try {
      ListCategoryItemsModel result = await datasource.getCategories();

      return Right<Failure, List<CategoryItemEntity>>(
          result.listCategoryItemsModels);
    } on ServerException catch (e) {
      return Left<Failure, List<CategoryItemEntity>>(
          ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, List<CategoryItemEntity>>(
          UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, List<CategoryItemEntity>>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, List<CategoryItemEntity>>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, List<CategoryItemEntity>>(
          GeneralFailure(e.toString()));
    }
  }
}
