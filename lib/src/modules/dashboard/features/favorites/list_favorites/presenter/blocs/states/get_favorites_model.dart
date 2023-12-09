part of '../cubits/get_favorites_cubit.dart';


abstract class GetFavoritesStates extends Equatable {}

class GetFavoritesInitialState extends GetFavoritesStates {
  @override
  List<Object?> get props => [];
}

class GetFavoritesLoadingState extends GetFavoritesStates {
  @override
  List<Object?> get props => [];
}

class GetFavoritesSuccessState extends GetFavoritesStates {
  final List<FavoriteEntity> result;

  GetFavoritesSuccessState({required this.result});

  @override
  List<List<FavoriteEntity>> get props => [result];
}

class GetFavoritesErrorState extends GetFavoritesStates {
  final Failure failure;

  GetFavoritesErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
