import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_get_companies_by_category_repository.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetCompaniesByCategoryUsecase
    implements IUsecase<List<CompanyItemEntity>, String> {
  final IGetCompaniesByCategoryRepository repository;

  const GetCompaniesByCategoryUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CompanyItemEntity>>> call(String category) async {
    return await repository.getCompaniesByCategory(category);
  }
}
