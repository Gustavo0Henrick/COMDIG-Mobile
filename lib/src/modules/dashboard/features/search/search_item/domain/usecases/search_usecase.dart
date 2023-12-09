import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_search_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class SearchUsecase implements IUsecase<List<CompanyItemEntity>, String> {
  final ISearchRepository repository;

  SearchUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CompanyItemEntity>>> call(String params) async {
    return await repository.search(params);
  }
}
