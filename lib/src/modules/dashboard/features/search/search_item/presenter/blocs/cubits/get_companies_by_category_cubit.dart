import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/usecases/get_companies_by_category_usecase.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_companies_by_category_states.dart';

class GetCompaniesByCategoryCubit extends Cubit<GetCompaniesByCategoryStates> {
  final GetCompaniesByCategoryUsecase usecase;

  GetCompaniesByCategoryCubit({required this.usecase})
      : super(GetCompaniesByCategoryInitialState());

  Future<void> getCompaniesByCategory(String category) async {
    emit(GetCompaniesByCategoryLoadingState());

    var result = await usecase(category);

    result.fold(
      (Failure failure) =>
          emit(GetCompaniesByCategoryErrorState(failure: failure)),
      (List<CompanyItemEntity> success) =>
          emit(GetCompaniesByCategorySuccessState(result: success)),
    );
  }
  Future<void> cleanState() async {
    emit(GetCompaniesByCategoryInitialState());
  }
}
