import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/domain/repositories/i_get_nearby_companies_repositories.dart';
import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/infra/datasources/i_get_nearby_companies_datasource.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class GetNearbyCompaniesRepository implements IGetNearbyCompaniesRepository {
  final IGetNearbyCompaniesDatasource datasource;

  const GetNearbyCompaniesRepository({required this.datasource});

  @override
  Future<Either<Failure, List<CompanyItemEntity>>> getNearbyCompanies(
      String userId) async {
    try {
      List<CompanyItemEntity> result =
          await datasource.getNearbyCompanies(userId);

      return Right<Failure, List<CompanyItemEntity>>(result);
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
