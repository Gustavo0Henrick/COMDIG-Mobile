import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_search_repository.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/infra/datasources/i_search_datasource.dart';
import 'package:comdig/src/shared/models/list_company_items_model.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDatasource datasource;

  const SearchRepository({required this.datasource});

  @override
  Future<Either<Failure, List<CompanyItemEntity>>> search(String input) async {
    try {
      ListCompanyItemsModel result = await datasource.search(input);

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
