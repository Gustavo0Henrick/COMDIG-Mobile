import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_get_company_data_repository.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetCompanyDataUsecase implements IUsecase<CompanyItemEntity, String> {
  final IGetCompanyDataRepository repository;

  const GetCompanyDataUsecase({required this.repository});

  @override
  Future<Either<Failure, CompanyItemEntity>> call(String companyId) async {
    return await repository.getCompanyById(companyId);
  }
}
