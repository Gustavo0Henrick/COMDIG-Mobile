import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/usecases/search_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchUsecase usecase;

  SearchCubit({required this.usecase}) : super(SearchInitialState());

  Future<void> search(String input) async {
    emit(SearchLoadingState());

    var result = await usecase(input);

    result.fold(
      (Failure failure) => emit(SearchErrorState(failure: failure)),
      (List<CompanyItemEntity> success) =>
          emit(SearchSuccessState(result: success)),
    );
  }

  Future<void> cleanSearch() async {
    emit(SearchInitialState());
  }
}
