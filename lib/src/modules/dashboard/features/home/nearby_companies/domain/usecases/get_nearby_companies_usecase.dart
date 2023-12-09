import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/domain/repositories/i_get_nearby_companies_repositories.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetNearbyCompaniesUsecase
    implements IUsecase<List<CompanyItemEntity>, String> {
  final IGetNearbyCompaniesRepository repository;

  const GetNearbyCompaniesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CompanyItemEntity>>> call(String userId) async {
    return await repository.getNearbyCompanies(userId);
  }
}
