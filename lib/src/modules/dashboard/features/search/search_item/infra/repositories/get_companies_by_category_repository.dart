import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_get_companies_by_category_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_get_companies_by_category_datasource.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/models/list_company_items_model.dart';
import 'package:dartz/dartz.dart';

class GetCompaniesByCategoryRepository
    implements IGetCompaniesByCategoryRepository {
  final IGetCompaniesByCategoryDatasource datasource;

  const GetCompaniesByCategoryRepository({required this.datasource});

  @override
  Future<Either<Failure, List<CompanyItemEntity>>> getCompaniesByCategory(
      String category) async {
    try {
      ListCompanyItemsModel response =
          await datasource.getCompaniesByCategory(category);

      return Right<Failure, List<CompanyItemEntity>>(
          response.listCompanyItemsModels);
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
