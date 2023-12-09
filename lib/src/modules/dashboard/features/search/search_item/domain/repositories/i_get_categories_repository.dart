import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/entities/category_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class IGetCategoriesRepository {
  Future<Either<Failure, List<CategoryItemEntity>>> getCategories();
}
