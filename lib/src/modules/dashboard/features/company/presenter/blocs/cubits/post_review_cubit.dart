import 'package:comdig/src/modules/dashboard/features/company/domain/entities/post_review_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/usecases/post_review_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/post_review_states.dart';

class PostReviewCubit extends Cubit<PostReviewStates> {
  final PostReviewUsecase usecase;

  PostReviewCubit({required this.usecase}) : super(PostReviewInitialState());

  Future<void> postReview(PostReviewEntity postReviewEntity) async {
    emit(PostReviewLoadingState());

    var result = await usecase(postReviewEntity);

    result.fold(
      (Failure failure) => emit(PostReviewErrorState(failure: failure)),
      (dynamic success) => emit(
        PostReviewSuccessState(result: success),
      ),
    );
  }
}
