import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/entities/category_item_entity.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_get_categories_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesUsecase
    implements IUsecase<List<CategoryItemEntity>, NoParams> {
  final IGetCategoriesRepository repository;
  const GetCategoriesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CategoryItemEntity>>> call(
      NoParams params) async {
    return await repository.getCategories();
  }
}
