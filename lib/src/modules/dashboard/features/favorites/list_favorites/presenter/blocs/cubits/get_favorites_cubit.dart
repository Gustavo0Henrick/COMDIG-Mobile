import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/entities/favorite_entity.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/get_favorites_model.dart';

class GetFavoritesCubit extends Cubit<GetFavoritesStates> {
  final GetFavoritesUsecase usecase;

  GetFavoritesCubit({required this.usecase})
      : super(GetFavoritesInitialState());

  Future<void> getFavorites(String userId) async {
    emit(GetFavoritesLoadingState());

    var result = await usecase(userId);

    result.fold(
      (Failure failure) => emit(GetFavoritesErrorState(failure: failure)),
      (List<FavoriteEntity> success) =>
          emit(GetFavoritesSuccessState(result: success)),
    );
  }
}
