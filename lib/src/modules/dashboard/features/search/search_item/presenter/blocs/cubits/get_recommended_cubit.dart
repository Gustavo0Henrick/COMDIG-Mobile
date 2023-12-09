
import 'package:comdig/src/modules/dashboard/features/search/search_item/domain/usecases/get_recommended_usecase.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/helpers/i_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_recommended_states.dart';

class GetRecommendedCubit extends Cubit<GetRecommendedStates> {
  final GetRecommendedUsecase usecase;

  GetRecommendedCubit({required this.usecase})
      : super(GetRecommendedInitialState());

  Future<void> getRecommended() async {
    emit(GetRecommendedLoadingState());

    var result = await usecase(NoParams());

    result.fold(
      (Failure failure) => emit(GetRecommendedErrorState(failure: failure)),
      (List<CompanyItemEntity> success) =>
          emit(GetRecommendedSuccessState(result: success)),
    );
  }
}
