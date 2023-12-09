import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/entities/category_item_entity.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/usecases/get_categories_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_categories_states.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesStates> {
  final GetCategoriesUsecase usecase;

  GetCategoriesCubit({required this.usecase})
      : super(GetCategoriesInitialState());

  Future<void> getCategories() async {
    emit(GetCategoriesLoadingState());

    var result = await usecase(NoParams());

    result.fold(
      (Failure failure) => emit(GetCategoriesErrorState(failure: failure)),
      (List<CategoryItemEntity> success) =>
          emit(GetCategoriesSuccessState(result: success)),
    );
  }
}
