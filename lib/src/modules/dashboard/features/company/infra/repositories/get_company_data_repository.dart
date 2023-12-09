import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_get_company_data_repository.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_get_company_data_datasource.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class GetCompanyDataRepository implements IGetCompanyDataRepository {
  final IGetCompanyDataDatasource datasource;

  const GetCompanyDataRepository({required this.datasource});

  @override
  Future<Either<Failure, CompanyItemEntity>> getCompanyById(
      String companyId) async {
    try {
      CompanyItemEntity response = await datasource.getCompanyById(companyId);

      return Right<Failure, CompanyItemEntity>(response);
    } on ServerException catch (e) {
      return Left<Failure, CompanyItemEntity>(
          ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, CompanyItemEntity>(
          UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, CompanyItemEntity>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, CompanyItemEntity>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, CompanyItemEntity>(GeneralFailure(e.toString()));
    }
  }
}
