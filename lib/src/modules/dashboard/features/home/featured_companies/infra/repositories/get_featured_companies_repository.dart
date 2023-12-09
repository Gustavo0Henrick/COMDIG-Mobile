import 'package:comdig/src/modules/dashboard/features/home/featured_companies/domain/repositories/i_get_featured_companies_repository.dart';
import 'package:comdig/src/modules/dashboard/features/home/featured_companies/infra/datasources/i_get_featured_companies_datasource.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/models/list_company_items_model.dart';
import 'package:dartz/dartz.dart';

class GetFeaturedCompaniesRepository
    implements IGetFeaturedCompaniesRepository {
  final IGetFeaturedCompaniesDatasource datasource;

  const GetFeaturedCompaniesRepository({required this.datasource});

  @override
  Future<Either<Failure, List<CompanyItemEntity>>>
      getFeaturedCompanies() async {
    try {
      ListCompanyItemsModel result = await datasource.getFeaturedCompanies();

      return Right<Failure, List<CompanyItemEntity>>(
          result.listCompanyItemsModels);
    } on ServerException catch (e) {
      return Left<Failure, List<CompanyItemEntity>>(
          ServerFailure(e.message.toString()));
    } on UnauthorizedException catch (e) {
      return Left<Failure, List<CompanyItemEntity>>(
          UnauthorizedFailure(e.message.toString()));
    } on BadRequestException catch (e) {
      return Left<Failure, List<CompanyItemEntity>>(
          BadRequestFailure(e.message.toString()));
    } on RequestException catch (e) {
      return Left<Failure, List<CompanyItemEntity>>(
          RequestFailure(e.message.toString()));
    } catch (e) {
      return Left<Failure, List<CompanyItemEntity>>(
          GeneralFailure(e.toString()));
    }
  }
}
