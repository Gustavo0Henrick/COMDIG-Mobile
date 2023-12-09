import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/domain/usecases/add_favorite_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/add_favorite_states.dart';

class AddFavoriteCubit extends Cubit<AddFavoriteStates> {
  final AddFavoriteUsecase usecase;

  AddFavoriteCubit({required this.usecase}) : super(AddFavoriteInitialState());

  Future<void> addFavorite(String companyId) async {
    emit(AddFavoriteLoadingState());

    final result = await usecase(companyId);

    result.fold(
      (Failure failure) => emit(AddFavoriteErrorState(failure: failure)),
      (dynamic success) => emit(AddFavoriteSuccessState(result: success)),
    );
  }
}
