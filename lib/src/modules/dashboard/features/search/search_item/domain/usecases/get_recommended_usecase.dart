import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/repositories/i_get_recommended_repository.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:dartz/dartz.dart';

class GetRecommendedUsecase
    implements IUsecase<List<CompanyItemEntity>, NoParams> {
  final IGetRecommendedRepository repository;

  const GetRecommendedUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CompanyItemEntity>>> call(NoParams params) async {
    return await repository.getRecommended();
  }
}
