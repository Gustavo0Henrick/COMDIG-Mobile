import 'package:comdig/src/modules/dashboard/features/home/featured_companies/domain/repositories/i_get_featured_companies_repository.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetFeaturedCompaniesUsecase
    implements IUsecase<List<CompanyItemEntity>, NoParams> {
  final IGetFeaturedCompaniesRepository repository;

  const GetFeaturedCompaniesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CompanyItemEntity>>> call(NoParams params) async {
    return await repository.getFeaturedCompanies();
  }
}
