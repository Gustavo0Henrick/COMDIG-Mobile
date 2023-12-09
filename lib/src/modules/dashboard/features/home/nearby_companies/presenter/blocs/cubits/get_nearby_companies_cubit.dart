import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/domain/usecases/get_nearby_companies_usecase.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_nearby_companies_states.dart';

class GetNearbyCompaniesCubit extends Cubit<GetNearbyCompaniesStates> {
  final GetNearbyCompaniesUsecase usecase;

  GetNearbyCompaniesCubit({required this.usecase})
      : super(GetNearbyCompaniesInitialState());

  Future<void> getNearbyCompanies(String userId) async {
    emit(GetNearbyCompaniesLoadingState());

    final result = await usecase(userId);

    result.fold(
      (Failure failure) => emit(GetNearbyCompaniesErrorState(failure: failure)),
      (List<CompanyItemEntity> success) =>
          emit(GetNearbyCompaniesSuccessState(result: success)),
    );
  }
}
