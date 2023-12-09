import 'package:comdig/src/modules/dashboard/features/home/featured_companies/domain/usecases/get_featured_companies_usecase.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_featured_companies_states.dart';

class GetFeaturedCompaniesCubit extends Cubit<GetFeaturedCompaniesStates> {
  final GetFeaturedCompaniesUsecase usecase;

  GetFeaturedCompaniesCubit({required this.usecase})
      : super(GetFeaturedCompaniesInitialState());

  Future<void> getFeaturedCompanies() async {
    emit(GetFeaturedCompaniesLoadingState());

    final result = await usecase(NoParams());

    result.fold(
      (Failure failure) =>
          emit(GetFeaturedCompaniesErrorState(failure: failure)),
      (List<CompanyItemEntity> success) =>
          emit(GetFeaturedCompaniesSuccessState(result: success)),
    );
  }
}
