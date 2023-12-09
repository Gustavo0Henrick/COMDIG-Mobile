import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/remove_favorite_states.dart';

class RemoveFavoriteCubit extends Cubit<RemoveFavoriteStates> {
  final RemoveFavoriteUsecase usecase;

  RemoveFavoriteCubit({required this.usecase})
      : super(RemoveFavoriteInitialState());

  Future<void> removeFavorite(String companyId) async {
    emit(RemoveFavoriteLoadingState());

    final result = await usecase(companyId);

    result.fold(
      (Failure failure) => emit(RemoveFavoriteErrorState(failure: failure)),
      (dynamic success) => emit(RemoveFavoriteSuccessState(result: success)),
    );
  }
}
