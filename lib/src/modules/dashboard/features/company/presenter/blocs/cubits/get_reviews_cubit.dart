
import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/usecases/get_reviews_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_reviews_states.dart';

class GetReviewsCubit extends Cubit<GetReviewsStates> {
  final GetReviewsUsecase usecase;

  GetReviewsCubit({required this.usecase})
      : super(GetReviewsInitialState());

  Future<void> getReviews(String companyId) async {
    emit(GetReviewsLoadingState());

    var result = await usecase(companyId);

    result.fold(
      (Failure failure) => emit(GetReviewsErrorState(failure: failure)),
      (dynamic success) => emit(
        GetReviewsSuccessState(result: success),
      ),
    );
  }
}
