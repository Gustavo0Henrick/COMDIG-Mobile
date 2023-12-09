part of '../cubits/remove_favorite_cubit.dart';

abstract class RemoveFavoriteStates extends Equatable {}

class RemoveFavoriteInitialState extends RemoveFavoriteStates {
  @override
  List<Object?> get props => [];
}

class RemoveFavoriteLoadingState extends RemoveFavoriteStates {
  @override
  List<Object?> get props => [];
}

class RemoveFavoriteSuccessState extends RemoveFavoriteStates {
  final dynamic result;

  RemoveFavoriteSuccessState({required this.result});

  @override
  List<dynamic> get props => [result];
}

class RemoveFavoriteErrorState extends RemoveFavoriteStates {
  final Failure failure;

  RemoveFavoriteErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
